Red[]

get-us-cities: func [
	"Grab a list of US cities from Wikipedia"
	/local link page cities
] [
	link: https://en.wikipedia.org/wiki/List_of_United_States_cities_by_population
	page: read link
	cities: make block! 700
	parse page [
		thru "50_states_and_the_District_of_Columbia"
		thru <table class="wikitable sortable" style="text-align:center">
		thru {<th} thru </th>
		some [
			</tbody></table> break
		|	thru <tr>
			thru <th scope="row">
			thru {<a href="} copy link to #"^""
			thru {title="} copy name to #"^""
			(repend cities [name rejoin [https://en.wikipedia.org link]])
			thru </tr>
		]
	]
	cities
]
