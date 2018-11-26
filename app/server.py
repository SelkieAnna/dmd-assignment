from flask import Flask, jsonify, render_template, request
from queries import Queries

app = Flask(__name__, template_folder='templates/html')
db = Queries("localhost", "root", "1234", "Car_sharing")


@app.route("/", methods=['GET'])
def index():
    return render_template('index.html')

@app.route("/query_1", methods=['GET'])
def query_1_():
    return render_template('form-1.html')

@app.route("/query_2", methods=['GET'])
def query_2_():
    return render_template('form-2.html')
    pass

@app.route("/query_3", methods=['GET'])
def query_3_():
    return render_template('form-3.html')
    pass

@app.route("/query_4", methods=['GET'])
def query_4_():
    return render_template('form-4.html')
    pass

@app.route("/query_5", methods=['GET'])
def query_5_():
    return render_template('form-5.html')
    pass

@app.route("/query_6", methods=['GET'])
def query_6_():
    return render_template('form-6.html')
    pass

@app.route("/query_7", methods=['GET'])
def query_7_():
    return render_template('form-7.html')
    pass

@app.route("/query_8", methods=['GET'])
def query_8_():
    return render_template('form-8.html')
    pass

@app.route("/query_9", methods=['GET'])
def query_9_():
    return render_template('form-9.html')
    pass

@app.route("/query_10", methods=['GET'])
def query_10_():
    return render_template('form-10.html')
    pass

@app.route("/query_1", methods=['POST'])
def query_1():
    input = request.form
    print(input)
    query = db.query_1(input['customer_id'],
                       input['reg_number_start'],
                       input['color'])
    return render_template("table-1.html", query=query)


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
