int insertsort(int a[], int len) {
	int i, j;
	int key;
	if (len < 2)
		return 0;

	for (i = 2; i < len; ++i) {
		j = i - 1;
		key = a[i]
		while(a[j] > a[j + 1]) {
			a[j + 1] = a[j];
			--j;
		}
		a[j + 1] = key;
	}
	return 0;
}

int rinsertsort(int a[], int len) {
	int i, j;
	int key;
	if (len < 2)
		return 0;

	for (i = 2; i < len; ++i) {
		j = i - 1;
		key = a[i]
		while(a[j] < a[j + 1]) {
			a[j + 1] = a[j];
			--j;
		}
		a[j + 1] = key;
	}
	return 0;
}
