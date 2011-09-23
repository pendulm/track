def have_two_add_eq(a, n):
    mergesort(a, 0, len(a) - 1)

    for i in a:
        if binsearch(a, n - i):
            return True
    return False
