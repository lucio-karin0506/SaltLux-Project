from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from bs4 import BeautifulSoup

import warnings
warnings.filterwarnings('ignore')

def handling_site(search_name):
    # 페이지 접속
    driver.get('https://www.naver.com/')

    # 요소 탐색 및 키보드 입력
    driver.find_element_by_name('where').send_keys(search_name)
    
    # search button key 마우스 클릭
    driver.find_element_by_id('search_btn').click()

    # 페이지 수집
    html = driver.page_source
    soup = BeautifulSoup(html, 'html.parser')

    info_list = soup.select('div.info_group')
    person_info = {}

    if info_list != []:
        for index in range(1, len(info_list)-3):
            info_title = info_list[index].select_one('dt').text
            info = info_list[index].select_one('dd').text

            person_info[info_title] = info
        print(person_info)
        return person_info
    else:
        search_name = input('you can only input celebrity! input again!: ')
        handling_site(search_name)
    

if __name__ == '__main__':
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_experimental_option('detach', True)
    chrome_options.add_experimental_option('excludeSwitches', ['enable-logging'])
    driver = webdriver.Chrome(service=Service('./chromedriver'), options=chrome_options)

    search_name = input('input search keyword!: ')
    handling_site(search_name)

    while(True):
        pass