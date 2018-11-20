from flask import Flask, jsonify
from queries import Queries

app = Flask(__name__)
db = Queries("localhost", "root", "1234", "Car_sharing")


@app.route("/", methods=['GET'])
def index():
    pass


@app.route("/", methods=['POST'])
def query_1():
    return jsonify(db.query_1(2))


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

# TO DO:
# Car.full_charge надо переместить из Car в Car Model, так как у одинаковых машин будет одинаковый полный заряд