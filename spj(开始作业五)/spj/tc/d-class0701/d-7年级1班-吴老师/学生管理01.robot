*** Settings ***
Library    pylib/SchoolClassLib.py
Library    pylib/TeacherClassLib.py
Library    pylib/StudentLib.py

*** Test Cases ***
添加学生1 - tc002001
#已有年级  老师

#    ${ret1}=   list school class  1
#    ${classid}  evaluate   $ret1['retlist'][0]['id']
    #增加学生
    ${ret2}=   add student  张同学  张同学  1    ${suite_global_class_id}   18711411575
    should be true   $ret2['retcode']==0
    #列出学生
    ${res1}=   list student
    should be true   $ret2['id']==$res1['retlist'][0]['id']
    [teardown]    delete student   &{ret2}[id]