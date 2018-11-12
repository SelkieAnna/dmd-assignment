from flask import Flask

app = Flask(__name__)

@app.route("/", methods = ['GET'])
def index():
    pass

@app.route("/", methods = ['POST'])
def query():
    pass

if __name__ == '__main__':
    app.run(host = '0.0.0.0', debug = True)