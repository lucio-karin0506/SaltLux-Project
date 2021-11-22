class Customer:
    def __init__(self, name:str, phone_num:str, email:str, age:int, customer_level:int, etc_info:str):
        self.name = name
        self.phone_num = phone_num
        self.email = email
        self.age = age
        self.customer_level = customer_level
        self.etc_info = etc_info
        
    def get_info_dict(self):
        customer_info = {'name':self.name, 'phone_num':self.phone_num, 
                         'email':self.email, 'age':self.age,
                         'customer_level':self.customer_level, 'etc_info':self.etc_info}
        return customer_info

def insert_info():
    name = input('이름: ')
    phone_num = input('전화번호: ')
    email = input('이메일: ')
    age = int(input('나이: '))
    customer_level = int(input('고객등급(1~5): '))
    etc_info = input('기타정보: ')
    
    customer = Customer(name, phone_num, email, age, customer_level, etc_info)
    return customer

def print_info(customer_info_list):

    print('고 객 정 보 리 스 트')
    print('------------------------------------------------------------')
    
    print('{:<5} {:<6} {:<15} {:<15} {:>3} {:}'.format("GRADE", "NAME", "PHONE", "EMAIL", "AGE", "ETC"))
    print('============================================================')
    for customer_info in customer_info_list:
        customer = customer_info.get_info_dict()
        print('{:<5} {:<6} {:<15} {:<15} {:>3} {:}'.format(customer['customer_level'], customer['name'],
                                                        customer['phone_num'], customer['email'],
                                                        customer['age'], customer['etc_info']))

def delete_info(customer_info_list, name):

    for i, cust in enumerate(customer_info_list):
        if cust.name == name:
            del customer_info_list[i]

# error occured
def search_info(customer_info_list, name):

    searched_info_list = []
    
    for i, cust in enumerate(customer_info_list):
        if cust.name == name:
            searched_info_list.append(cust[i])

    return searched_info_list

def save_to_csv(customer_info_list):
    try:
        file_name = input('저장할 파일 이름: ')
        f = open(file_name, 'wt')

        for cust in customer_info_list:
            print(cust.name, cust.phone_num, cust.email, cust.age, cust.customer_level, cust.etc, sep=',', end='\n', file=f)

    except Exception as e:
        print('error occured: ', e)
    else:
        print(f'{file_name} csv file is made')
    finally:
        f.close()

if __name__ == '__main__':

    customer_info_list = []

    while(True):
        print('1. 입력 | 2. 전체조회 | 3. 삭제 | 4. 찾기 | 5. 내보내기(CSV) | 9. 종료')
        menu_num = int(input('메뉴선택: '))

        if menu_num == 1:
            cust = insert_info()
            customer_info_list.append(cust)
            print('입력되었습니다!')

        elif menu_num == 2:
            print_info(customer_info_list)

        elif menu_num == 3:
            name = input('삭제할 이름을 입력하세요: ')
            delete_info(customer_info_list, name)
            print('삭제되었습니다!')

        elif menu_num == 4:
            # error occured
            name = input('조회할 이름을 입력하세요: ')
            searched_info_list = search_info(customer_info_list, name)
            print_info(searched_info_list)
            print('조회되었습니다!')

        elif menu_num == 5:
            save_to_csv(customer_info_list)
            print('저장 완료!')

        elif menu_num == 9:
            print('프로그램을 종료합니다.')
            break