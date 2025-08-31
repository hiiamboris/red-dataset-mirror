
#2877: HELP doesn't handle quoted/multiline strings well.
================================================================================
Issue is closed, was reported by greggirwin and has 4 comment(s).
<https://github.com/red/red/issues/2877>

From Oldes:
```
>> f: func[a [string!] {aaa^/bbb}][]
== func [a [string!] "aaa^/bbb"][]
>> ? f
USAGE:
     F a

DESCRIPTION: 
     F is a function! value.

ARGUMENTS:
     a            [string!] "aaa^/bbb".


fd: func[
    {
    Something.
    }
][]

? fd

USAGE:
     FD 

DESCRIPTION: 

    Something.
    . 
     FD is a function! value.
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-11T07:32:52Z, DideC, commented:
<https://github.com/red/red/issues/2877#issuecomment-314359960>

    Handling of multilines would be tricky, as you will have to manage aligment too:
    ```
    >> f: func [{aaa^/bbb} v {val^/ue}][]
    == func ["aaa^/bbb" v "val^/ue"][]
    >> help f
    USAGE:
         F v
    
    DESCRIPTION: 
         aaa
    bbb. 
         F is a function! value.
    
    ARGUMENTS:
         v             "val^/ue".
    ```

--------------------------------------------------------------------------------

On 2017-07-11T16:58:01Z, greggirwin, commented:
<https://github.com/red/red/issues/2877#issuecomment-314507337>

    Yes, we'll have to accept that it won't work with all possible doc strings. One of the risks of adding the dot programmatically. Maybe it's not even worth trying to handle the cases Oldes pointed out.

