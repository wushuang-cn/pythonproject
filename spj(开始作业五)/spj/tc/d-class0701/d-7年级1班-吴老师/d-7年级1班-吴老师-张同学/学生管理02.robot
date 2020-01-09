*** Settings ***
Library    pylib/SchoolClassLib.py
Library    pylib/TeacherClassLib.py
Library    pylib/StudentLib.py

*** Test Cases ***
添加学生2 - tc002002
#已有学生 不同学生名
#    ${ret1}=   list school class  1
#    ${classid}  evaluate   $ret1['retlist'][0]['id']
    #增加学生
    ${ret2}=   add student  张张同学  张张同学  1     ${suite_global_class_id}  18711411318
    should be true   $ret2['retcode']==0
    #列出学生
    ${res1}=   list student
    #注意如下结果是个列表
    ${studentid}  evaluate   [i['id'] for i in $res1['retlist'] if i['realname']=='张张同学']
    should be true    $studentid[0]== $ret2['id']
    [teardown]   delete all student

