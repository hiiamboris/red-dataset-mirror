# string-to-integer convertion

**Gist ID:** d414bbbbc5c3e72fbf6e
**Created:** 2015-06-17T19:10:29Z
**Last updated:** 2016-04-06T15:40:41Z

## File: `string-to-integer.red`

```Red
string-to-integer: function [
	input [string!]
	return: [integer! none!]
	/local
	total [integer!]
	in-char [char! string!]
	cipher [integer!]
	is-number [logic!]
][
	is-number: false
	total: 0
	
	forall input [
		if is-number [
			in-char: first input
			cipher: switch/default in-char [
						#"1" [1]
						#"2" [2]
						#"3" [3]
						#"4" [4]
						#"5" [5]
						#"6" [6]
						#"7" [7]
						#"8" [8]
						#"9" [9]
						#"0" [0]
					][
						none!
					]
					
			either none! = type? cipher [
				is-number: false
			][
				total: total * 10 + cipher
			]
		]
	]
	return either is-number [ total ][ none! ]
]
```

## Comments

### @Zamlox on 2016-04-06T14:55:16Z

Few optimizations:

```
string-to-integer: function [
    input [string!]
    return: [integer! none!]
    /local
    total [integer!]
    cipher [integer!]
][
    if empty? input [return none]
    total: 0
    forall input [
        cipher: switch/default first input [
                    #"1" [1]
                    #"2" [2]
                    #"3" [3]
                    #"4" [4]
                    #"5" [5]
                    #"6" [6]
                    #"7" [7]
                    #"8" [8]
                    #"9" [9]
                    #"0" [0]
                ][
                    return none
                ]
        total: total * 10 + cipher
    ]
    total
]
```


