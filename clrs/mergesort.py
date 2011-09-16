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

    if l < r:
        m = (l + r) / 2
        mergesort(a, l, m)
        mergesort(a, m + 1, r)
        merge(a, l, m ,r)

a = [5,4,7,1,3,2,6]
mergesort(a, 0, 6)
print a
