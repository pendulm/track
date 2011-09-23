def binsearch(a, key):
    l = 0
    r = len(a) - 1
    while l <= r:
        m = (l + r) / 2
        if a[m] == key:
            return m
        if a[m] > key:
            r = m - 1
        else:
            l = m + 1

    return nil

def binsearch_red(a, l, r, key):
    if l > r:
        return nil
    m = (l + r) / 2
    if a[m] == key:
        return m
    if a[m] > key:
        return binsearch_red(a, l, m - 1, key)
    else:
        return binsearch_red(a, m + 1, r, key)
