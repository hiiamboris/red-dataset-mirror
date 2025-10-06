Red [
	Title:  "Basic set of tests for the CLI module"
	Author: @hiiamboris
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %../common/debug.red
#include %../common/assert.red
#include %cli.red
    
context bind [
test-prog-1: func [
	a [integer!] b [file!] c [time! date! block!] "docstring of c"
	/x
	/y "docstring of y"
		y1 [float!] "docstring of y1" 
	/y2 "alias y"
	/z "docstring of z"
		z1 [block! date!] "docstring of z1"
	/local q
][
	compose/only [a: (a) b: (b) c: (c) x: (x) y: (y) y1: (y1) y2: (y2) z: (z) z1: (z1)]
]

test-prog-2: func [a b] [
	compose/only [a: (a) b: (b)]
]

test-prog-3: func [/a x [logic! block!] /b y [logic!] /c z [logic! string!]] [
	compose/only [a: (a) x: (x) b: (b) y: (y) c: (c) z: (z)]
]

eval-consts: function [block [block!]] [
	replace/all block 'false false
	replace/all block 'true  true
	replace/all block 'none  none
]

test-ok-1: function [want [block!] args [block!] /with more [block!]] [
	eval-consts want
	got: apply 'process-into compose [test-prog-1 /args on args (only more)]
	assert [want = got]
]
test-ok-3: function [want [block!] args [block!]] [
	eval-consts want
	got: apply 'process-into compose [test-prog-3 /args on args]
	assert [want = got]
]

handler: func [state [map!] complaint [block!]] [return complaint/1]

test-fail-1: function ['code [word!] args [block!] /with more [block!]] [
	got: apply 'process-into compose [test-prog-1 /args on args /on-error on :handler (only more)]
	assert [code = got]
]
test-fail-2: function ['code [word!] args [block!]] [
	got: apply 'process-into [test-prog-2 /args on args /on-error on :handler]
	assert [code = got]
]
test-fail-3: function ['code [word!] args [block!]] [
	got: apply 'process-into [test-prog-3 /args on args /on-error on :handler]
	assert [code = got]
]

test-ok-1 
	[a: 1 b: %a.out c: []                   x: false y: false y1: none y2: false z: false z1: none                   ]
	["1" "a.out"]
test-ok-1 
	[a: 1 b: %-     c: []                   x: false y: false y1: none y2: false z: false z1: none                   ]
	["1" "-"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00]            x: false y: false y1: none y2: false z: false z1: none                   ]
	["1" "a.out" "3:0"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: false y: false y1: none y2: false z: false z1: none                   ]
	["1" "a.out" "3:0" "4:5:6"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: false y1: none y2: false z: false z1: none                   ]
	["1" "a.out" "3:0" "4:5:6" "-x"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: true  y1: 1.0  y2: true  z: false z1: none                   ]
	["1" "a.out" "3:0" "4:5:6" "-x" "-y" "1.0"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: true  y1: 1.0  y2: true  z: false z1: none                   ]
	["1" "a.out" "3:0" "4:5:6" "-x" "-y" "1"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: true  y1: 1.0  y2: true  z: false z1: none                   ]
	["1" "a.out" "3:0" "4:5:6" "-x" "-y 1.0"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: true  y1: 1.0  y2: true  z: false z1: none                   ]
	["1" "a.out" "3:0" "4:5:6" "-x" "--y2" "1.0"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: true  y1: 1.0  y2: true  z: false z1: none                   ]
	["1" "a.out" "3:0" "4:5:6" "-x" "--y2 1.0"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: true  y1: 1.0  y2: true  z: false z1: none                   ]
	["1" "a.out" "3:0" "4:5:6" "-x" "--y2=1.0"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: true  y1: 2.0  y2: true  z: false z1: none                   ]
	["1" "a.out" "3:0" "4:5:6" "-x" "-y" "1.0" "-y" "2.0"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: true  y1: 2.0  y2: true  z: false z1: none                   ]
	["1" "a.out" "3:0" "4:5:6" "-x" "-y" "1.0" "--y2" "2.0"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: true  y1: 2.0  y2: true  z: true  z1: [1-Jan-2001]           ]
	["1" "a.out" "3:0" "4:5:6" "-x" "-y" "1.0" "-y" "2.0" "-z" "1/1/1"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: true  y1: 2.0  y2: true  z: true  z1: [1-Jan-2001 2-Feb-2002]]
	["1" "a.out" "3:0" "4:5:6" "-x" "-y" "1.0" "-y" "2.0" "-z" "1/1/1" "-z" "2/2/2"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4:05:06]    x: true  y: true  y1: 2.0  y2: true  z: true  z1: [1-Jan-2001 2-Feb-2002]]
	["1" "-z" "1/1/1" "a.out" "-z 2/2/2" "-y" "1.0" "3:0" "4:5:6" "-x" "-y" "2.0"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4-May-2006] x: true  y: true  y1: 2.0  y2: true  z: true  z1: [1-Jan-2001 2-Feb-2002]]
	["1" "-z 1/1/1" "a.out" "-z 2/2/2" "-y" "1.0" "3:0" "4/5/6" "-x" "-y" "2.0"]
