
#1047: Extreme inconsistency of case-sensitivity of keys
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
<https://github.com/red/red/issues/1047>

I couldn't find where to report issues here: https://github.com/qtxie/red/tree/hashtable
So I'm reporting it here instead.

Code:

```
Red []


m: make map! ["a" "one" "A" "two" "b" "three" "c" "five" "C" "six"]

m/("a"): "seven"
m/("A"): "eight"
m/("b"): "nine"
m/("B"): "ten"
m/("c"): "eleven"
m/("C"): "twelve"
m/("x"): "thirteen"
m/("X"): "fourteen"
m/("y"): "fifteen"
m/("Y"): "sixteen"

probe m
```

Expected result:

```
make map! [
        "a" "seven"
        "A" "eight"
        "b" "nine"
        "c" "eleven"
        "C" "twelve"
        "B" "ten"
        "x" "thirteen"
        "X" "fourteen"
        "y" "fifteen"
        "Y" "sixteen"
]
```

Actual result:

```
make map! [
        "a" "seven"
        "A" "eight"
        "b" "nine"
        "c" "twelve"
        "C" "six"
        "B" "ten"
        "x" "thirteen"
        "X" "fourteen"
        "y" "sixteen"
]
```

`"a"`, `"A"`, `"c"` and `"C"` are all initial keys. Yet `"a"` and `"A"` are fine, while `"c"` and `"C"` are not.
`"x"`, `"X"`, `"y"` and `"Y"` are all added keys. Yet `"x"` and `"X"` are fine, while `"y"` and `"Y"` are not.



Comments:
--------------------------------------------------------------------------------

On 2015-02-27T11:21:32Z, qtxie, commented:
<https://github.com/red/red/issues/1047#issuecomment-76380176>

    @WiseGenius Thank you for testing it. I'll fix it as soon as possible. Btw, I have enable issues on my red repo.

--------------------------------------------------------------------------------

On 2015-02-27T13:42:25Z, qtxie, commented:
<https://github.com/red/red/issues/1047#issuecomment-76395772>

    @WiseGenius Push a fix for this issue. 
    Now we use case-sensitive keys in map! as default. We still need to find a nice way to switch between case-sensitive and case-insensitive.

