
*** Settings ***
Library    pylib.TeacherClassLib
Suite Setup   add teacher class     ${suite_global_class_id}  wushuang  wushuang   13612845422    test@qq.com  43032119900525072X  suite_global_teacher_id
Suite Teardown  delete teacher   ${suite_global_teacher_id}