*** Settings ***
Library    pylib/SchoolClassLib.py
Library    pylib/TeacherClassLib.py
Library    pylib/StudentLib.py
Library    tc/d-class0701/C000082a.py


Suite Setup   add student  张同学  张同学  1     ${suite_global_class_id}   13612845421   suite_global_student_id
Suite Teardown  delete_student   ${suite_global_student_id}