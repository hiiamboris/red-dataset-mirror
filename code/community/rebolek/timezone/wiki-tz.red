Red[]

get-city-tz: func [name [string! url!] /local link zone] [
; -- load Wikipedia page
	link: either string? name [
	#TODO "For ambigious names, come up with a smart loader"
		replace/all name space #"_"
		rejoin [https://en.wikipedia.org/wiki/ name]
	] [
		name
	]
	page: read link

; -- find timezone
	parse page [
		thru {a href="/wiki/Time_zone"}
		thru {<td}
		thru {title="}
		copy zone to #"^""
	]

	zone
]

get-us-cities-zones: func [
	/local cities city link zone zones
] [
	zones: make block! 1000
	cities: get-us-cities
	foreach [city link] cities [
		probe city
		zone: probe get-city-tz link
		repend zones [city link normalize-zone zone]
	]
	zones
]

normalize-zone: func [
	zone
	/local result sign digit value
] [
	unless zone [return 0:00]
	result: 0:00
	sign: charset "+-−" ; second minus sign is U+2212
	digit: charset "0123456789"
	parse zone [
m1:
		"UTC" m2: sign m3: any space
		[
			copy value [1 2 digit #":" 2 digit]
			(result: probe load value)
		|	set value digit
			(result: probe to time! 60 * load form value)
		]
		to end
	]
	result
]
