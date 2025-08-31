
#825: /local and /extern misbehave differently when interpreted and compiled
================================================================================
Issue is closed, was reported by WiseGenius and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/825>

I'm using Windows XP.

Uncomment one of the unindented lines in the following code, and the indented comments describe the strange behaviour which follows.

```
theText: "outside"
theFun:


; function []
        ; BOTH INTERPRETER AND COMPILER WORK PROPERLY:
            ; func [/local theText]
; func []
        ; BOTH INTERPRETER AND COMPILER WORK PROPERLY:
            ; func []

; function [/extern theText]
        ; INTERPRETER MANGLES:
            ; func [/]
        ; COMPILER CHOKES:
            ; *** Red Compiler Internal Error: Script Error : intersect expected ser1 argument of type: series bitset
            ; *** Where: collect-words
            ; *** Near:  [unless empty? intersect ignore spec]

; func [/local theText]
        ; INTERPRETER MANGLES:
            ; func [/ local theText]
        ; COMPILER WORKS PROPERLY:
            ; func [/local theText]

; function [extern theText]
    ; *NOT EXPECTED TO WORK!
        ; INTERPRETER CONVERTS (What?! I thought this wouldn't work?):
            ; func []
        ; COMPILER MAKES REDUNDANT (which then behaves strangely):
            ; func [/extern theText]

; func [local theText]
    ; *NOT EXPECTED TO WORK!
        ; INTERPRETER BEHAVES AS I EXPECTED:
            ; func [local theText]
        ; COMPILER CONVERTS (What?! I thought this wouldn't work?):
            ; func [/local theText]


[theText: "Hello, World!" print theText]

?? theFun

theFun "this pointless string becomes an argument when things go wrong" "another pointless string" "yet another pointless string"

print theText

```



Comments:
--------------------------------------------------------------------------------

On 2014-06-12T06:56:12Z, dockimbel, commented:
<https://github.com/red/red/issues/825#issuecomment-45835793>

    Could @PeterWAWood or anyone having some spare time convert these code cases into tests?

--------------------------------------------------------------------------------

On 2014-06-18T05:15:24Z, PeterWAWood, commented:
<https://github.com/red/red/issues/825#issuecomment-46396800>

    I've added tests to function-test.red for most of the cases raised. I didn't add any tests that would raise compiler errors at this stage, as I didn't want to increase the number of compiles in the current test suite.

--------------------------------------------------------------------------------

On 2014-06-18T05:31:03Z, dockimbel, commented:
<https://github.com/red/red/issues/825#issuecomment-46397560>

    Thanks Peter.

