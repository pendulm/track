#!/usr/bin/env python
# coding: utf-8

from bisect import bisect_left

class Wdict(object):
    def __init__(self, f):
        # _cache = {}
        self.build_dict(f)
        self._d.append(None)
        self.size = len(self._d)

    def __contains__(self, item):
        # _cache
        rightbound = len(self._d) - 1
        i = bisect_left(self._d, item, hi=rightbound)
        return self._d[i] == item

    def __getitem__(self, key):
        return self._d[key]

    def __len__(self):
        return self.size

    def build_dict(self, f):
        self._d = []
        for l in f:
            self._d.append(l.strip().decode('utf-8'))

if __name__ == "__main__":
    with open("cooked.dict") as f:
        a = u"中华人民"
        b = u"无中生有"
        c = u"尖锐湿"
        wdict = Wdict(f)

        print a in wdict,
        rightbound = len(wdict) - 1
        i = bisect_left(wdict._d, a, hi=rightbound)
        print wdict[i]

        print b in wdict,
        rightbound = len(wdict) - 1
        i = bisect_left(wdict._d, b, hi=rightbound)
        print wdict[i]

        print c in wdict,
        rightbound = len(wdict) - 1
        i = bisect_left(wdict._d, c, hi=rightbound)
        print wdict[i]

