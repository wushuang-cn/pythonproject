'''
settings.py 是scrapy里的各种设置。items.py是用来定义数据的，
pipelines.py是用来处理数据的，它们对应的就是Scrapy的结构中的Item Pipeline（数据管道）。
'''

import scrapy
from bs4 import BeautifulSoup
from ..items import  DoubanItem
#DoubanSpider类继承自scrapy.Spider类
class DoubanSpider(scrapy.Spider):
    name='douban'#定义爬虫的名字
    allowed_domains=['book.duban.com'] #不需要加https://
    start_urls=[]       #是定义起始网址，就是爬虫从哪个网址开始抓取
    for i in range(3):
        url='https://book.douban.com/top250?start='+str(25*i)
        start_urls.append(url)

#爬取书名、出版信息和书籍评分
    def parse(self,response): #parse是Scrapy里默认处理response的一个方法，中文是解析
        soup=BeautifulSoup(response.text,'html.parser')
        items=soup.find_all('tr',class_='item')
        #书名
        for data in items:
            item=DoubanItem()
            item['book_name']=data.find('div',class_='pl2').find('a').text
            item['info']=data.find('p',class_='pl').text
            item['rank']=data.find('span',class_='rating_nums').text
            #print(item['book_name'])
            yield  item #把获得的item传递给引擎
