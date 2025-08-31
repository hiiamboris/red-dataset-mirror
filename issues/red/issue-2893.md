
#2893: if/either is not working as expected after case block
================================================================================
Issue is closed, was reported by Oldes and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2893>

When you compile this file and execute it, you will get crash:
```
Red [
	Title:  "Strange behavior test"
]
#system [

	test: context [

		_Play:           symbol/make "play"

		do: func[
			cmds [red-block!]
			/local
				cmd       [red-value!]
				tail      [red-value!]
				len       [integer!]
				start     [red-value!]
				pos		  [red-value!]
				value	  [red-value!]
				blk       [red-block!]
				word      [red-word!]
				sym       [integer!]
				type      [integer!]
				symb      [red-symbol!]
		][
			cmd:  block/rs-head cmds
			tail: block/rs-tail cmds
			len: -1
			
			while [cmd < tail][
				case [
					any [ TYPE_OF(cmd) = TYPE_WORD TYPE_OF(cmd) = TYPE_LIT_WORD ][
						start: cmd + 1
						word:  as red-word! cmd
						sym:   symbol/resolve word/symbol
						symb:  symbol/get sym
						print-line ["--> " symb/cache]
						case [
							sym = _Play [
								;---- HERE START THE PROBLEM
								case [
									true [0]
								]
								;----- HERE ENDS THE PROBLEM
								;comment out above code and it will work as expected

								blk: null

								pos: cmd + 1
								if pos < tail [
									value: pos
									if TYPE_OF(value) = TYPE_BLOCK [cmd: pos]
								]

								print-line ["??????? pos: " pos " cmd: " cmd " equal?: " (pos = cmd)]
								if pos = cmd [
									print-line "REALLY?"
									blk: as red-block! value
								]

								if blk <> null [
									print-line "CRASH?"
									print-line ["BLK: " block/rs-length? blk]
								]
							]
							true [ 0 ]
						]
					]
					true [ 0 ]
				]
				cmd: cmd + 1
			]
		]
	]
]

test: context [

	do: routine [
		commands [block!]
	][
		test/do commands
	]
]

test/do [
	play [volume: 0]
]
```

It is related to this commit: https://github.com/red/red/commit/6f89becc879a1d3e8775196273b95fb704298adf

Notice that problem is causing the part with `case`



Comments:
--------------------------------------------------------------------------------

On 2017-07-16T16:23:19Z, Oldes, commented:
<https://github.com/red/red/issues/2893#issuecomment-315620057>

    Here is crash output example:
    ```
    ??????? pos: 027FC260 cmd: 027FC250 equal?: false
    REALLY?
    CRASH?
    
    *** Runtime Error 1: access violation
    *** in file: /c/dev/GIT/Red/runtime/datatypes/block.reds
    *** at line: 25
    ***
    ***   stack: red/block/rs-length? 0018FF54h
    ***   stack: test/do 0278465Ch
    ***   stack: ctx303~do 0278465Ch
    
    ```

--------------------------------------------------------------------------------

On 2017-07-18T10:42:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2893#issuecomment-316026179>

    Thanks for the code and digging up the related commit, that's helpful!
    I can reproduce the issue.

