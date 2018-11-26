from flask import Flask, jsonify, render_template
from queries import Queries

app = Flask(__name__, template_folder='templates/html')
db = Queries("localhost", "root", "1234", "Car_sharing")


@app.route("/", methods=['GET'])
def index():
    pass


@app.route("/query_1", methods=['POST'])
def query_1():
    query = db.query_1(2, 'AN', 'red')
    return render_template("table-1.html", query)


@app.route("/query_2", methods=['POST'])
def query_2():
    return jsonify(db.query_2(1, '2017-08-14'))


@app.route("/query_3", methods=['POST'])
def query_3():
    return jsonify(db.query_3('2018-10-09', '2018-10-12'))


@app.route("/query_4", methods=['POST'])
def query_4():
    return jsonify(db.query_4('1'))


@app.route("/query_5", methods=['POST'])
def query_5():
    return jsonify(db.query_5('2018-10-11'))


@app.route("/query_6", methods=['POST'])
def query_6():
    return jsonify(db.query_6(3))


@app.route("/query_7", methods=['POST'])
def query_7():
    return jsonify(db.query_7('2000-01-01', '2019-01-01', 1))


@app.route("/query_8", methods=['POST'])
def query_8():
    return jsonify(db.query_8('2018-10-11'))


@app.route("/query_9", methods=['POST'])
def query_9():
    return jsonify(db.query_9('2018-10-11'))


@app.route("/query_10", methods=['POST'])
def query_10():
    return jsonify(db.query_10())


if __name__ == '__main__':
    app.run(host='127.0.0.1', debug=True)
