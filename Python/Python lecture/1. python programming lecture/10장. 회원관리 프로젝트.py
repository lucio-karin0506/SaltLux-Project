# member class
class Member:
    def __init__(self, name, phone, email, age, grade, etc) -> None:
        self.name = name
        self.phone = phone
        self.email = email
        self.age = age
        self.grade = grade
        self.etc = etc

    def __str__(self) -> str:
        return (
                f"name: {self.name}, phone: {self.phone},"
                f"email: {self.email}, age: {self.age},"
                f"grade: {self.grade}, etc: {self.etc}"
                )

    def to_dict(self):
        return {
                "name":self.name, "phone":self.phone, "email":self.email,
                "age":self.age, "grade":self.grade, "etc":self.etc
                }

# 회원 정보 입력
def insert_member():
    cursor = conn.cursor()

    name = input('name: ')
    phone = input('phone number: ')
    email = input("email: ")
    age = int(input("age: "))
    grade = int(input("grade(1~5): "))
    etc = input("etc: ")

    member = Member(name, phone, email, age, grade, etc)

    sql = 'insert into member values (:name, :phone, :email, :age, :grade, :etc)'
    cursor.execute(sql, member.to_dict())

# 회원 정보 전체 조회
def display_member():
    cursor = conn.cursor()

    sql = 'select * from member'
    cursor.execute(sql)

    for data in cursor:
        print(Member(*data))

# 회원 정보 찾기
def search_member(name):
    cursor = conn.cursor()

    sql = 'select * from member where name=:name'
    cursor.execute(sql, (name,))

    for data in cursor:
        print(Member(*data))

# 회원 정보 삭제
def delete_member(email):
    cursor = conn.cursor()

    sql = 'delete from member where email=:email'
    cursor.execute(sql, (email,))

# 회원 정보 수정
def update_member(name):
    cursor = conn.cursor()

    check_name_sql = 'select name from member where name=:name'
    cursor.execute(check_name_sql, (name,))
    name_data = cursor.fetchone()

    if name_data != None:

        phone = input('phone: ')
        email = input('email: ')
        age = input('age: ')
        grade = input('grade: ')
        etc = input('etc: ')

        changed_member_info = {
                            "name": name, "phone": phone, "email": email,
                            "age": age, "grade": grade, "etc": etc
                        }

        sql = 'update member set phone=:phone, email=:email, age=:age, grade=:grade, etc=:etc where name=:name'
        cursor.execute(sql, changed_member_info)
        print('update complete!')
    else:
        print('oops you just input wrong name!')

# csv 내보내기
def to_csv():
    import csv
    file_name = input('file name: ')

    cursor = conn.cursor()
    cursor.execute('select * from member')
    members = cursor.fetchall()

    colnames = [row[0] for row in cursor.description]

    with open(file_name + '.csv', 'w', newline='', encoding='utf-8-sig') as file:
        w = csv.writer(file, quoting=csv.QUOTE_NONNUMERIC)
        w.writerow(colnames)
        w.writerows(members)

# menu selection
def main():
    while True:
        print("1.입력", "2.전체조회", "3.찾기", "4.삭제", "5.내보내기(CSV)",
              "6.수정", "0.종료", sep=" | ", end="")
        print(' ')
        menu = int(input('select menu: '))

        if menu == 1:
            insert_member()
            conn.commit()
        elif menu == 2:
            display_member()
        elif menu == 3:
            name = input('name: ')
            search_member(name)
        elif menu == 4:
            email = input('email: ')
            delete_member(email)
            print('delete complete!')
            conn.commit()
        elif menu == 5:
            to_csv()
            print('complete exporting to csv file!')
        elif menu == 6:
            name = input('name: ')
            update_member(name)
            conn.commit()
        elif menu == 0:
            print('exit menu!')
            conn.close()
            break

if __name__ == '__main__':
    import cx_Oracle as oracle
    global conn

    oracle_dsn = oracle.makedsn(host = 'localhost', port = 1521, sid = 'xe')
    conn = oracle.connect(dsn = oracle_dsn, user = 'hr', password = 'hr')

    main()