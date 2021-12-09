from os import name
import sqlite3 as sql
from flask import Flask, render_template, request
from flask.helpers import url_for
from werkzeug.utils import redirect

'''
    - db conn 전역 객체 생성
    - 최초 실행 시 db 및 테이블 미존재 시 테이블 생성 후 웹 실행
'''
conn = sql.connect('database.db', check_same_thread=False)
print('db connect success!!')

conn.execute('CREATE TABLE IF NOT EXISTS students\
                (name TEXT, addr TEXT, city TEXT, pin TEXT)')
print("Table created successfully")

'''
    - url mapping
'''
app = Flask(__name__)

# home 화면 로딩
@app.route('/')
def load_home():
    return render_template('home.html')

# 학생 리스트 화면 로딩
@app.route('/list')
def get_list():
    conn.row_factory = sql.Row
    cur = conn.cursor()
    cur.execute('select * from students')

    rows = cur.fetchall()

    return render_template('list.html', rows=rows)

# 학생 추가 화면 로딩
@app.route('/enternew')
def get_insert():
    return render_template('student.html')

# 학생 정보 추가
@app.route('/addrec', methods=['POST'])
def insert_info():
    if request.method == 'POST':
        try:
            name = request.form['nm']
            addr = request.form['add']
            city = request.form['city']
            pin = request.form['pin']

            cur = conn.cursor()
            cur.execute(
                        """
                            INSERT INTO students(name, addr, city, pin) 
                            VALUES(?, ?, ?, ?)
                        """, 
                        (name, addr, city, pin)
                        )
            conn.commit()
        except:
            conn.rollback()
        finally:
            # conn.close()
            return redirect(url_for('get_list'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)