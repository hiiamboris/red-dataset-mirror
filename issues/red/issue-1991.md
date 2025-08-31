
#1991: CONSOLE: Multiline code does not work if unmatched `]` somewhere in previous lines
================================================================================
Issue is closed, was reported by ghost and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1991>

Open red console (This issue is on **BOTH CLI and GUI console**).
Type this and press enter -

```
]
```

Now type this into console -

```
[
```

This is the final output --

```
red>> ]
*** Syntax error: missing #"[" at "]"
*** Where: do
red>> [
*** Syntax error: missing #"]" at "["
*** Where: do
```

If you type `[` one more time into the console, this time it will work.
That is, the no. of unmatched `]` previously, the same no. of times you are gonna get this error on multiline code.

```
red>> ]
*** Syntax error: missing #"[" at "]"
*** Where: do
red>> ]
*** Syntax error: missing #"[" at "]"
*** Where: do
red>> ]
*** Syntax error: missing #"[" at "]"
*** Where: do
red>> [
*** Syntax error: missing #"]" at "["
*** Where: do
red>> [
*** Syntax error: missing #"]" at "["
*** Where: do
red>> [
*** Syntax error: missing #"]" at "["
*** Where: do
red>> [
[    1 2 3 4
[    ]
== [
    1 2 3 4
]
```



