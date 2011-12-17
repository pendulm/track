from model import Model
import attrtype

class Blog(Model):
    auther = attrtype.TextType()
    pk = int
    content = str
    a1 = int
    a2 = int 
    a3 = int 
    a4 = int
    a5 = int
    a6 = int


print Blog.attr
print dir(Blog)
