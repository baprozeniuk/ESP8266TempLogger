import socket
import time
import binascii
import struct
UDP_IP = "0.0.0.0"
UDP_PORT = 8030

sock = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
sock.bind((UDP_IP, UDP_PORT))

while True:
   data, addr = sock.recvfrom(1024)
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
   serial_str = binascii.b2a_hex(serial)
   id_str = binascii.b2a_hex(id)
   b = ''.join(chr(i) for i in value)
   value_float = struct.unpack('>f', b)[0]
   value_str = binascii.b2a_hex(value)
   line = ("%s,%s,%s,%s\n" % (time.time(), serial_str, id_str, value_float))
   print line
   file = open("temperature.log","a")
   file.write(line)
   file.close()
