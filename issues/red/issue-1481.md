
#1481: In compiled Red/System negate of logic value sometimes does not work
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1481>

```
Red/System []

i: 1
case?: as logic! (i + 1)
probe i
probe case?
probe not case?

i: 2
case?: as logic! i
probe i
probe case?
probe not case?

i: 3
case?: as logic! i
probe i
probe case?
probe not case?
```

Outputs:

```
1
true
true ;<----------- this is wrong!!!
2
true
false
3
true
false
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-04T18:46:05Z, dockimbel, commented:
<https://github.com/red/red/issues/1481#issuecomment-179995704>

    The issue comes from a missing generation of runtime type casting for in: 
    
    ```
    case?: as logic! (i + 1)
    ```

