*** Settings ***
Library    pylib/SchoolClassLib.py
Library    pylib/TeacherClassLib.py
Library    C000082a.py


*** Test Cases ***

修改班级1 - tc000051

#修改一个新班级，不与系统内部班级名称同名
#    ${ret1}=  list school class    1
#    ${id}   evaluate    $ret1['retlist'][0]['id']
    ${ret1}=    add school class    1     2班     60
    log many     ${ret1}
    should be true     $ret1['retcode']==0
    ${id}   evaluate    $ret1['id']
    ${ret2}=  modify class    ${id}   1班plus    59
    should be true   $ret2['retcode']==0
#列出班级检验
    ${ret3}=  list school class  1
    should be true  $ret3['retlist'][0]['name']=='1班plus'
    [Teardown]   delete school class   ${id}

修改班级2 - tc000052
#系统中已经有班级,修改班级名称并同名
    ${ret1}=    add school class    1     2班     60
    should be true     $ret1['retcode']==0
    ${id}   evaluate    $ret1['id']
    ${ret2}=   modify class    ${id}  1班  60
    should be true   $ret2['retcode']!=0

修改班级3 - tc000053

#修改不存在的班级id
    ${ret2}=   modify class   0000  3班  60
    should be true   $ret2['retcode']==404

删除班级1 - tc000081

#删除不存在的班级id
    ${ret1}=  list school class  1
    should be true  $ret1['retcode']==0
    ${id}   evaluate    $ret1['retlist'][0]['id']
    ${ret2}=   delete school class  00000
    should be true  $ret2['retcode']==404

删除班级2 - tc000082

#删除已存在的班级id
     ${ret1}=  list school class  1
    should be true  $ret1['retcode']==0
    ${id}   evaluate    $ret1['retlist'][0]['id']
    ${ret2}=   delete school class  ${id}
    should be true  $ret2['retcode']==0
     ${ret11}=  list school class  1
     ${list}  evaluate   [i['id'] for i in $ret11['retlist']]
     should be true    $id not in $list




