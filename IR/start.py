import xapian
db = xapian.WritableDatabase("ttttt", xapian.DB_CREATE_OR_OPEN)
indexer = xapian.TermGenerator()
def insert(a,b):
    doc = xapian.Document()
    doc.set_data(a)
    indexer.set_document(doc)
    indexer.index_text(b)
    db.add_document(doc)
    db.flush()

