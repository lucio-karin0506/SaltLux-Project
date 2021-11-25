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
           from text_info order by text_id'
    cursor.execute(sql)

    print('text_id', '제목', '작성자', '작성일', '조회수')
    for data in cursor:
        data_list = list(data)
        data_list[3] = data_list[3].strftime('%Y-%m-%d')
        print(data_list)

#==================================================================================
# 글 정보 입력
def input_text_info(id):
    cursor = conn.cursor()

    title = input('제목: ')
    contents = input('내용: ')

    text_dict = {
                    'title' : title,
                    'author' : id,
                    'read_count' : 0,
                    'contents' : contents
                }

    sql = 'insert into text_info values (text_id_seq.NEXTVAL, :title, :author, sysdate, :contents, :read_count)'
    cursor.execute(sql, text_dict)

# 글 상세보기 조회
def display_detail_info(menu):
    cursor = conn.cursor()

    sql = 'select * from text_info where text_id=:menu order by text_id'
    cursor.execute(sql, (menu,))

    print('text_id', '제목', '작성자', '작성일', '내용', '조회수')
    for data in cursor:
        data_list = list(data)
        data_list[3] = data_list[3].strftime('%Y-%m-%d')
        print(data_list)

# 글 조회수 갱신
def renew_read_count(text_id):
    cursor = conn.cursor()

    # 현재 조회수 받아옴
    sql = 'select read_count from text_info where text_id=:text_id'
    cursor.execute(sql, (int(text_id), ))
    read_count_data = cursor.fetchone()
    read_count = read_count_data[0]
    
    # 조회수 계산 및 반영
    read_count += 1
    sql2 = 'update text_info set read_count=:read_count where text_id=:text_id'
    cursor.execute(sql2, (read_count, text_id))

#==================================================================================
# 글 작성 관련 메뉴
# 메뉴별 작업 수행 후 로그인 메뉴로 돌아감
def text_menu(menu, id):

    while True:
        if menu == 'w':
            input_text_info(id)
            print('글 작성이 완료되었습니다!')
            conn.commit()
            break
        elif get_text_id(menu) != None:
            # 글 상세보기
            display_detail_info(menu)
            # 조회수 갱신
            renew_read_count(menu)
            conn.commit()
            break
        elif menu == 'logout':
            print('로그아웃!')
            break

# text_id return 받는 함수
def get_text_id(menu):
    cursor = conn.cursor()

    sql = 'select text_id from text_info where text_id=:menu'
    cursor.execute(sql, (int(menu), ))
    text_id_data = cursor.fetchone()
    text_id = text_id_data[0]
    
    return text_id

#==================================================================================
# menu selection
def login_menu():
    while True:
        print("1.회원가입", "2.로그인", "3.종료", sep=" | ", end="")
        print(' ')
        menu = input('select login menu: ')

        try:
            if int(menu) == 1:
                insert_loginInfo()
                conn.commit()
                print('login success!')
            elif int(menu) == 2:
                id = input('id: ')
                pw = input('pw: ')
                login(id, pw)
            elif int(menu) == 3:
                print('exit!')
                conn.close()
                break
            else:
                print('you just input wrong number! input number only 1 or 2 or 3!')
        except ValueError as e:
            print('you have to input only number! try again!')

if __name__ == '__main__':
    import cx_Oracle as oracle
    global conn

    oracle_dsn = oracle.makedsn(host = 'localhost', port = 1521, sid = 'xe')
    conn = oracle.connect(dsn = oracle_dsn, user = 'hr', password = 'hr')

    login_menu()