
#1969: #CALL directive does not process well float! arguments
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/1969>

Following code should output `6` instead of crashing at compilation.

```
Red []

foo: func [a [float!] b [float!]][a + b]

#system [
    #call [foo 2.0 4.0]
    fl: as red-float! stack/arguments
    probe fl/value
]

```



Comments:
--------------------------------------------------------------------------------

On 2016-08-31T07:48:49Z, rebolek, commented:
<https://github.com/red/red/issues/1969#issuecomment-243685756>

    I’ve tested this, but it doesn’t output **6** for me (at least not from R/S). Try to compile this code:
    
    ```
            foo: func [a [float!] b [float!]][a + b]
    
            out: #system [
                #call [foo 2.0 4.0]
                fl: as red-float! stack/arguments
                probe fl/value
            ]
            print ["*** out:" out]
    ```
    
    My output is:
    
    ```
    5.262549563090894e-312
    *** out: 6.0
    ```
    
    This is both on native OSX and W7 under VirtualBox.

