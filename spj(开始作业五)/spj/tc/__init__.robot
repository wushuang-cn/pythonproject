*** Settings ***
Library    pylib/SchoolClassLib.py
Library    pylib/TeacherClassLib.py
Library    pylib/StudentLib.py


Suite Setup  Run keywords  delete all teacher
...    AND   delete all student
...     AND   delete all school classes
