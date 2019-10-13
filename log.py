def getName(str):
    index1 = str.find('the name is ')
    index2 = str.find(',level')
    print(str[index1 + len('the name is '):index2])

getName('A pretty boy come in, the name is Patrick,level 194')