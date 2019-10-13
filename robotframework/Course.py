import  requests
from bs4 import BeautifulSoup
class Course():
    def listcourse(self):
        list_book=[]
        url='http://bang.dangdang.com/books/fivestars'
        headers={

            'User - Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.18362'
        }
        html=requests.get(url=url,headers=headers)
        soup=BeautifulSoup(html.text,'html.parser')
        class_book=soup.find('ul',class_='bang_list clearfix bang_list_mode')
        books=class_book.find_all(class_='name')
        for book in books:
            list_book.append(book.text)
        return list_book

    def printself(*args):
        print(args)