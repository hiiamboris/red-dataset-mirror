Red[]

do %coris.red
do %../bbchart.red

window: [
	below
	h4 "Red watch - RED coin price watcher"
	panel [
		across
		button "Refresh" [
			get-data
			update-window
		]
		text "Current price:"
		text-price: text 150 "0.0 RED/ETH"
		text "Volume:"
		text-volume: text 150 ""		
	]
;	cc: chart
	panel [
		across
		button "day" [resolution: 'day get-data update-window]
		button "hour" [resolution: 'hour get-data update-window]
		button "minute" [resolution: 'minute get-data update-window]
		check "volume" on [allow 'bar volumes 2 face/data]
		check "candlestick" on [allow 'candle klines 1 face/data]
		button "scroll" [
			face/rate: either face/rate [none][1] 
		] on-time [
			foreach chart cc/extra/charts [
				chart/opts/range/1: chart/opts/range/1 + 1
			]
			update-window
		]
	]
]

insert window chart-style
view window
