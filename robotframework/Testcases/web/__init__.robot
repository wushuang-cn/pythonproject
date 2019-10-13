*** Settings ***
Resource     set/myset.robot
Suite Setup    login   auto  sdfsdfsdf  #只调用一次setup
Suite Teardown    closetest    #只调用一次teardown