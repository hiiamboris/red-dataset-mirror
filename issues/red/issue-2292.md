
#2292: Appending a block and assigning to face/text in face/react causes parse error
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2292>

A lot of things going on here to make it happen (so far):
- Only happens in a `react` block
- Only happens if appending a block
- Only happens if result is assigned to face/text
- Only happens if if data is (maybe) non-loadable?

```
Red []

;*** Script Error: PARSE - matching by datatype not supported for any-string! input
;*** Where: parse
a: "170lb" b: "73kg"

; This is fine
c: "170 lb" d: "73 kg"

; This is just here so the reactive formula triggers
r: make reactor! [v: none]

view [
    text 100 react [r/v  face/text: rejoin [a " / " b]]         ; error
    ;text 100 react [r/v  face/text: append copy a [" / " b]]       ; error
    ;text 100 react [r/v  face/text: append copy a b]               ; OK
    ;text 100 react [r/v  face/text: rejoin [a b]]                  ; error
    ;text 100 react [r/v  face/text: rejoin [a " / "]]              ; error
    ;text 100 react [r/v  face/text: append append copy a " / " b]  ; OK
    text 100 react [r/v  rejoin [a " / " b]]                        ; OK
    text 100 react [r/v  face/text: rejoin [c " / " d]]
]
```

I'll see if I can minimize it more.



Comments:
--------------------------------------------------------------------------------

On 2017-02-24T10:27:41Z, dockimbel, commented:
<https://github.com/red/red/issues/2292#issuecomment-282258120>

    This use-case is uncovering a deep bug with recursive processing in Parse. Very helpful!

