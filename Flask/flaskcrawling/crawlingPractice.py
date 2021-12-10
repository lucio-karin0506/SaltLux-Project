from bs4 import BeautifulSoup
import requests
import pandas as pd

# 기사 제목 가져오기
def get_news_title():
    title_list = []
    for page in range(1, 3):
        raw = requests.get(f'https://news.ycombinator.com/news?p={str(page)}').text
        soup = BeautifulSoup(raw, 'html.parser')
        articles = soup.select('.titlelink')
        
        for article in articles:
            title_list.append(article.text)

        print(title_list)

# 네이버 주식 데이터 가져오기
def get_naver_stock_data():
    raw = requests.get('https://finance.naver.com/sise/lastsearch2.nhn').text
    soup = BeautifulSoup(raw, 'html.parser')

    # 데이터 컬럼 이름 get
    col_name_list = soup.select('tr.type1 > th')
    col_list = [col_name.text for col_name in col_name_list]
    
    # 주가 이름 get
    stock_name_list = soup.select('a.tltle')
    stock_list = [stock_name.text for stock_name in stock_name_list]

    print(col_list)
    print(stock_list)

    # 검색비율, 현재가, 전일비, 등락률, 거래량, 시가, 고가, 저가, per, roe
    # for index in range(30):
    #     a = soup.select(f'#contentarea > div.box_type_l > table > tbody > tr:nth-child({index+3}) > td.number')
    #     print(a)

# 네이버 tv top 100
def get_naverTV_top100():
    raw = requests.get('https://tv.naver.com/r/').text
    soup = BeautifulSoup(raw, 'html.parser')

    total_info = {}

    # 순위
    rank_list = [i for i in range(1, 101)]
    total_info['순위'] = rank_list

    # 영상제목
    title_list = [title.text.strip() for title in soup.select('dt.title > a')]
    total_info['영상제목'] = title_list

    # 채널명
    channel_list = [channel.text for channel in soup.select('dd.chn > a')]
    total_info['채널명'] = channel_list

    # 조회수
    watch_count_list = [int(watch_count.text[4:].replace(',', '')) for watch_count in soup.select('span.hit')]
    total_info['조회수'] = watch_count_list

    # 좋아요 수
    like_count_list = [int(like_count.text[5:].replace(',', '')) for like_count in soup.select('span.like')]
    total_info['좋아요 수'] = like_count_list

    top100_df = pd.DataFrame(total_info)

    # 총점
    # score = hit + (like*350) // 100
    top100_df['총점'] = (top100_df['조회수'] + (top100_df['좋아요 수'] * 350)) // 100
    
    return top100_df

if __name__ == '__main__':
    # get_news_title()
    # get_naver_stock_data()
    top100_df = get_naverTV_top100()
    top100_df.to_csv('네이버 top100.csv', encoding='utf-8-sig')