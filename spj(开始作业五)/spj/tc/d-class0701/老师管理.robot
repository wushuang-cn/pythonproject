*** Settings ***
Library    pylib/SchoolClassLib.py
Library    pylib/TeacherClassLib.py
Library    C000082a.py


*** Test Cases ***
增加老师 - tc001001
#系统中没有老师，已经有班级
    ${ret1}=    list school class    1
    ${classid}  evaluate    $ret1['retlist'][0]['id']
    ${ret2}=    add teacher class    ${classid}  wushuang   wushuang   13612845422  test@qq.com   43032119900515072X
    should be true    $ret2['retcode']==0
    ${teachers}=   list_teacher
    should be true   $teachers["retlist"][0]["id"]==$ret2["id"]
    [teardown]  delete teacher   &{ret2}[id]