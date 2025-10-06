
init: ["{" ws any value ws any ["," ws value | ws value] ws "}"]
value: [init | copy num some INT num-dispatch]
INT: charset "0123456789"
ws: [any space]

num-dispatch: [
	(print mold to-hex to-integer num)
]
