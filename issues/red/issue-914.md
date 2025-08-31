
#914: Something is wrong with compiler for object! path
================================================================================
Issue is closed, was reported by WayneCui and has 4 comment(s).
<https://github.com/red/red/issues/914>

```
Red []

obj: make object! [ a: 1 ]
obj/a
```

See the code above. I can compile the file successfully, but when execute the binary, it output

```
*** Script error: action 42 not defined for type: 31
```



Comments:
--------------------------------------------------------------------------------

On 2014-09-07T15:57:32Z, PeterWAWood, commented:
<https://github.com/red/red/issues/914#issuecomment-54750910>

    Which version of the compiler are you using?. 
    
    Object! support for the compiler is only in the Objects development branch at the moment. 

--------------------------------------------------------------------------------

On 2014-09-07T17:30:17Z, WayneCui, commented:
<https://github.com/red/red/issues/914#issuecomment-54753750>

    Oh sorry, I used the master branch. I will close the issue.

