from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/getjson', methods=['GET'])
def get_json():
    if(request.method == 'GET'):
        data = {
            "Message" : "Hello Flask"
        }
        return jsonify(data)