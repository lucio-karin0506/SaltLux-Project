import crawling
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    naver_weather = crawling.naver_weather()
    return render_template('index.html', list=naver_weather)

@app.route('/about')
def about():
    return "About Our Service"


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)