int bin_add(int a[], int b[], int c[], int len) {
	int carry ,i;
	
	carry = 0;
	for (i = 0; i < len; +=i) {
		c[i] = a[i] + b[i] + carry;
		if (c[i] == 10) {
			c[i] = 0;
			carry = 1;
		}
	}
	c[i] = carry;

	return 0;
}

