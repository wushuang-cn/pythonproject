import pytest
from Pytest.Pylib import test_列出班级
@pytest.fixture(scope='package',autouse=True)
def st_clearAll(request):
    print(f'\n---初始化：构造空白数据环境')
    #初始化代码
    def fin():
        #清除代码
        print(f'\n--清除：空白数据环境')
    request.addfinalizer(fin)
