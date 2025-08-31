# 

**Gist ID:** aa1d5cec15f1eb4b11ece61dcebba22c
**Created:** 2018-03-27T03:40:59Z
**Last updated:** 2018-03-27T03:48:04Z

## File: `pomodoro.red`

```Red
Red [
  Purpose: "Implements a Pomodoro timer"
  Note: "Original code from https://gitter.im/red/red/gui-branch?at=5ab95dae2b9dfdbc3a25636a"
]

Pomodoro: does [
	context [
		t: diff: b1: b2: end: none
		view/no-wait [
			title "Pomodoro"
			t: text "25:00" on-time [
				diff: difference end now
				t/text: rejoin [diff/minute ":" pad/left/with form to-integer diff/second 2 #"0"]
				if negative? diff/minute [print "alarm"]
			]
			b1: button "start" [
				t/rate: 10
				end: now + 0:25
			]
			b2: button "pause" [
				end: either t/rate [difference end now][end + now]
				b2/text: pick ["continue" "pause"] to-logic t/rate
				t/rate: all [none? t/rate 10]
			]
		]    
	]
]

pomodoro
```

## Comments

No comments.
