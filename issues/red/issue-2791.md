
#2791: [View] Select an index which is out of range
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/2791>

When selecting an index which is out of range, the behavior on macOS and on Windows 10 are different. 
In the following example, nothing is selected on Windows, and "CCC" is selected on macOS.
```Red
view [ text-list data ["AAA" "BBB" "CCC" ] select 4 ]
```
In the following example, nothing is selected both on Windows and on macOS.
```Red
view [ text-list data ["AAA" "BBB" "CCC" ] select 0 ]
```



Comments:
--------------------------------------------------------------------------------

On 2017-06-18T12:09:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2791#issuecomment-309273795>

    Out-of-range selection should not select any list entry.

