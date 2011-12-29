# coding: utf-8
import xapian
import urllib
import re
from collections import deque
from nsp import ssplit


seed = r'http://news.qq.com'
match_url = r'http://news.qq.com/a/\d+/\d+.htm'
db = xapian.WritableDatabase("xapian.db", xapian.DB_CREATE_OR_OPEN)
indexer = xapian.TermGenerator()

cont = urllib.urlopen(seed).read()
diver_urls = re.findall(match_url, cont)

wait_queue = deque(diver_urls)
url_pool = {seed}
num = 0

while len(wait_queue) > 0:
    cur_url = wait_queue.popleft()
    if cur_url in url_pool:
        continue
    url_pool.add(cur_url)
    cont = urllib.urlopen(cur_url).read()
    cont = cont.decode('gbk')
    diver_urls = re.findall(match_url, cont)
    wait_queue.extend(diver_urls)
    doc = xapian.Document()
    doc.set_data(cont)
    tmp_list = re.findall("<h1>.*</h1>", cont)
    if tmp_list:
        title = tmp_list[0][4:-5]
    doc.add_value(0, cur_url)
    doc.add_value(1, title)
    indexer.set_document(doc)
    for i in ssplit(title):
        indexer.index_text(i)
    db.add_document(doc)
    num += 1
    print num
    if num == 1000:
        break

db.flush()
print "complete scratch 1000 pages"
