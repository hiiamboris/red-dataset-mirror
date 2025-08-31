
#104: not as-logic does bitwise NOT on integer! returned by function
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/104>

```
dummy: func [return: [integer!]] [0]
print-hex as-integer not as-logic dummy

>> FFFFFFFF
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-24T03:29:09Z, PeterWAWood, commented:
<https://github.com/red/red/issues/104#issuecomment-1430041>

    The following similar program, using prin-hex in common.red instead of Kaj's print-hex, compiles but aborts during execution:
    
    ```
    Red/System []
    
    dummy: func [return: [integer!]] [0]
    print "starting"
    prin-hex as-integer not as-logic dummy
    print ""
    print "finished"
    ```
    
    The output produced is :
    
    ```
    C:\Red\red-system\builds>test
    starting
    
    C:\Red\red-system\builds>
    ```
    
    I will write up a test case.

--------------------------------------------------------------------------------

On 2011-06-25T21:48:05Z, dockimbel, commented:
<https://github.com/red/red/issues/104#issuecomment-1439324>

    NOT issue fixed, but the prin-hex issue remains, I am opening a new ticket for that.
    
    Tested OK.

