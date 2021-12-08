from bs4 import BeautifulSoup
import requests
from requests.exceptions import HTTPError

def get_link_data(link):
    try:
        movie_rank_dict = {}
        
        link_response = requests.get(link, verify=False)

        if link_response.status_code == 200:
            soup = BeautifulSoup(link_response.content, 'html.parser')
            title_list = soup.select('div.tit3 > a')

            for i, title in enumerate(title_list):
                movie_rank_dict[str(i)] = title.text

            print(movie_rank_dict)
            return movie_rank_dict
        else:
            print('abnormal response')

    except HTTPError as http_err:
        import time
        time.sleep(2)
        return f'HTTP error occured!!! => {http_err}'