
#4203: String CORRUPTiON involving MAKE, PARSE and Unicode source file
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [status.resolved] [test.written]
<https://github.com/red/red/issues/4203>

**Describe the bug**

Run this as a standalone script (`red myfile.red` or whatever):
```
Red []

; without this line there's no string corruption (any unicode char does the trick):
; ☺

; at least one argument in spec must be 2 or more chars long
spec: [yz [float!] x]

probe collect [
	=arg=: [
		set name word!
		opt [set types block!]
		(keep probe reduce [name  probe make typeset! types])
	]
	parse spec [any [=arg=]]
]
```

It prints to console:
```
make typeset! [float!]                              
[yz make typeset! [float!崠]                         
make typeset! [float!]                              
[x make typeset! [float!]]                          
[yz make typeset! [float!崠 x make typeset! [float!崠]
```
Note the hieroglyphics ;)

**Expected behavior**

Expected `]` (5Dh) in place of char `崠` (5D20h)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Dec-2019/19:03:46+03:00 commit #544a6e1
```



Comments:
--------------------------------------------------------------------------------

On 2019-12-24T15:33:23Z, qtxie, commented:
<https://github.com/red/red/issues/4203#issuecomment-568767552>

    FYI. No problem in the fast-lexer branch.

--------------------------------------------------------------------------------

On 2019-12-24T15:36:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/4203#issuecomment-568767946>

    Great!

--------------------------------------------------------------------------------

On 2020-07-09T15:37:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/4203#issuecomment-656199724>

    Since lexer is merged, this only waits for a regression test.

--------------------------------------------------------------------------------

On 2020-07-25T06:36:16Z, theSherwood, commented:
<https://github.com/red/red/issues/4203#issuecomment-663817890>

    Adding the regression test is on hold until we have a dedicated script for handling file creation from within tests.

