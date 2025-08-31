
#610: Overflow in emit-variable w/more than 15 locals+parameters to FUNCTION
================================================================================
Issue is closed, was reported by hostilefork and has 4 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/610>

This compiles and interprets successfully:

```
Red []
test: function [] [
    a: b: c: d: e: f: g: h: i: j: k: l: m: 0
]
test
```

Add one more SET-WORD! and you'll get an error when compiling, although run from the interpreter it will work:

```
Red []
test: function [] [
    a: b: c: d: e: f: g: h: i: j: k: l: m: n: 0
]
test
```

The error you get is:

```
*** Compilation Error: #code generation error: overflow in emit-variable 
*** in file: %/home/hostilefork/Projects/red/overflow.red 
*** in function: exec/f_test
*** at line: 1 
*** near: [
    _function/init-locals 15 
    stack/mark-native ~test 
    stack/reset 
    stack/mark-native ~set 
    stack/mark-native
]
```

You get a similar error with:

```
Red []
test: function [a b c d e f g h i j k l m n] [
]
test
```

Or a mix-n-match:

```
Red []
test: function [a b c d e f] [
    g: h: i: j: k: l: m: 0
    repeat n 10 []
]
test
```

Error originates from [stack-encode in target-class.r](https://github.com/red/red/blob/396b7240fee6b747c2d41af16f88ea23009279bf/system/targets/target-class.r#L68), which seems to limit stack offsets to fitting in a byte.  (?)



Comments:
--------------------------------------------------------------------------------

On 2013-12-15T10:11:27Z, PeterWAWood, commented:
<https://github.com/red/red/issues/610#issuecomment-30601543>

    This is a duplicate of #600

--------------------------------------------------------------------------------

On 2013-12-15T11:41:51Z, hostilefork, commented:
<https://github.com/red/red/issues/610#issuecomment-30602817>

    Closing as duplicate.

