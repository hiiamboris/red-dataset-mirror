
#1207: object! allows adding new keys, then crashes
================================================================================
Issue is closed, was reported by WiseGenius and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1207>

Starting with this code:

```
red>> o: make object! [a: 1 b: 2]
== make object! [
    a: 1
    b: 2
]
```

This looks normal:

```
red>> o/c
*** Script error: c has no value
*** Where: try
```

But for some reason, this is allowed:

```
red>> o/c: 3
== 3
```

Then try either this:

```
red>> o

*** Runtime Error 1: access violation
*** at: 00425733h
```

Or this:

```
red>> o/c

*** Runtime Error 1: access violation
*** at: 0043BE7Dh
```



Comments:
--------------------------------------------------------------------------------

On 2015-06-05T09:10:53Z, dockimbel, commented:
<https://github.com/red/red/issues/1207#issuecomment-109212456>

    Good catch!

--------------------------------------------------------------------------------

On 2019-02-14T17:08:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/1207#issuecomment-463709060>

    There's a recent regression in the compiler (between Dec 07 and Dec 18). Should be reopened.
    
    `1.red`:
    ```
    Red []
    do [
    	o: make object! [a: 1 b: 2]
    	try [o/c]
    	try [o/c: 3]
    	o/c
    ]
    ```
    
    `red -r -d 1.red`:
    ```
    ***   stack: red/object/rs-select 026BD264h 030CCE38h                                       
    ***   stack: red/error/reduce 026BD284h 026BD264h                                           
    ***   stack: red/error/form 026BD264h 026BD274h 026BD254h -18                               
    ***   stack: red/actions/form 026BD264h 026BD274h 026BD254h 0                               
    ***   stack: red/actions/form* -1                                                           
    ***   stack: red/natives/prin* false                                                        
    ***   stack: red/natives/print* false                                                       
    ***   stack: red/stack/throw-error 026BD294h                                                
    ***   stack: red/fire 0 0018FDFCh                                                           
    ***   stack: red/object/eval-path 027C2DE4h 0286B710h 00000000h 0286B5C8h false             
    ***   stack: red/actions/eval-path 027C2DE4h 0286B710h 00000000h 0286B5C8h false            
    ***   stack: red/interpreter/eval-path 0286B710h 0286B5D8h 0286B5D8h false false false false
    ***   stack: red/interpreter/eval-expression 0286B5D8h 0286B5D8h false false false          
    ***   stack: red/interpreter/eval 026BD264h true                                            
    ***   stack: red/natives/do* true -1 -1 -1                                                  
    ```

--------------------------------------------------------------------------------

On 2019-02-20T23:43:07Z, greggirwin, commented:
<https://github.com/red/red/issues/1207#issuecomment-465800908>

    OK in interpreter.

