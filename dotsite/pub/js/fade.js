function f() {
	var flyaway = document.getElementById('flyaway');
	flyaway.onclick = null;
	var c = 0;
	fade = function() {
		if(c < 16) {
			var color = c.toString(16)
			flyaway.style.color = '#' + color + color + color ;
			c += 1 ;
			setTimeout(fade, 250);
			if (c === 16) {
				setTimeout(function() {
					flyaway.parentNode.removeChild(flyaway);
				}, 300);
			}
		}
	}
	setTimeout(fade, 250);
}
