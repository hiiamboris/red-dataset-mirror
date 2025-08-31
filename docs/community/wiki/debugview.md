[another possibility, compile with -d to enable prints ]
(https://github.com/red/red/wiki/%5BHOWTO%5D-VID-and-View-(GUI)-hints-and-tips#how-to-pass-data-to-second-window)
For debugging View apps, compile them with -d instead of -t Windows and run them from CMD. That will redirect the prints to the standard output.

DebugView++ gives you filtering, logs and other niceties,
  though your script must be compiled
```
needed a real-time debug monitor that listens for win32 OutputDebugStringA r/s, c.
  cGPT suggested https://github.com/CobaltFusion/DebugViewPP version 1.8, 1.5 still 32bit exe available for download
  it's an opensource intellectual fork of the old ms debugview that stopped working around win7


 regular view  with -t Windows seems to block console opening 
 so print & probe, print-line didn't work
  had to compile -t MSDos,  -r  apparently important too
 oddly enough, the gui sometimes opens a console which is why all the issues were closed?
 tried to open a console manually but would then need pipes or something to communicate.
 nothing is ever easy

hopefully someone can add missing pieces for other #OS, molding red-block!, red-string! etc.

Red [
	Title:		"win32 debugview caller"
	Author:		"ne1 cGPT4o"
	File:		%.reds 
	Version:	0.1.0
	Date:		"Sun 20250518 PM 14:10 "
	
    ; Needs:  'View
   ;icon: %test.ico	

]

ctx: context [ ; copy this into your script or change Red/System header & #include before and above use
	#system [
		#import [
			"kernel32.dll" stdcall [
				OutputDebugStringA: "OutputDebugStringA" [
					lpOutputString [int-ptr!]
					return: [int-ptr!]
				]
			]
		]
		
		_sys-debug: func [ "for use inside #system to send string to debugviewer"
			rtxt [c-string!]
		 ][
			OutputDebugStringA  as int-ptr! rtxt
		]

		;note: chicken egg, can't use before defined or included above
		_sys-debug "red-lang inside #system "	;to debugview++

	] ; e #system
	
    log-debug: routine [ "use from red code to send string to debugviewer"
		txt [string!]
		;/local s
	 ][
		OutputDebugStringA  as int-ptr! as c-string! string/rs-head txt
    ]
   
] ; e ctx

probe ctx/log-debug "red-lang debug fired^@"	;debugview++ adds time, tags line w/exe name, adds newline ^/
                   ; note ^@ null \0 added, the cast to c-string may not be adding it, would've fixed it if I knew how

forever [wait 9000]  
	; exe console apps exit very rudely after doing their business
	; they don't share a console so you can't start from cmd to solve the problem
	; maybe there's a cleaner way but nobody else seems to notice the problem
halt
```
see also the gist with [dbg-echo to outputdebugstring with call](https://gist.github.com/ne1uno/f3c17113f3bf6b342c681b85a6271274#file-dbg-echo-reds)

