import socket
import sys
import traceback
import time
import binascii
import struct
import boto3 #for Amazon SNS
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText
import smtplib
import psycopg2


def main():

   #email settings
   email = False
   TLS = True #enable for starttls
   fromaddr = 'me@gmail.com'
   toaddr = 'you@gmail.com'
   euser = 'me@gmail.com'
   epassword = 'password'#user and password only required if TLS == True
   smtp_server = 'smtp.gmail.com'
   smtp_port = 587

   #SMS settings
   SMS = False #enable or disable SMS notification
   PhoneNumber = "+12018675309"



   #logging settings
   logfile = "temperature.log"
   errorlog = "error.log"

   #alerting ranges 'sensor MAC': (minC,maxC)
   ranges = {'2c3ae80ac099': (25,43), 
             '6001944f0482': (20,25)}


   #where to listen for packets
   UDP_IP = "0.0.0.0"
   UDP_PORT = 30

   sock = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
   sock.bind((UDP_IP, UDP_PORT))
   #database settings:
   database = True
   dbname = "esplogger"
   dbhost = "localhost"
   dbuser = "esplogger"
   dbpass = "password"

   if SMS == True:
      SNS = boto3.client(
          "sns",
          aws_access_key_id="keyid",
          aws_secret_access_key="secret",
          region_name="us-east-1"
      )
      # Create the topic if it doesn't exist
      topic = SNS.create_topic(Name="notifications")
      topic_arn = topic['TopicArn']  # get its Amazon Resource Name

      SNS.subscribe(
        TopicArn=topic_arn,
        Protocol='sms',
        Endpoint=PhoneNumber
      )

   if database == True:
      try:
         connstr = "dbname='%s' user='%s' host='%s' password='%s'" % (dbname,dbuser,dbhost,dbpass)
         conn = psycopg2.connect(connstr)
         cursor = conn.cursor()
      except:
         err = traceback.format_exc()
         file = open(errorlog,"a")
         file.write("Error Connecting to Database\n")
         file.write(err)
         file.close()
         print "Error Connecting to Database\n", err     

   while True:
      #wait for data
      data, addr = sock.recvfrom(1024)
      #decode packet
      databytes = bytearray(data)
      serial = bytearray(6)
      id = bytearray(2)
      value = bytearray(4)
      for i in range(0,6):
         serial[i] = databytes[i]
      for i in range(6,8):
         id[i-6] = databytes[i]
      for i in range (8,12):
         value[i-8] = databytes[i]
      #convert decoded formats
      serial_str = binascii.b2a_hex(serial)
      id_str = binascii.b2a_hex(id)
      b = ''.join(chr(i) for i in value)
      value_float = struct.unpack('>f', b)[0]
      value_str = binascii.b2a_hex(value)
      #compose a line to log
      line = ("%s,%s,%s,%s\n" % (time.time(), serial_str, id_str, value_float))
      #write line to screen
      print line
      #write to log
      file = open(logfile,"a")
      file.write(line)
      file.close()
      #write to db
      if database == True:
         cursor.execute("INSERT INTO esp_log (sample_host, sample_id, sample_value) VALUES (%s,%s,%s)", (serial_str,id,value_float))
         conn.commit()
      
      try:
         if (value_float > ranges[serial_str][1]) or (value_float < ranges[serial_str][0]): #if the current value is out of the acceptable range, alert
            print "Alert! Temperature out of range!"
            try:
               if email == True:
                  #compose email
                  msg = MIMEMultipart()
                  msg['From'] = fromaddr
                  msg['To'] = toaddr
                  msg['Subject'] = "Sensor Reading"
                  body = ("Alert! Sensor Out of range! \nCurrent Sensor Reading for sensor id %s is %s\n" % (serial_str, value_float))
                  msg.attach(MIMEText(body,'plain'))
                  #send email
                  server = smtplib.SMTP(smtp_server,smtp_port)
                  server.ehlo()
                  if TLS == True:
                     server.starttls()
                     server.login(euser,epassword)
                  server.sendmail(fromaddr, toaddr, msg.as_string())
                  server.quit()
            except:
               file = open(errorlog,"a")
               file.write("Error Sending Email\n")
               err = traceback.format_exc()
               file.write(err)
               file.close()
               print "Error Sending Email", err
            try:
               if SMS == True:
                  SNS.publish(
                      Message=body,
                      TopicArn=topic_arn
                  )
            except:
               err = traceback.format_exc()
               file = open(errorlog,"a")
               file.write("Error Sending SMS\n")
               file.write(err)
               file.close()
               print "Error Sending SMS", err
      except KeyError:
         err = "Warning: Sensor %s:%s does not have a configured range\n" % (serial_str, id_str)
         print err
         file = open(errorlog,"a")
         file.write(err)
         file.close()
   
   
if __name__ == '__main__':
   sys.exit(main())  
