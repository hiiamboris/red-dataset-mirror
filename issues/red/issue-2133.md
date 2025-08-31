
#2133: Trying to redefine native function crashes the compiler
================================================================================
Issue is open, was reported by PeterWAWood and has 6 comment(s).
[type.bug] [type.compiler]
<https://github.com/red/red/issues/2133>

The compiler crashes when it encounters an attempt to redefine a native function instead of giving an error message.

Code

```
Red []
system-add: :add
add: func [
    first [number! string!]
    second [number! string!]] [
    either all [
        number? first 
        number? second
    ][
        system-add first second
    ][
        append to string! first to string! second
    ]
]
print add 1 2
print add "Hello" " Red World"
print add 1 " is an integer"
add: :system-add
```

Compiler Output

```
-=== Red Compiler 0.6.1 ===- 

Compiling /Users/peter/VMShare/Code/Red/test.red ...
*** Red Compiler Internal Error: Script Error : Cannot use path on none! value 
*** Where: repend 
*** Near:  [entry/2]
```



Comments:
--------------------------------------------------------------------------------

On 2016-07-26T10:53:49Z, meijeru, commented:
<https://github.com/red/red/issues/2133#issuecomment-235234811>

    This could be similar to #360

--------------------------------------------------------------------------------

On 2016-07-26T12:17:52Z, x8x, commented:
<https://github.com/red/red/issues/2133#issuecomment-235250495>

    Probably related to https://github.com/red/red/issues/1138 as well

--------------------------------------------------------------------------------

On 2019-12-23T18:29:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/2133#issuecomment-568547488>

    Another scenario:
    ```
    Red []
    decl-func: :func
    f: decl-func [x][probe x]
    f 1
    ```
    Compiles with:
    ```
    *** Red Compiler Internal Error: Script Error : get-prefix-func expected name argument of type: word
    *** Where: comp-func
    *** Near:  [all [
    alter: get-prefix-func word
    entry: find-function alter word
    name: alter
    ]
    pc: next pc
    ]
    ```

