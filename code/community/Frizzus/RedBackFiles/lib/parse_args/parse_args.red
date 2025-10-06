
check--arg: function [
	word [word!]
	check [block! function!]
	return: [logic!] "has the check passed"
] [
	case [
		function? :check [
			res: check word
			; If the function does not return a logic value then something is wrong.
			unless logic? res [
				do make error! "The checking function! does not return a logic! value."
			]
			;returning res because the check function has already been executed.
			return res
		]
		block? check [
			res: do check
			; If the block does not evaluate to a logic value then something is wrong.
			unless logic? res [
				do make error! "The checking block! does not evaluate to a logic! value."
			]
			;returning res because the check block has already been evaluated.
			return res
		]
	] 
]

set--arg: function [
	] []

set--opt: function [
	{Assign the word! argument to a string! value.
	For each argument, test if the value pass the check.
	The check argument is some code that must return true or false. depending on the results the argument will be taken as value or not.
	}
	word [word!]
	check [block! function!]
] [
	foreach arg system/options/args [
		set word arg
		; If the check passes then set the word
		if check--arg word check [
			; We delete the argument from system/options/args 
			; See ./README.md section "If there is too much arguments
			alter system/options/args arg
			exit
		]
	]
	; At the end if no argument pass the check then unset the argument.
	unset word
]

set--flag: function [
    {Assign the word! argument to a logic! value.
    It will check if the flag is present in the CLI arguments.}
    word [word!]
] [
	set word false
	foreach arg system/options/args [
		; If the argument correspond to the word then flag is on.
		if arg == to-string word [
			set word true
			; We delete the argument from system/options/args 
			; See ./README.md section "If there is too much arguments
			alter system/options/args arg
			exit
		]
	]
]
usage: function [
    "Print a help message."
] [
    print "This is the default help message."
]
