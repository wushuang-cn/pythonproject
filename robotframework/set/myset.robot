*** Settings ***
Library    SeleniumLibrary
Library    Collections     #append to list 是这个库中的
*** Keywords ***
login  #供公用
      [arguments]      ${username}   ${password}  #为啥红色波浪线
      open browser    http://localhost/mgr/login/login.html    Firefox
      sleep   2
      maximize browser window
      input text      id=username    ${username}
      input text      id=password    ${password}
      click button    tag=button    #这个地方有点不懂
      sleep     1
closetest
     close window
deleteinfo
      :for  ${i}  IN  range   9999
        \   ${delebuttons}=   get webelements    css=button[ng-click="delOne(one)"]
        \   log to console     ${delebuttons}
        \   exit for loop if   $delebuttons==[]       #这个地方有点不懂
        \   click element    ${delebuttons}[0]
        \   click element    class=btn-primary
        \   sleep  2
addcourse
    [arguments]    ${coursename}   ${coursedescription}   ${rank}
    click element   css=button[ng-click="showAddOne=true"]
    sleep  1
    input text     css=*[ng-model="addData.name"]   ${coursename}
    input text     css=*[ng-model="addData.desc"]   ${coursedescription}
    input text     css=*[ng-model="addData.display_idx"]   ${rank}
    click element  css=button[ng-click="addOne()"]
    sleep   2

deleteacher
    click element   link=老师
    sleep  2
    :for  ${j}  IN  range    9999    #注意这个地方没有括号
    \   ${delebtns}=    get webelements    css=button[ng-click="delOne(one)"]
    #:for     ${delebtn}     IN   ${delebtns}
    \    Log to console    ${delebtns}
    \   exit for loop if  $delebtns==[]
    \   click element    ${delebtns}[0]
    \   click element    class=btn-primary
    \   sleep  2
addteacher
     [arguments]    ${realname}    ${username}    ${desc}    ${rank}    ${course}
     click element   link=老师
     sleep  2
     click element   css=*[ng-click="showAddOne=true"]
     sleep  3
     input text    css=*[ng-model="addEditData.realname"]    ${realname}
     input text    css=*[ng-model="addEditData.username"]    ${username}
     input text    css=*[ng-model="addEditData.desc"]        ${desc}
     input text    css=*[ng-model="addEditData.display_idx"]    ${rank}
     select from list by label   css=*[ng-model="$parent.courseSelected"]    ${course}
     click element   css=*[ng-click="addEditData.addTeachCourse()"]

     click element   css=button[ng-click="addOne()"]
     sleep   2

getteacherlist
     click element   link=老师
     sleep  1
     ${teachers}=  create list   #创建一个列表
     ${names}=    get webelements   css=tr>td:nth-child(2)  #CSS路径还是不太会用
     :for  ${name}   IN  @{names}
       \   APPENDTOLIST         ${teachers}      ${name.text}
     [Return]   ${teachers}