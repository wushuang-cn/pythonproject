from Pytest.Pylib.test_列出班级 import Test添加列出删除_tc000001
import pytest



class Test_添加班级1:
    # def teardown_method(self):
    #     print('数据清除开始')
    #     print('3:删除班级开始----------')
    #     classid=self.listresult['retlist']['id']
    #     deleresulet=Test添加班级_tc000001.test_deleall_class_00001(classid)
    
    #     assert  deleresulet['retcode']==0
    #     print('数据清除成功')
    def test_添加班级1(self):
        print('添加班级开始-------')
        print('1:添加班级：')
        addclass=Test添加列出删除_tc000001.test_addclass_00001(1,
                                                        '七年级',
                                                        60)
        assert addclass['retcode']==0
        print('添加班级成功')
        print('2：列出班级开始------')
        listresult=Test添加列出删除_tc000001.test_listclass_000001()
        expect=[
            {
            "name": "七年级",
            "grade__name": "七年级",
            "invitecode": addclass['invitecode'],
            "studentlimit": 60,
            "studentnumber": 0,
            "id": listresult['id'],
            "teacherlist": []
            }
                ]
        assert listresult['retlist']==expect
        print('3:删除班级开始----------')
        classid1=listresult['retlist']['id']
        deleresulet=Test添加列出删除_tc000001.test_deleall_class_00001(classid1)
        assert  deleresulet['retcode']==0


