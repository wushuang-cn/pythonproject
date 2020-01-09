*** Settings ***
Library    pylib/SchoolClassLib.py
Library    pylib/TeacherClassLib.py
Library    C000082a.py


*** Test Cases ***

添加老师2 - tc001002
#系统已有老师 、班级
    [setup]  add school class    1  2班  60
    ${ret1}=    list school class    1
    ${classid}  evaluate  [i['id'] for i in $ret1['retlist'] if i['name']=='2班']
    ${ret2}=    add teacher class    ${classid}[0]  wushuang1  wushuang1  13612845423  test1@qq.com   43032119900515073X
    should be true    $ret2['retcode']==0
    ${teachers}=   list teacher
    ${teacherid}  evaluate  [i['id'] for i in $teachers['retlist']]
    should be true  $ret2["id"] in $teacherid
    [teardown]  delete all teacher