
#1088: select skip on hash returns none
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1088>

Given the following code:

```
b1: ["a" "b" "c" "d" "e"]
b2: ["a" "b" "b" "d" "e"]
b3: ["a" "b" "b" "b" "e"]
h1: make hash! b1
h2: make hash! b2
h3: make hash! b3

s2b1: select/skip b1 "c" 2
s3b1: select/skip b1 "d" 3
s2b2: select/skip b2 "b" 2
s3b3: select/skip b3 "b" 3

s2h1: select/skip h1 "c" 2
s3h1: select/skip h1 "d" 3
s2h2: select/skip h2 "b" 2
s3h3: select/skip h3 "b" 3

?? s2b1
?? s3b1
?? s2b2
?? s3b3

?? s2h1
?? s3h1
?? s2h2
?? s3h3
```

Both the interpreter and compiler result in:

```
s2b1: "d"
s3b1: "e"
s2b2: "d"
s3b3: "e"
s2h1: "d"
s3h1: "e"
s2h2: none
s3h3: none
```

Notice the 2 `none`s which are expected to be:

```
s2h2: "d"
s3h3: "e"
```



Comments:
--------------------------------------------------------------------------------

On 2015-04-07T07:30:40Z, dockimbel, commented:
<https://github.com/red/red/issues/1088#issuecomment-90420039>

    @WiseGenius Goog catch, thanks!

