import time
from telnetlib import EC

import selenium
from selenium import webdriver;
import csv;
from pandas import Series;
from pandas import DataFrame;
import pandas;
import re;
from bs4 import BeautifulSoup;
import plistlib

from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait


class SteamCrawler :

    #Driver 설정
    def getDriver(self,link_name,driver_selector,css_selector) :

        # 드라이버 경로
        chrome = selenium.webdriver.Chrome(driver_selector);

        # 크롬으로 접근할 사이트 링크
        link = chrome.get(link_name);

        # 해당 사이트 접속 후 정상적 연결을 위해 5초 설정
        wait = WebDriverWait(chrome, 3);

        # 제대로 화면이 뜰때까지 기다리기
        # CSS Selector 파라미터로 받으면 객체에서 활용가능
        wait.until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, css_selector)));

        return chrome;
        #provider_elems = chrome.find_elements_by_class_name(".apphub_CardTextContent");

    # 스크롤 메서드
    def scrollDown(self,driver_name,scroll_count):
        scnt=0;
        while True :

            # 아래 주석은 무한로직
            #page_now = chrome.execute_script("return document.body.scrollHeight")

            # 페이지 맨 아래까지 스크롤 하기
            driver_name.execute_script("window.scrollTo(0,document.body.scrollHeight)")

            # 내리고 싶은 회수
            scnt += 1;

            # 페이지 로딩 시간기다려주는 타임슬립
            time.sleep(4);

            # 무한 스크롤 로직
            #page_after = chrome.execute_script("return document.body.scrollHeight")

            # 스크롤 내리기 횟수 설정
            if (scnt >= scroll_count):
                break;
            '''
            무한 스크롤 멈추기
            if (page_after==page_now) :
                break;
            '''
    # 파싱 ,DataFrame 생성
    def html_parsing(self,driver_name):
        date_list = list();
        text_list = list();

        # html 파싱
        html = driver_name.page_source;
        soup = BeautifulSoup(html,'html.parser');

        # 날짜 가져오기
        reviewDate = soup.select('.apphub_CardTextContent > .date_posted');
        # 얼리엑세스 리뷰만 가져오기
        reviewEalry = soup.select('.apphub_CardTextContent > .early_access_review');
        # 해당 클래스 전체 가져오기
        reviewText = soup.select('.apphub_CardTextContent');

        # 데이터프레임으로 만들기 위한 딕셔너리 생성
        steam_data = {
            # steamDate , Text 라는 리스트생성
            'steamDate' : [],
            'steamText' : []
        } ;

        # date , text리스트 생성

        # for each문을 통해 해당 tag의 택스트만 가져오기
        for date in reviewDate:
            # date_list에 하나씩 추가해준 후 뒤에 로직 때문에 날짜는 삭제해 주었다
            date_list.append(date.text.strip().replace("Posted: ", ""));
            # 삭제 로직
            date.decompose();

        # 얼리엑세스 리뷰 삭제 로직
        for early in reviewEalry:
            # earlyAccessReview 삭제
            early.decompose();

        for post in reviewText:
            # 필요없는 문자 제거 후 리스트에 추가
            text_list.append(post.text.replace("Product received for free","").strip())
            #str += post.text.strip();

        # 정규표현식을 통해 특수문자를 다 제거해 줌
        for i in range(0, len(text_list)) :
            if (text_list[i].find('[-=.#/?:$}*]') == -1) :
                text_list[i] = re.sub('[^가-힝0-9a-zA-Z\\s]', '', text_list[i]);

        # 딕셔너리에 Value 추가
        steam_data['steam_date'] = date_list;
        steam_data['steam_text'] = text_list;

        # 데이터프레임 형식으로 변환
        df = pandas.DataFrame(steam_data,columns=['steam_date','steam_text'])

        # 데이터프레임에서 a행 삭제 후 갱신 로직
        #df = df.drop(a,0)

        # chk = 데이터가 없는 행을 체크하기 위한 리스트
        chk = list();
        a = int();
        for a in range(0,len(text_list)) :
            if(text_list[a].strip()=='') :
                # 데이터가 없는 행 체크해 놓기
                chk.append(a)
                # 데이터가 없는 행 삭제
                df = df.drop(a, 0);
        return df

    # csv파일로 저장
    def save_to_csv(self,data_name):
        data_name.to_csv('steamreview.csv',encoding='utf-8') ;


# 크롤링할 스팀 리뷰 링크
link="https://steamcommunity.com/app/578080/reviews/?browsefilter=toprated&snr=1_5_reviews_&filterLanguage=english";

# 셀레니움 드라이버 경로
driverpath = "C:/Users/dldnw/Downloads/chromedriver.exe";

# 로딩 완료를 의미하는 CSS셀렉터(이 셀렉터가 브라우저에 나타날때까지 대기함)
selector = ".apphub_CardTextContent";

# 객체 생성
crawler = SteamCrawler();

# 드라이버 생성
chrome = crawler.getDriver(link,driverpath,selector);

# 10번 내리는 스크롤 로직 (위의 다른 로직으로 무한 스크롤도 가능함)
crawler.scrollDown(chrome,10);

# 스크롤 다 내린 후 html source 파싱 후 원하는 데이터를 데이터프레임 형식으로 전환
data = crawler.html_parsing(chrome);

# csv파일로 저장
crawler.save_to_csv(data);
# 마무리 드라이버 종료
chrome.close();


    #with open('test.txt','w',encoding='utf-8') as f_out :
    #    f_out.write















