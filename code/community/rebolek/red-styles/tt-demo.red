Red [
	Title: "Text table demo"
]

do %../red-tools/xml.red
do %../red-tools/html-tools.red
do %../red-tools/json.red

do %scroller.red
do %text-table.red
do %chart.red

simple-table: [
	["ID" "Name" "Age" "City"]
	[#1 "John" 32 "Brno"]
	[#2 "Paul" 34 "Adamov"]
	[#3 "George" 28 "Jeseník"]
	[#4 "Ringo" 12 "Liverpool"]
]

main: [
	tab-panel [
		"Text-table" [
			button "test" [
				load-data
			]
			ff: field 400 [
				probe tt/extra/cell-index
				tt/extra/set-cell-content tt tt/extra/cell-index ff/text
				tt/extra/draw-table tt
			]
			return
			tt: text-table ; FIXME: Can't use T here, why?
			scroller
			return
			text "X padding" slider 40% [tt/extra/cell-padding/x: to integer! 20 * face/data tt/extra/draw-table tt] 
			text "Y padding" slider 40% [tt/extra/cell-padding/y: to integer! 20 * face/data tt/extra/draw-table tt]
			check "Alternate colors?" [tt/extra/alt-color?: face/data tt/extra/draw-table tt]
			return
			text "Background" field "220.250.220" [tt/extra/background: to tuple! face/data tt/extra/draw-table tt]
			text "Border" 
			radio "Full" [tt/extra/row-border: 'full tt/extra/draw-table tt]
			radio "Horizontal" [tt/extra/row-border: 'horizontal tt/extra/draw-table tt]
			radio "None" [tt/extra/row-border: none tt/extra/draw-table tt]
			return
			text "Highlight"
			radio "Cell" [tt/extra/highlight/style: 'cell]
			radio "Row" [tt/extra/highlight/style: 'row]
			radio "Column" [tt/extra/highlight/style: 'column]
			return
			text "Stats: 0" 400 rate 1 on-time [face/text: rejoin ["Stats: " stats]]
		]
		"Chart" [
			gp: chart
			return
			radio "line"      [gp/extra/mode: 'line gp/extra/redraw gp]
			radio "spline" on [gp/extra/mode: 'spline gp/extra/redraw gp]
			radio "box"       [gp/extra/mode: 'box gp/extra/redraw gp]
		]
	]
]


offline?: true	
load-table-data: function [/extern tt] [
	if any [offline? error? try [
		page: xml/decode read https://coinmarketcap.com/
		table: get-table/trim/header select-by page 'table 'tag
	]][
		table: simple-table
	]
	tt/extra/set-data tt table
]
load-chart-data: does [
	if any [offline? error? try [
		coin: json/decode read https://api.coindesk.com/v1/bpi/historical/close.json?start=2017-01-01&end=2017-08-19
		save %coin.data coin
	]][coin: do load %coin.data]
	if any [offline? error? try [
		altcoin: json/decode read https://api.coindesk.com/v1/bpi/historical/close.json?start=2017-01-01&end=2017-04-19
		save %altcoin.data coin
	]][altcoin: do load %altcoin.data]

	gp/data: reduce [
		values-of coin/bpi
		random values-of altcoin/bpi
	]
	gp/extra/redraw gp
]


insert main chart-style
insert main text-table-style
insert main scroller-style
main: layout main
view/no-wait main
load-table-data
load-chart-data


do-events