# youtube-mp3.org does some weird encoding of an 's' parameter it checks with each request. Eg. /?s=foo&bar=baz&....

# Encoding Logic From youtube-mp3.org
# Figured out the encoding logic from their JavaScript file rendered in the browser
def getSparam(url):
	url = url.lower()
	A = {
			"a": 870,
 			"b": 906,
			"c": 167,
			"d": 119,
			"e": 130,
			"f": 899,
			"g": 248,
			"h": 123,
			"i": 627,
			"j": 706,
			"k": 694,
			"l": 421,
			"m": 214,
			"n": 561,
			"o": 819,
			"p": 925,
			"q": 857,
			"r": 539,
			"s": 898,
			"t": 866,
			"u": 433,
			"v": 299,
			"w": 137,
			"x": 285,
			"y": 613,
			"z": 635,
			"_": 638,
			"&": 639,
			"-": 880,
			"/": 687,
 			"=": 721
	}
	r3 = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
	F = 1.51214
	N = 3219
	i = 0
	while i<len(url):
		Q = list(url)
		q = Q[i]
		if q in r3:
			q = int(q)
			N = N + (q*121*F)
		else:
			q = A.get(q,0)
			N = N + (q*F)
		N = N * 0.1
		i = i + 1
	
	N = round(N*1000)
	return str(N)
