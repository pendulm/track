import xapian

db = xapian.Database("xapian.db")
eq = xapian.Enquire(db)
query_parser = xapian.QueryParser()
class Cont(object):
    def __init__(self):
        self.url = None
        self.title = None
        self.docid = None

def get_back(query_string):
    query = query_parser.parse_query(query_string)
    eq.set_query(query)
    ms = eq.get_mset(0, 10)
    n = ms.get_matches_estimated()
    docs = [m.document for m in ms]
    cont = []
    for d in docs:
        tmp = Cont()
        tmp.url = d.get_value(0)
        tmp.title = d.get_value(1).decode('utf-8')
        tmp.docid = d.get_docid()
        cont.append(tmp)
    return (n, cont)

def get_doc(docid):
    return db.get_document(docid)
