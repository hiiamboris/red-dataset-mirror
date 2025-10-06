Red[]

segment!: context  [

;
;  --        1 
; |\/| 2  17  16  3
; |/\| 
;  --        4
; |\/| 5  14  10  6
; |/\|    
;  --        7
; | /| 8      13  9
; |/ |
;
;______________________________
;
;  -- --      18    19
;  \/|\/   24 28 15 29 25
;  /\|/\
;  -- --      20    21
;  \/|\/   30 26 11 27 31
;  /\|/\
;  -- --      22    23
;  \/|\/   48 49 32 50 51
;  /\|/\
;
;______________________________
;
; .  .      33    52
;  
;   \|/        36 40 37
; .         35
; | /|\     42 38 41 39
;  -----       43
; .     .   34        12
;  
;______________________________  
;
;

	soff: 4						;short-offset - offset from line to parallel border
	xsoff: 2					;extra-shoer offset
	loff: 8						;long-offset - offset from line start/end to border
	spacing: 5					;space between chars
	line-width: 6
	color: 126.161.165
	size: 40x80 				;char size
	middle: size / 2			;position of center point
	quarter: size / 4
	narrow: "1liI,.!:;"
	half: "j"
	left-kern: [2 5 8 42 33 34 35]
	right-kern: [3 6 9 12]
	kern-after: 0
	segs: none
	
	segments: [
		[line (as-pair loff soff) (as-pair size/x - loff soff)]									;1 upper bar
		[line (as-pair soff loff) (as-pair soff middle/y - soff)]								;2 upper-left post
		[line (as-pair size/x - soff loff) (as-pair size/x - soff middle/y - soff)]				;3 upper-right post
		[line (as-pair loff middle/y) (as-pair size/x - loff middle/y)]							;4 middle bar
		[line (as-pair soff middle/y + soff) (as-pair soff size/y - loff)]						;5 lower-left post
		[line (as-pair size/x - soff middle/y + soff) (as-pair size/x - soff size/y - loff)]	;6 lower-right post
		[line (as-pair loff size/y - soff) (as-pair size/x - loff size/y - soff)]				;7 lower bar
		[line (as-pair soff size/y) (as-pair soff size/y + (middle/y / 2))]						;8 underline-left post
		[line (as-pair size/x - soff size/y) (as-pair size/x - soff size/y + (middle/y / 2))]	;9 underline-right post
		[line (as-pair loff size/y - loff) (as-pair size/x - loff middle/y + soff)]				;10 lower rising cross
		[line (as-pair middle/x middle/y + soff) (as-pair middle/x size/y - loff)]				;11 lower middle post
		[line (as-pair size/x - soff size/y - xsoff) (as-pair size/x - soff size/y - soff)]		;12 lower right dot
		[line (as-pair size/x - loff size/y ) (as-pair loff size/y + (middle/y / 2))]			;13 underline right slant
		[line (as-pair loff middle/y + soff) (as-pair size/x - loff size/y - loff)]				;14 lower right back slant
		[line (as-pair middle/x loff) (as-pair middle/x middle/y - soff)]						;15 upper middle post
		[line (as-pair loff middle/y - soff) (as-pair size/x - loff loff)]		 				;16 upper rising cross
		[line (as-pair loff loff) (as-pair size/x - loff middle/y - soff)]						;17 upper descending cross
		[line (as-pair loff soff) (as-pair middle/x - soff soff)]								;18 upper left half bar
		[line (as-pair middle/x + soff soff) (as-pair size/x - loff soff)]						;19 upper right half bar
		[line (as-pair loff middle/y) (as-pair middle/x - soff middle/y)]						;20 middle left half bar
		[line (as-pair middle/x + soff middle/y) (as-pair size/x - loff middle/y)]				;21 middle right half bar
		[line (as-pair loff size/y - soff) (as-pair middle/x - soff size/y - soff)]				;22 lower left half  bar
		[line (as-pair middle/x + soff size/y - soff) (as-pair size/x - loff size/y - soff)]	;23 lower right half bar
		[line (as-pair loff loff) (as-pair middle/x - xsoff middle/y - soff)]	 				;24 upper left back slant
		[line (as-pair size/x - loff loff) (as-pair middle/x + xsoff middle/y - soff)]			;25 upper right slant
		[line (as-pair loff size/y - loff) (as-pair middle/x - xsoff middle/y + soff)]			;26 lower left slant
		[line (as-pair middle/x + xsoff middle/y + soff) (as-pair size/x - loff size/y - loff)]	;27 lower right back slant
		[line (as-pair middle/x - xsoff loff) (as-pair loff middle/y - soff)]	 				;28 upper left slant
		[line (as-pair middle/x + xsoff loff) (as-pair size/x - loff middle/y - soff)]			;29 upper right back slant
		[line (as-pair loff middle/y + soff) (as-pair middle/x - xsoff size/y - loff)]			;30 lower left back slant
		[line (as-pair middle/x + xsoff size/y - loff) (as-pair size/x - loff middle/y + soff)]	;31 lower right slant
		[line (as-pair middle/x size/y) (as-pair middle/x size/y + (middle/y / 2))]				;32 underline middle post
		[line (as-pair soff soff) (as-pair soff loff)]											;33 upper-left dot
		[line (as-pair soff size/y - loff) (as-pair soff size/y - soff)]						;34 lower-left dot
		[line (as-pair soff middle/y) (as-pair soff middle/y + soff)]							;35 middle-left dot
		[line (as-pair quarter/x + soff quarter/y + soff) 
			  (as-pair middle/x - soff middle/y - loff)]										;36 upper left half back slant
		[line (as-pair middle/x + quarter/x - soff quarter/y + soff) 
			  (as-pair middle/x + soff middle/y - loff)]										;37 upper right half slant
		[line (as-pair middle/x - soff middle/y + loff) 
			  (as-pair quarter/x + soff middle/y + quarter/y - soff)]							;38 lower left half slant
		[line (as-pair middle/x + soff middle/y + loff) 
			  (as-pair middle/x + quarter/x - soff middle/y + quarter/y - soff)]				;39 lower right half back slant
		[line (as-pair middle/x quarter/y + soff) (as-pair middle/x middle/y - soff)]			;40 upper middle half post
		[line (as-pair middle/x middle/y + soff) (as-pair middle/x middle/y + quarter/y - soff)];41 lower middle half post
		[line (as-pair soff middle/y + soff) (as-pair soff size/y - quarter/y - soff)]			;42 lower left half post
		[line (as-pair loff size/y - quarter/y - soff) 
			  (as-pair size/x - loff size/y - quarter/y - soff)]								;43 lower middle bar
		[line (as-pair loff quarter/y) (as-pair size/x - loff middle/y - soff)]					;44 upper descending half cross
		[line (as-pair loff size/y - quarter/y) (as-pair size/x - loff middle/y + soff)]		;45 lower ascending half cross
		[line (as-pair loff middle/y - soff) (as-pair size/x - loff quarter/y)]					;46 upper ascending half cross
		[line (as-pair loff middle/y + soff) (as-pair size/x - loff size/y - quarter/y)]		;47 lower descending half cross
		[line (as-pair soff size/y) (as-pair middle/x - soff size/y + quarter/y)]				;48 underline left half back slant
		[line (as-pair middle/x size/y) (as-pair loff + soff size/y + quarter/y)]						;49 underline left half slant
		[line (as-pair middle/x size/y) (as-pair size/x - loff size/y + quarter/y)]				;50 underline right half back slant
		[line (as-pair size/x - soff size/y) (as-pair middle/x + loff size/y + quarter/y)]		;51 underline right half slant
		[line (as-pair middle/x soff) (as-pair middle/x loff)]									;52 upper-middle dot
		
	]
	chars: [
		#"0" [1 2 3 5 6 7]
		#"1" [2 5]
		#"2" [1 3 4 5 7]
		#"3" [1 3 4 6 7]
		#"4" [2 3 4 6]
		#"5" [1 2 4 6 7]
		#"6" [1 2 4 5 6 7]
		#"7" [1 3 6]
		#"8" [1 2 3 4 5 6 7]
		#"9" [1 2 3 4 6 7]
		
		#"A" [1 2 3 4 5 6]
		#"B" [2 4 5 6 7 18 29]
		#"C" [1 2 5 7]
		#"D" [2 5 18 29 22 31]
		#"E" [1 2 5 7 20]
		#"F" [1 2 5 20]
		#"G" [1 2 5 6 7 21]
		#"H" [2 3 4 5 6]
		#"I" [2 5]
		#"J" [3 6 23 30]
		#"K" [2 5 14 16]
		#"L" [2 5 7]
		#"M" [2 3 5 6 24 25]
		#"N" [2 3 5 6 24 27]
		#"O" [1 2 3 5 6 7]
		#"P" [1 2 3 4 5]
		#"Q" [1 2 3 5 6 7 32]
		#"R" [1 2 3 4 5 27]
		#"S" [1 2 4 6 7]
		#"T" [1 11 15]
		#"U" [2 3 5 6 7]
		#"V" [2 3 30 31]
		#"W" [2 3 5 6 26 27]
		#"X" [24 25 26 27]
		#"Y" [24 25 11]
		#"Z" [1 25 26 7]
		
		#"a" [4 5 6 10]
		#"b" [2 4 5 10];6 7]
		#"c" [4 5 7]
		#"d" [3 4 5 6 10];7]
		#"e" [4 5 7 10]
		#"f" [15 11 20 21 49];32]
		#"g" [4 5 6 10 51];9]
		#"h" [2 4 5 6]
		#"i" [5 33]
		#"j" [11 49 52]
		#"k" [2 4 5 14]
		#"l" [2 5]
		#"m" [20 21 5 6 11]
		#"n" [4 5 6]
		#"o" [4 5 6 7]
		#"p" [4 5 6 7 8]
		#"q" [4 5 6 7 9];32]
		#"r" [4 5]
		#"s" [4 14 7]
		#"t" [20 21 11 15 23]
		#"u" [5 6 7]
		#"v" [30 31]
		#"w" [5 6 26 27]
		#"x" [10 14]
		#"y" [30 31 49];32]
		#"z" [4 7 10]
		
		#" " []
		#"," [8]
		#"." [34]
		#"-" [4]
		#">" [44 45]
		#"<" [46 47]
		#"(" [28 30]
		#")" [29 31]
		#":" [35 34]
		#";" [35 8]
		#"!" [2 34 42]
		#"?" [18 15 20 34 42]
		#"+" [20 21 40 41]
		#"*" [20 21 36 37 38 39]
		#"}" [18 15 11 22 21]
		#"{" [19 15 11 23 20]
		#"/" [25 26]
		#"=" [4 43]
		#"[" [19 15 11 23]
		#"]" [18 15 11 22]
		#"@" [11 20 5 7 6 3 1]
		#"^/" []
	]
	kern: func [char][
		if empty? intersect segs left-kern [offset/x: offset/x - soff]
		if char = #"j" [offset/x: offset/x - loff]
		kern-after: case [
			find narrow char [0]
			empty? intersect segs right-kern [soff]
			'else [0]
		]
	]
	make-char: func [/local num][
		collect [
			foreach num segs [
				keep compose segments/:num
			]
		]
	]
	draw: func [
		text
		/local canvas line
	][
		text: form text
		canvas: copy []
		offset: 5x0
		line: 1
		
		foreach char text [
			either char = newline [
				line: line + 1
				offset/y: offset/y + (size/y + middle/y)
				offset/x: line * 10
			][
				segs: select chars char
				kern char
				append canvas compose/only [
					translate (offset) (make-char)
				]
				offset/x: offset/x + (case [
					find/case narrow char [loff]
					find/case half char [middle/x + loff]
					'else [size/x]
				]) + spacing - kern-after; TODO: add spacing as settings
			]
		]
		compose/only [
			line-width (line-width)
			line-cap round
			pen (color)
			skew -3 (canvas)
		]
	]
]
