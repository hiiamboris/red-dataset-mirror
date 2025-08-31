
#1420: Compiler seems to generate incorrect code when compose is used on second parameter to make
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1420>

This code:

```
Red []

print first compose [(add 1 1)] 
o: make object! compose [a: (add 1 1)]
print o/a
```

Gives this error:

```
./test
2
*** Script error: compose is missing its value argument
*** Where: compose
*** Stack: set do compose
```

It works in the interpreter:

```
red>> o: make object! compose [a: (add 1 1)]
== make object! [
    a: 2
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-04T11:49:20Z, dockimbel, commented:
<https://github.com/red/red/issues/1420#issuecomment-179787023>

    Issue is with the compiler not generating correct code for `make object!` followed by a function call.

