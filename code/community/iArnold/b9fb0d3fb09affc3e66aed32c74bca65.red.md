# 

**Gist ID:** b9fb0d3fb09affc3e66aed32c74bca65
**Created:** 2017-07-10T13:57:45Z
**Last updated:** 2017-07-10T13:57:45Z

## File: `set-iso-week.red`

```Red
Red []
set-iso-week: function [
	"Returning a new date set on the first day of that week for a given date and weeknumber"
	date [date!] 
	/week weeknumber [integer!]
	/local resultdate ordinal jan4 dec31 daysinyear daysinlastyear
][
	jan4: dec31: resultdate: now/date
	jan4/day: 4
	jan4/month: 1
	jan4/year: date/year

	dec31/day: 31
	dec31/month: 12
	daysinyear: dec31/yearday

	;ordinal: 7 * date/week + date/weekday - (jan4/weekday + 3)
	either week [
		ordinal: 7 * weeknumber + 1 - (jan4/weekday + 3)               ;-- We want first date of the week
	][
		ordinal: 7 * date/week + 1 - (jan4/weekday + 3)               ;-- We want first date of the week
	]
	case [
		ordinal < 1 [
			dec31/year: dec31/year - 1
			daysinlastyear: dec31/yearday
			ordinal: ordinal + daysinlastyear
		]
		ordinal > daysinyear [
			ordinal: ordinal - daysinyear
		]
	]
	either 366 = daysinyear [
		case [
			ordinal > 335 [ 
				resultdate/month: 12
				resultdate/day: ordinal - 335
			]
			ordinal > 305 [ 
				resultdate/month: 11
				resultdate/day: ordinal - 305
			]
			ordinal > 274 [ 
				resultdate/month: 10
				resultdate/day: ordinal - 274
			]
			ordinal > 244 [ 
				resultdate/month: 9
				resultdate/day: ordinal - 244
			]
			ordinal > 213 [ 
				resultdate/month: 8
				resultdate/day: ordinal - 213
			]
			ordinal > 182 [ 
				resultdate/month: 7
				resultdate/day: ordinal - 182
			]
			ordinal > 152 [ 
				resultdate/month: 6
				resultdate/day: ordinal - 152
			]
			ordinal > 121 [ 
				resultdate/month: 5
				resultdate/day: ordinal - 121
			]
			ordinal > 91  [ 
				resultdate/month: 4
				resultdate/day: ordinal - 91
			]
			ordinal > 60  [ 
				resultdate/month: 3
				resultdate/day: ordinal - 60
			]
			ordinal > 31  [ 
				resultdate/month: 2
				resultdate/day: ordinal - 31
			]
			true [ 
				resultdate/month: 1
				resultdate/day: ordinal
			]	
		]	
	][
		case [
			ordinal > 334 [ 
				resultdate/month: 12
				resultdate/day: ordinal - 334
			]
			ordinal > 304 [ 
				resultdate/month: 11
				resultdate/day: ordinal - 304
			]
			ordinal > 273 [ 
				resultdate/month: 10
				resultdate/day: ordinal - 273
			]
			ordinal > 243 [ 
				resultdate/month: 9
				resultdate/day: ordinal - 243
			]
			ordinal > 212 [ 
				resultdate/month: 8
				resultdate/day: ordinal - 212
			]
			ordinal > 181 [ 
				resultdate/month: 7
				resultdate/day: ordinal - 181
			]
			ordinal > 151 [ 
				resultdate/month: 6
				resultdate/day: ordinal - 151
			]		
			ordinal > 120 [ 
				resultdate/month: 5
				resultdate/day: ordinal - 120
			]
			ordinal > 90  [ 
				resultdate/month: 4
				resultdate/day: ordinal - 90
			]
			ordinal > 59  [ 
				resultdate/month: 3
				resultdate/day: ordinal - 59
			]
			ordinal > 31  [ 
				resultdate/month: 2
				resultdate/day: ordinal - 31
			]
			true [ 
				resultdate/month: 1
				resultdate/day: ordinal
			]	
		]
	]
	resultdate
]

;>> set-iso-week 11-08-2017
;== 7-Aug-2017
;>> set-iso-week/week 11-08-2017 10
;== 6-Mar-2017
```

## Comments

No comments.
