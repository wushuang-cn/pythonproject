*** Settings ***
Library     SeleniumLibrary
Resource     set/myset.robot

*** Test Cases ***
用例1-添加课程
       [Setup]    deleteinfo   #如果没有下面的关键字  这个setup是不会执行的
        addcourse   语文   描述   1
        sleep  2
        addcourse   外语   描述2   2
        sleep  2
        addcourse   地理   描述3   3
        sleep  2
用例2-添加老师
          deleteacher
          addteacher   小黑   小黑   老师很黑哟   1   语文
          sleep  2
          addteacher   小白   小白   老师很白哟   2   外语
          sleep  2
          addteacher   阿黄   阿黄   老师很黄哟   2   地理

用例3--返回老师列表
           ${tealist}=   getteacherlist
           should be true   $tealist==['小黑','小白','阿黄']


           #robotframework问题1：
                       #登陆按钮定位为啥不能用class
                       #set selenium implicit wait 设置了为啥还要设置sleep
                       #用例下的setup 设置与不设置区别不大啊