test-ok-1 
	[a: 1 b: %a.out c: [3:00:00 4-May-2006 4:00:00 5:00:00] x: true  y: true  y1: 2.0  y2: true  z: true  z1: [1-Jan-2001 2-Feb-2002]]
	["1" "-z 1/1/1" "a.out" "-z 2/2/2" "-y" "1.0" "3:0" "4/5/6" "4:0" "5:0:0" "-x" "-y" "2.0"]
;; shortcut tests
test-ok-1/with 
	[a: 0 b: %"" c: [] x: false y: false y1: none y2: false z: true z1: [2-Feb-2002]]
	["-z 2/2/2"]
	[/shortcuts on [z]]
test-ok-1/with 
	[a: 0 b: %"" c: [] x: true y: false y1: none y2: false z: false z1: none]
	["-x"]
	[/shortcuts on [z x]]
test-ok-1/with 
	[a: 0 b: %"" c: [] x: true y: false y1: none y2: false z: true z1: [2-Feb-2002]]
	["-z 2/2/2" "-x"]
	[/shortcuts on [z]]
test-ok-1/with 
	[a: 0 b: %"" c: [] x: true y: false y1: none y2: false z: true z1: [2-Feb-2002]]
	["-z 2/2/2" "-x"]
	[/shortcuts on [x]]
; test-ok-1
	; [a: 0 b: %"" c: [] x: false y: false y1: none y2: false z: false z1: none]
	; []											;-- auto help must kick in; @@ but it quits using default handler, so disabled
	
test-fail-1/with ER_FEW [] [/no-help on]
test-fail-1 ER_FEW    ["1"]
test-fail-1 ER_TYPE   ["1" "2" "-z 1000"]
test-fail-1 ER_LOAD   ["1" "2" "-z )&#@"]
test-fail-1 ER_OPTION ["1" "2" "--unknown-option"]
test-fail-1 ER_CHAR   ["1" "2" "--7x0"]
test-fail-1 ER_CHAR   ["1" "2" "--y2%bad"]
test-fail-1 ER_EMPTY  ["1" "2" "-z"]
test-fail-1 ER_VALUE  ["1" "2" "-x 100"]
test-fail-1 ER_FORMAT ["1" "2" "-zxc"]

test-fail-2 ER_MUCH   ["1" "2" "3"]

test-ok-3 [a: false x: none b: true y: true c: false z: none] ["-b" "yes"]
test-ok-3 [a: false x: none b: true y: true c: false z: none] ["-b" "on"]
test-ok-3 [a: false x: none b: true y: true c: false z: none] ["-b" "true"]
test-ok-3 
	compose/deep [a: true x: [(true) (false) (false) (false)] b: false y: none c: false z: none]
	["-a" "yes" "-a" "no" "-a" "false" "-a" "off"]
test-ok-3 [a: false x: none b: false y: none c: true z: false] ["-c" "no"]
test-ok-3 [a: false x: none b: false y: none c: true z: true] ["-c" "yes"]

test-fail-3 ER_TYPE   ["-a" "100"]

; assert [(reduce [none "--" none "-- --"]) = extract-args ["--" "--" "-- --"] test-prog-1]

; print help-for test-prog-2
; process-into/options test-prog-2 [args: ["-1" "2" "3"]]

; print version-for test-prog-1

; print help-for/columns test-prog-1 [1 3 6 8 10]

] cli ;context bind [
