
#4925: [R/S] Compiler blames the wrong operator in an expression
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.deferred] [type.compiler]
<https://github.com/red/red/issues/4925>

**Describe the bug**
```
Red/System []

a: as byte-ptr! 100
b: as int-ptr! 60
;probe a - b
probe a - b >>> 2
```
`probe a - b` is valid code
In `probe a - b >>> 2` `as-integer` cast is forgotten, should be `(as-integer a - b) >>> 2`

What compiler says instead is confusing:
```
Compiling to native code...
*** Compilation Error: argument type mismatch on calling: -**
*** expected: [number!], found: [pointer! [byte!]]
*** in file: %/D/devel/red/red-src/red/2.reds
*** at line: 6
*** near: [- a b 2]
```
Why it blames the subtraction?

**Expected behavior**

To the point error message, e.g. `>>> expected integer as left operand, found pointer`, or something.

**Platform version**
```
Red 0.6.4 for Windows built 4-Jul-2021/2:04:09+03:00  commit #1e4fb1b
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-11T17:04:15Z, dockimbel, commented:
<https://github.com/red/red/issues/4925#issuecomment-877832832>

    > Why it blames the subtraction?
    
    It blames the `- a b` expression, which is the first argument (left operand) of the `>>>` operator.  The compiler rewrites the input code for infix operators to make them all prefix, so that internally, the compiler sees the expression as `>>> - a b 2`, hence the `near: [- a b 2]`, which points to the first faulty argument. Once the infix expressions are switched to prefix ones, there is no backward mapping of the expressions to the original infix form, so when an error is detected, it can only report on the prefix form. There's not much that can be done to improve that in the current very simple one-pass model used by the compiler. Once we have a new (multi-passes) version of the R/S compiler (we'll probably rewrite it in Red for the 64-bit port), we'll be able to report such errors much more accurately.

