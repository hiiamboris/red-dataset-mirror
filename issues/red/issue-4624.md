
#4624: lexer recognizes whitespaces as WORD!s
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4624>

**Describe the bug**
Discovered in https://github.com/red/red/issues/4604: some [whitespace Unicode characters](https://en.wikipedia.org/wiki/Whitespace_character) are lexed as `word!`s.

**To reproduce**
```red
Red [Link: https://en.wikipedia.org/wiki/Whitespace_character]

spaces: [
	"^(0009)"
	"^(000a)"
	"^(000b)"
	"^(000c)"
	"^(000d)"
	"^(0020)"
	"^(0085)"
	"^(00a0)"
	"^(1680)"
	"^(2000)"
	"^(2001)"
	"^(2002)"
	"^(2003)"
	"^(2004)"
	"^(2005)"
	"^(2006)"
	"^(2007)"
	"^(2008)"
	"^(2009)"
	"^(200a)"
	"^(2028)"
	"^(2029)"
	"^(202f)"
	"^(205f)"
	"^(3000)"
	
	"^(180e)"
	"^(200b)"
	"^(200c)"
	"^(200d)"
	"^(2060)"
	"^(feef)"
]

forall spaces [if scan spaces/1 [print to-hex to integer! spaces/1/1]]
```

Results in:
```
00000085
000000A0
00001680
00002000
00002001
00002002
00002003
00002004
00002005
00002006
00002007
00002008
00002009
0000200A
00002028
00002029
0000202F
0000205F
00003000
0000180E
0000200B
0000200C
0000200D
00002060
0000FEEF
```

**Expected behavior**
Nothing is printed since `scan` returns `none` on each iteration.

**Platform version**
125f495, W10.



Comments:
--------------------------------------------------------------------------------

On 2020-09-23T02:43:53Z, bitbegin, commented:
<https://github.com/red/red/issues/4624#issuecomment-697097000>

     it will be better to use http://www.unicode.org/reports/tr31/ for identifier

--------------------------------------------------------------------------------

On 2020-11-11T16:45:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/4624#issuecomment-725532090>

    `function-test.red` (ooo-2) contains an 0xA0 char, which makes the test fail in interpreter spitting an "Error: has no value" message, but compiler skips this char.

--------------------------------------------------------------------------------

On 2021-09-09T17:34:24Z, dockimbel, commented:
<https://github.com/red/red/issues/4624#issuecomment-916299735>

    Support for compiler's lexer has not been implemented as the current toolchain is on borrowed time anyway.

