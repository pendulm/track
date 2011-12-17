import attrtype

class metacls(type):
    def __new__(mcs, name, bases, dic):
        attr = []
        attr.append(('pk', attrtype.PKType())
        for i in dic.keys(): # in py3 this will cause error
            if issubclass(dic[i].__class__, attrtype.AttrType):
                attr.append((i, dic[i]))
                del dic[i]
        dic['attr'] = attr
        return type.__new__(mcs, name, bases, dic)

class Model(object):
    __metaclass__ = metacls

    @classmethod
    def select(**condition):
        pass

    @classmethod
    def add():
        pass

    @classmethod
    def delete():
        pass

    def __init__(self):
        pass

    def save(self):
        pass
