import sys,pprint
sys.path.append('D:\\作业20190922\\第9次作业\\模块与包-题目\\第9次作业-模块与包-task06\\task07\\Python')
pprint.pprint (sys.path)
from  python.apple.iphone6 import askPrice as askPrice_6
from  python.apple.iphone7 import askPrice as askPrice_7
from  python.samsung.note.galaxy_note8 import  askPrice as askPrice_note8
from  python.samsung.s.galaxy_s7 import askPrice as askPrice_s7


askPrice_6()
askPrice_7()
askPrice_note8()
askPrice_s7()
