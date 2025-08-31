
#2280: regression: below code was compiling fine before
================================================================================
Issue is closed, was reported by x8x and has 8 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2280>

```
Red []
o: object [f: does ['nothing]]
quit: :o/f
```

it now errors out with:

```
Compiling build.red ...
*** Red Compiler Internal Error: Script Error : copy expected value argument of type: series port bitset 
*** Where: comp-call 
*** Near:  [forall path [
switch/default type?/word value: path/1 [
word! [
if all [
not set? not get? 
all [
alter: get-prefix-func value 
entry: find-function alter value 
name: alter
]
] [
if head? path [
if alter: select-ssa name [entry: find functions alter] 
pc: next pc 
either ctx: any [
obj-func-call? value 
pick entry/2 5
] [
comp-call/with path entry/2 name ctx
] [
comp-call path entry/2
] 
exit
]
] 
add-symbol value
] 
get-word! [
if head? path [
get?: yes 
change path to word! path/1
]
] 
integer! paren! string! [
if head? path [path-head-error]
]
] [
throw-error ["cannot use" mold type? value "value in path:" pc/1]
]
] 
self?: path/1
] 
```

interestingly it seams to be linked to `quit`, this works:

```
Red []
o: object [f: does ['nothing]]
q: :o/f
```



Comments:
--------------------------------------------------------------------------------

On 2016-10-20T16:52:41Z, x8x, commented:
<https://github.com/red/red/issues/2280#issuecomment-255163455>

    Not sure if this is related, I get this error when compiling Kaj's library:
    
    ```
    Compiling to native code...
    *** Compilation Error: invalid import specification at: Abort program with signal signal-abort (SIGABRT). _signal raise Send signal to self. signal signal! return integer! _on-quit atexit Register handler for normal program termination. handler integer! return integer! on-signal signal Register handlers for receiving system signals. signal signal! handler function! signal signal! Flag or callback return handle! Previous handler or SIGNAL-ERROR 
    *** in file: %/red/build/kaj/C-library/ANSI.reds 
    *** at line: 131 
    *** near: [
        #import ["libc.dylib" cdecl [
    ...
    ```
    
    `%ANSI.reds:131` is:
    
    ```
    #import [LIBC-file cdecl [
    ```
    
    "invalid import specification at" point to this lines where there is also the word `quit`:
    
    ```
        ; quit-now: "abort" [                       "Abort program with signal signal-abort (SIGABRT)."
        ; ]
    ```

--------------------------------------------------------------------------------

On 2016-11-16T01:31:13Z, qtxie, commented:
<https://github.com/red/red/issues/2280#issuecomment-260826313>

    It works now with latest version. @x8x Can use still reproduce it?

--------------------------------------------------------------------------------

On 2016-11-18T18:05:38Z, x8x, commented:
<https://github.com/red/red/issues/2280#issuecomment-261599539>

    I get the same error compiling first example

--------------------------------------------------------------------------------

On 2017-02-17T14:58:06Z, dockimbel, commented:
<https://github.com/red/red/issues/2280#issuecomment-280672018>

    Compiling the first example will give you now a proper error:
    ```
    *** Compilation Error: quit has no refinement
    *** in file: %/C/dev/Red/tests/bug.red
    *** near: [quit/return 1]
    ```
    The runtime library expects a `/return` refinement for `quit`. You need to be very careful when you redefine core Red functions, otherwise the runtime won't compile or won't work anymore.
    
    The following code will compile fine:
    ```
    Red []
    o: object [f: func [/return] ['nothing]]
    quit: :o/f
    ```

