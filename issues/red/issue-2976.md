
#2976: string to path not handled correctly
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/2976>

```
>> p: to path! "b/c"
== b/c
>> length? p
== 1
>> length? 'b/c
== 2
```



Comments:
--------------------------------------------------------------------------------

On 2017-08-16T16:40:09Z, greggirwin, commented:
<https://github.com/red/red/issues/2976#issuecomment-322830089>

    https://github.com/red/red/issues/2594
    
    https://github.com/red/red/wiki/Path!-notes
    
    R2 has the same behavior.

