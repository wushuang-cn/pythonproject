'''
从企业排行榜爬取到这40家公司，再跳转到这40家公司的招聘信息页面，爬取到公司名称、职位、工作地点和招聘要求。
'''
import requests
from bs4 import  BeautifulSoup
url='https://www.jobui.com/company/10375749/jobs/'
header={
'User-Agent':
'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0'
}
html=requests.get(url=url,headers=header)
soup=BeautifulSoup(html.text,'html.parser')
company_name=soup.find('a',class_='company-banner-name').text
job_all=soup.find_all('div',class_='job-simple-content')
print(company_name)
for job in job_all:
    name=job.find(class_='job-segmetation').find('a',class_='job-name').text
    job_position_info=job.find('div',class_='job-desc').text.split('|')

            # item['info']=item['job_position_info'][1].text
    position=job_position_info[0]
    info=job_position_info[1:]
    #print(type(job_position_info))
    print(name,position,info)