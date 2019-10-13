import  requests,pytest
from Pytest import Config

class Test添加列出删除_tc000001:
    def test_listclass_000001(self,gradeid=None):
        print('列出班级开始')

        url=Config.url_bj
        params={
            'vcode':Config.g_vscode,
            'action':'list_classes_by_schoolgrade'
        }
        if gradeid !=None:
            params['gradeid']=gradeid
        response=requests.get(url=url,params=params)
        data=response.json()
        print(data)
        return  data
        print('列出班级结束')

    def test_addclass_00001(self, gradeid, name, studentlimit):
        playload={
            'vcode':Config.g_vscode,
            'action':'add',
            'grade':gradeid,
            'name':name,
            'studentlimit':studentlimit
        }
        response=requests.post(url=Config.url_bj,data=playload)
        classs=response.json()
        print(classs)
        return  classs

    def test_dele_class_00001(self,class_id):
        url=f'{Config.url_bj}/{class_id}'
        playload={
            'vcode':Config.g_vscode
        }
        response=requests.delete(url=url,data=playload)
        data1=response.json()
        print(data1)
        return  data1

    def test_deleall_class_00001(self,class_id):
        return_class=self.test_listclass_000001()
        classs=return_class['retlist']
        for i in classs:
            class_id=i['id']
            url=f'{Config.url_bj}/{class_id}'
            playload={
                'vcode':Config.g_vscode
            }
            response=requests.delete(url=url,data=playload)
            data1=response.json()
            print(data1)
            return  data1

t=Test添加列出删除_tc000001()
