from flask import Flask, request
from flask_restful import Resource, Api
from sqlalchemy import create_engine, table, column
from json import dumps
from flask.json import jsonify
import traceback

db = create_engine('postgres://user:password@host:5432/esplogger')
app = Flask(__name__)
api = Api(app)


esp_names_to_mac = table("esp_names_to_mac", 
                           column("mac"),
                           column("id"),
                           column("name")
                        )


class CurrentValue(Resource):
   def get(self):
      conn = db.connect()
      args = request.args
      limit = 0
      try:
         limit = int(args['limit'])         
      except:
         pass
      if limit > 0:
         querystr = "select sample_time, sample_host, sample_value from esp_log ORDER BY sample_num desc LIMIT %s" % limit
      else:
         querystr = "select sample_time, sample_host, sample_value from esp_log ORDER BY sample_num desc"         
      query = conn.execute(querystr)
      result = {'data': [dict(zip(tuple (query.keys()) ,i)) for i in query.cursor]}
      return jsonify(result)

class FriendlyName(Resource):
   def get(self):
      args = request.args
      conn = db.connect()
      try:
         mac = args['mac']
         querystr = "select mac, name from esp_names_to_mac where mac = '%s'" % args['mac']
         query = conn.execute(querystr) 
         result = {'data': [dict(zip(tuple (query.keys()) ,i)) for i in query.cursor]}
         return jsonify(result)
      except:
         err = traceback.format_exc()
         print (err)
         pass
      try:
         mac = args['name']
         querystr = "select mac, name from esp_names_to_mac where name = '%s'" % args['name']
         query = conn.execute(querystr) 
         result = {'data': [dict(zip(tuple (query.keys()) ,i)) for i in query.cursor]}
         return jsonify(result)
      except:
         pass
      return {}
   def post(self):
      try:
         conn = db.connect()
         json_data = request.get_json()
         id_bytes = bytes.fromhex(json_data['id'])
         query = conn.execute("insert into esp_names_to_mac (mac, id, name) values (%s, %s, %s)", (json_data['mac'],id_bytes,json_data['name']))
         conn.commit()
         return "insert"
      except:
         pass
         err = traceback.format_exc()
         print (err)
         return "fail"
      
            
api.add_resource(CurrentValue, '/CurrentValue')
api.add_resource(FriendlyName, '/FriendlyName')
      
      
if __name__ == '__main__':
   app.run(port='5002',host="0.0.0.0")