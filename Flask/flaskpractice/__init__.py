from flask import Flask, request
from flask.templating import render_template
from model import linkparser

app = Flask(__name__)

@app.route('/')
def load_main():
    return render_template('index.html')

@app.route('/result', methods=['POST', 'GET'])
def get_result():
    if request.method == 'POST':
        print(request.form)
        link = request.form['link']
        link_data = linkparser.get_link_data(link)
        return render_template('result.html', res=link_data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)