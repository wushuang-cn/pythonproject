import scrapy
from bs4 import  BeautifulSoup
from ..items import JobuiItem

class Jobui(scrapy.Spider):
    name = 'jobui'
    allowed_domains=['www.jobui.com']
    start_urls=['https://www.jobui.com/rank/company/']

    def parse(self, response):
        soup=BeautifulSoup(response.text,'html.parser')
        companys=soup.find_all('div',class_='cfix')
        for company in companys:
            links_a=company.find_all('a')
            for i in links_a:
                link=i['href']
                real_url='https://www.jobui.com{}jobs'.format(link)  #注意link没有引号
                yield scrapy.Request(real_url,callback=self.parser_job)
    def parser_job(self,response):

        soup=BeautifulSoup(response.text,'html.parser')
        item = JobuiItem()
        item['company']=soup.find('a',class_='company-banner-name').text
        job_all=soup.find_all('div',class_='job-simple-content')
        for job in job_all:

            item['name']=job.find(class_='job-segmetation').find('a',class_='job-name').text
            job_position_info=job.find('div',class_='job-desc').text.split('|')
            item['position']=job_position_info[0]
            item['info']=job_position_info[1:]
            yield item

