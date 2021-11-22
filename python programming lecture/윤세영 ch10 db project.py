from typing import Text


class LoginMember:
    def __init__(self, id, name, pw) -> None:
        self.id = id
        self.name = name
        self.pw = pw

    def __str__(self) -> str:
         return (
                    f"id: {self.id}"
                    f"name: {self.name}"
                    f"pw: {self.pw}"
                )

    def to_dict(self):
        return {
                    "id":self.id,
                    "name":self.name,
                    "pw":self.pw
               }

class TextInfo:
    def __init__(self, title, contents) -> None:
        TextInfo._TextInfo__count += 1

        self.title = title
        self.contents = contents

#==========================================================================
# 회원가입
def insert_loginInfo():
    cursor = conn.cursor()

    id = input('id: ')
    name = input('name: ')
    pw = input("pw: ")

    member = LoginMember(id, name, pw)

    sql = 'insert into text_login values (:id, :name, :pw)'
    cursor.execute(sql, member.to_dict())

# 로그인
def login(id, pw):
    cursor = conn.cursor()

    sql = 'select * from text_login where id=:id and password=:pw'
    cursor.execute(sql, (id, pw))
    login_data = cursor.fetchone()

    if login_data != None:
        print(f'id: {id}')
        print(f'pw: {pw}')
        print(f'{login_data[1]}({login_data[0]}) 회원님이 로그인 하였습니다.')

        display_text_info()

        print('글쓰기: w, 상세보기: 글 번호 입력, 로그아웃: logout')
        menu_mode = input('선택: ')
        text_menu(menu_mode, id)
    else:
        print('wrong id or pw! Input again!')

#==================================================================================
# 글목록 display
def display_text_info():
    cursor = conn.cursor()

    sql = 'select text_id, title, author, text_date, read_count\
           from text_info'
    cursor.execute(sql)

    for data in cursor:
        print(data)

#==================================================================================
# 글 정보 입력
def input_text_info(id):
    cursor = conn.cursor()

    title = input('제목: ')
    contents = input('내용: ')

    text_dict = {
                    'title' : title,
                    'author' : id,
                    'read_count' : 1,
                    'contents' : contents
                  }

    sql = 'insert into text_info values (text_id_seq.NEXTVAL, :title, :author, sysdate, :read_count, :contents)'
    cursor.execute(sql, text_dict)

# 글 상세보기 조회
def display_detail_info(menu):
    cursor = conn.cursor()

    sql = 'select * from text_info where text_id=:menu'
    cursor.execute(sql, (menu,))

    for data in cursor:
        print(data)

#==================================================================================
# 글 작성 관련 메뉴
def text_menu(menu, id):

    while True:
        if menu == 'w':
            input_text_info(id)
            print('글 작성이 완료되었습니다!')
            conn.commit()
            break
        elif get_text_id(str(menu)) != None:
            display_detail_info(menu)
            break
        elif menu == 'logout':
            print('로그아웃!')
            break

# text_id return 받는 함수
def get_text_id(menu):
    cursor = conn.cursor()

    sql = 'select text_id from text_info where text_id=:menu'
    cursor.execute(sql, (menu, ))
    text_id_data = cursor.fetchone()
    text_id = text_id_data[0]
    
    return text_id

#==================================================================================
# menu selection
def login_menu():
    while True:
        print("1.회원가입", "2.로그인", "3.종료", sep=" | ", end="")
        print(' ')
        menu = int(input('select login menu: '))

        if menu == 1:
            insert_loginInfo()
            conn.commit()
        elif menu == 2:
            id = input('id: ')
            pw = input('pw: ')
            login(id, pw)
        elif menu == 3:
            print('exit!')
            break

if __name__ == '__main__':
    import cx_Oracle as oracle
    global conn

    oracle_dsn = oracle.makedsn(host = 'localhost', port = 1521, sid = 'xe')
    conn = oracle.connect(dsn = oracle_dsn, user = 'hr', password = 'hr')

    login_menu()