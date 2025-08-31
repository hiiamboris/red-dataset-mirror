
#854: function's first block's contents disappear
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/854>

The interpreter removes all contents of the first block of `function` in some circumstances:

**Code 1**:

```
f1: function [/r1 v1 v2 /r2 v3][
    either r1 [
        print v1
        print v2
    ][
        print "We're not v1 or v2."
    ]
    either r2 [print v3][print "I'm not v3."]
]
?? f1
f1
f1/r1 "I'm v1!" "I'm v2!"
f1/r1/r2 "I'm v1!" "I'm v2!" "I'm v3!"
f1/r2/r1 "I'm v3!" "I'm v1!" "I'm v2!"
```

**Compiler** behaves **as expected**:

```
f1: func [/r1 v1 v2 /r2 v3][either r1 [print v1 print v2] [print "We're not v1 or v2."] either r2 [print v3] [print "I'm not v3."]]
We're not v1 or v2.
I'm not v3.
I'm v1!
I'm v2!
I'm not v3.
I'm v1!
I'm v2!
I'm v3!
I'm v1!
I'm v2!
I'm v3!
```

**Interpreter** gives:

```
f1: func [][either r1 [print v1 print v2] [print "We're not v1 or v2."] either r2 [print v3] [print "I'm not v3."]]
*** Error: word has no value!
*** Error: word has no value!
unset
*** Error: word has no value!
unset
*** Error: word has no value!
*** Error: word has no value!
unset
Error: refinement /r1 not found!
```

However, when there is an argument before the first refinement, things go well:

**Code 2**:

```
f2: function [v1 /r1 v2 v3 /r2 v4][
    print v1
    either r1 [
        print v2
        print v3
    ][
        print "We're not v2 or v3."
    ]
    either r2 [print v4][print "I'm not v4."]
]
?? f2
f2 "I'm v1!"
f2/r1 "I'm v1!" "I'm v2!" "I'm v3!"
f2/r1/r2 "I'm v1!" "I'm v2!" "I'm v3!" "I'm v4!"
f2/r2/r1 "I'm v1!" "I'm v4!" "I'm v2!" "I'm v3!"
```

**Compiler** and **interpreter** both behave **as expected**:

```
f2: func [v1 /r1 v2 v3 /r2 v4][print v1 either r1 [print v2 print v3] [print "We're not v2 or v3."] either r2 [print v4] [print "I'm not v4."]]
I'm v1!
We're not v2 or v3.
I'm not v4.
I'm v1!
I'm v2!
I'm v3!
I'm not v4.
I'm v1!
I'm v2!
I'm v3!
I'm v4!
I'm v1!
I'm v2!
I'm v3!
I'm v4!
```

**Note:**
Replacing `function` with `func` works in all 4 cases.



Comments:
--------------------------------------------------------------------------------

On 2014-06-19T08:14:04Z, dockimbel, commented:
<https://github.com/red/red/issues/854#issuecomment-46534374>

    It was just a recent regression.

--------------------------------------------------------------------------------

On 2014-06-20T06:43:32Z, WiseGenius, commented:
<https://github.com/red/red/issues/854#issuecomment-46649236>

    All 8 cases working now.

