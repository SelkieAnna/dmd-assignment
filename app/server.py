from flask import Flask, jsonify
from queries import Queries

app = Flask(__name__)
db = Queries("localhost", "root", "1234", "Car_sharing")


@app.route("/", methods=['GET'])
def index():
    pass


@app.route("/", methods=['POST'])
def query_1():
    return jsonify(db.query_1(2, 'AN', 'red'))

@app.route("/query_2", methods=['GET'])
def query_2():
    return jsonify(db.query_2(1, '2017-08-14'))

@app.route("/query_4", methods=['GET'])
def query_4():
    return jsonify(db.query_4('1'))

@app.route("/query_5", methods=['GET'])
def query_5():
    return jsonify(db.query_5('2018-10-11'))

if __name__ == '__main__':
    app.run(host='127.0.0.1', debug=True)

# TO DO:
# Car.full_charge надо переместить из Car в Car Model, так как у одинаковых машин будет одинаковый полный заряд