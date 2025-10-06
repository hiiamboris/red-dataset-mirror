Red[
	Info: https://developers.zomato.com/documentation
]

do https://rebolek.com/redquire
redquire 'http-tools

do %options.red
base-url: https://developers.zomato.com/api/v2.1/
; ---  support
compose-map: func [map][make map! compose map]
join: func [
	series
	/with delimiter
][
	unless with [delimiter: ""]
	remove rejoin collect [foreach value series [keep reduce [delimiter value]]]
]
convert-pair: func [
	; for big pair! values, divide them by 1'000
	; for even bigger values, divide them by 1'000'000
	data
	/local x y
][
	all [
		x: data/x
		y: data/y
		any [180 < absolute x 90 < absolute y]
		x: x / 1000.0
		y: y / 1000.0
		any [180 < absolute x 90 < absolute y]
		x: x / 1000.0
		y: y / 1000.0
	]
	reduce [x y]
]
send: func [
	link
	/with data
	/local result
][
	link: make-url reduce [base-url link data]
	result: send-request/with/verbose
		probe link
		'GET
		compose [Accept: application/json user-key: (api-key)]
	either equal? result/code 200 [
		result/data
	][
		do make error! result/data
	]
]
get-categories: does [
	collect [
		foreach cat select send /categories 'categories [keep cat/categories/name]
	]
]
get-cities: func [
	; NOTE: because pair! does not support float yet, pairs with one value higher than 180/90 are divided by 1000 to support better precision
	query "City name [string!], location [pair!] or ID(s) [integer! block!]"
	/limit count ; TODO
	/local x y city ids
][
	if pair? query    [set [x y] convert-pair query]
	if string? query  [city: query]
	if integer? query [query: append clear [] query]
	if block? query   [ids: join/with query comma]

	select send/with /cities probe compose-map [
		q: (city)
		lat: (x)
		lon: (y)
		city_ids: (ids)
	] 'location_suggestions
]
get-in-city: func [
	dest
	query
	/limit count ; TODO
	/local x y id
][
	; TODO: support string! also - would need to make request
	;		to get-cities first (and probably cache it for easier access)
	if pair? query    [set [x y] convert-pair query]
	if integer? query [id: query]
	send/with dest compose-map [
		city_id: (id)
		lat: (x)
		lon: (y)
	]
]
get-collections: func [query][get-in-city /collections query]
get-cuisines: func [query][get-in-city /cuisines query]
get-establishments: func [query][get-in-city /establishments query]
get-geocode: func [query [pair!]][get-in-city /geocode query]
; --- location
get-locations: func [query][get-in-city /locations query]
get-location-details: func [
	entity-id
	entity-type
][
	send/with /location_details compose-map [
		entity_id: (entity-id)
		entity_type: (entity-type)
	]
]
; ---restaurant
get-daily-menu: func [id][send/with /dailymenu compose-map [res_id: (id)]]
get-restaurant: func [id][send/with /restaurant compose-map [res_id: (id)]]
get-reviews: func [
	id
	start
	/limit count ; TODO
][
	send/with /reviews compose-map [res_id: (id)]
]
get-search: func [
	; TODO: This will need dialect , because there's soooo much options
	query
	/at
		position
	/radius
		rad
	/skip
		offset
	/local x y
][
	; entity types: [city subzone zone landmark metro group]
		if at [set [x y] convert-pair position]
		result: select send/with /search compose-map [
			q: (query)
			lat: (x)
			lon: (y)
			start: (offset)
			radius: (radius)
		] 'restaurants
]

test: [
	krpole: 49226x16595
	r: get-search/at/radius "" krpole 1000
]