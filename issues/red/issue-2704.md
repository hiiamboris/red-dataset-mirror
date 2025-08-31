
#2704: when dividing integer by tuple, error message speaks about percent!
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2704>

```
>> 1 / 2.3.4
*** Script Error: / does not allow percent! for its value2 argument
*** Where: /
```




Comments:
--------------------------------------------------------------------------------

On 2017-06-07T11:31:49Z, dockimbel, commented:
<https://github.com/red/red/issues/2704#issuecomment-306767831>

    It is now correct:
    ```
    >> 1 / 2.3.4
    *** Script Error: incompatible argument for divide of integer!
    *** Where: /
    *** Stack: 
    ```

