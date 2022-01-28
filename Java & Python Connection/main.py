from flask import Flask, jsonify, render_template, request, make_response
import numpy as np
import cv2
import base64

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/test1', methods=['GET', 'POST'])
def rest_api_test1():
    print(request.method)
    data = {'0':'0.01', '1':'0.99'}
    if request.method == 'GET':
        param = request.args.get('data')
        print(param)
        data.update({'param': param})
    
    elif request.method == 'POST':
        param = request.form.get('data')
        print(param)
        f = request.files['file']
        print(f.filename)
        f.save(f.filename)
        data.update({"param": param, "file": f.filename})

    response = make_response(jsonify(data))
    # *어디서든 비동기 요청 가능 표시
    response.headers.add('Access-Control-Allow-Origin', '*')
    
    return response

@app.route('/test_img', methods=['POST'])
def rest_img_test():
    param = request.form.get('data')
    f = request.files['file']
    filestr = f.read()

    npimg = np.frombuffer(filestr, np.uint8)

    img = cv2.imdecode(npimg, cv2.IMREAD_COLOR)

    img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    cv2.imwrite(f.filename, img_gray)
    img_str = base64.b64encode(cv2.imencode('.jpg', img_gray)[1]).decode()

    data = {"param": param, "file": img_str}
    response = make_response(jsonify(data))
    response.headers.add("Access-Control-Allow-Origin", "*")

    return response

if __name__ == '__main__':
    app.debug = True
    app.run()