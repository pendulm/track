def mergesort(a, l, r):

    def merge(a, l ,m, r):
        al = a[l:m+1]
        ar = a[m+1:r+1]
        al.append(float('inf'))
        ar.append(float('inf'))
        i = 0
        j = 0

        for k in range(l, r + 1):
            if al[i] < ar[j]:
                a[k] = al[i]
                i += 1
            else:
                a[k] = ar[j]
                j += 1

    def merge_nos(a, l, m, r):
        al = a[l:m+1]
        ar = a[m+1:r+1]
        i = 0
        j = 0

        for k in range(l, r + 1):
            if i == len(al) or j == len(ar):
                break
            if al[i] < ar[j]:
                a[k] = al[i]
                i += 1

            else:
                a[k] = ar[j]
                j += 1
        if i == len(al):
            a[k:r+1] = ar[j:len(ar)]
        else:
            a[k:r+1] = al[i:len(al)]

    def count_inversion(a, l, m, n):
        al = a[l:m+1]
        ar = a[m+1:r+1]
        i = 0
        j = 0

        for k in range(l, r + 1):
            if i == len(al) or j == len(ar):
                break
            if al[i] > ar[j]:
                a[k] = ar[j]
                j += 1
                inversion = al - i
            else:
                a[k] = al[i]
                i += 1
        if i == len(al):
            a[k:r+1] = ar[j:len(ar)]
        else:
            a[k:r+1] = al[i:len(al)]

        return inversion



    if l < r:
        m = (l + r) / 2
        mergesort(a, l, m)
        mergesort(a, m + 1, r)
        merge_nos(a, l, m ,r)

a = [5,4,7,1,3,2,6]
mergesort(a, 0, len(a) - 1)
print a
