import  os

def read_file(data,filename):
    return  os.path.join(os.path.dirname(os.path.dirname(__file__)),data,filename) #data是filename的上级文件夹名称

