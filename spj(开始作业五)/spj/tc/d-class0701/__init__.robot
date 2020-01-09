#*** Keywords ***
#suite setup action
#    ${ret}=    add school class   1   1班    60
#    set global variable  ${suitesetclassid}    &{ret}[id]
#
#*** Settings ***
#Library    pylib.SchoolClassLib
#Suite Setup    suite setup action
#Suite Teardown    delete school class   ${suitesetclassid}




*** Settings ***
Library    pylib.SchoolClassLib
Suite Setup   add school class    1  1班  60  suite_global_class_id
Suite Teardown  delete school class   ${suite_global_class_id}