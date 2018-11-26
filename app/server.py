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

@app.route("/query_3", methods=['GET'])
def query_3_():
    return render_template('form-3.html')

@app.route("/query_4", methods=['GET'])
def query_4_():
    return render_template('form-4.html')

@app.route("/query_5", methods=['GET'])
def query_5_():
    return render_template('form-5.html')

@app.route("/query_6", methods=['GET'])
def query_6_():
    return render_template('form-6.html')

@app.route("/query_7", methods=['GET'])
def query_7_():
    return render_template('form-7.html')

@app.route("/query_8", methods=['GET'])
def query_8_():
    return render_template('form-8.html')

@app.route("/query_9", methods=['GET'])
def query_9_():
    return render_template('form-9.html')


@app.route("/query_1", methods=['POST'])
def query_1():
    input = request.form
    query = db.query_1(input['customer_id'],
                       input['reg_number_start'],
                       input['color'])
    return render_template("table-1.html", query=query)


@app.route("/query_2", methods=['POST'])
def query_2():
    input = request.form
    query = db.query_2(input['station_id'],
                       input['date'])
    print(query)
    query = [query[0:13], query[13:24]]
    print(query)
    return render_template("table-2.html", query=query)

@app.route("/query_3", methods=['POST'])
def query_3():
    input = request.form
    query = db.query_3(input['begin_date'],
                       input['end_date'])
    return render_template("table-3.html", query=query)

@app.route("/query_4", methods=['POST'])
def query_4():
    input = request.form
    query = db.query_4(input['customer_id'])
    return render_template("table-4.html", query=query)

@app.route("/query_5", methods=['POST'])
def query_5():
    input = request.form
    query = db.query_5(input['day'])
    print(query)
    return render_template("table-5.html", query=query)

@app.route("/query_6", methods=['POST'])
def query_6():
    input = request.form
    query = db.query_6(input['top_n'])
    len01 = max(len(query[0]), len(query[1]))
    data01 = [[query[0][n] if len(query[0]) > n else ['',''], query[1][n]] if len(query[1]) > n else ['',''] for n in range(len01)]
    len23 = max(len(query[2]), len(query[3]))
    data23 = [[query[2][n] if len(query[2]) > n else ['',''], query[3][n]] if len(query[3]) > n else ['',''] for n in range(len23)]
    len45 = max(len(query[4]), len(query[5]))
    data45 = [[query[4][n] if len(query[4]) > n else ['',''], query[5][n]] if len(query[5]) > n else ['',''] for n in range(len45)]
    query = [data01, data23, data45]
    return render_template("table-6.html", query=query)

@app.route("/query_7", methods=['POST'])
def query_7():
    input = request.form
    query = db.query_7(input['begin_date'],
                       input['end_date'],
                       input['percentage'])
    return render_template("table-7.html", query=query)

@app.route("/query_8", methods=['POST'])
def query_8():
    input = request.form
    query = db.query_8(input['date'])
    return render_template("table-8.html", query=query)

@app.route("/query_9", methods=['POST'])
def query_9():
    input = request.form
    query = db.query_9(input['date'])
    print(query)
    return render_template("table-9.html", query=query)

@app.route("/query_10", methods=['GET'])
def query_10():
    return render_template("table-10.html", query=db.query_10())

if __name__ == '__main__':
    app.run(host='127.0.0.1', debug=True)
