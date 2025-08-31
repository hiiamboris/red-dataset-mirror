
#2792: [Windows VID] 'Select on 'Tab-Panel not working
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[status.built] [type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/2792>

In the following code, "select 2" doesn't work. 
```Red
view [ tab-panel [ "P1" [ base red ] "p2" [ base green ] ] select 2 ]
```
This bug is on Windows only.


Comments:
--------------------------------------------------------------------------------

On 2017-06-18T12:05:15Z, dockimbel, commented:
<https://github.com/red/red/issues/2792#issuecomment-309273604>

    Following code even crashes the console:
    ```
    view [ tab-panel [ "P1" [ base red ] "p2" [ base green ] ] on-created [face/selected: 2] ]
    ```

--------------------------------------------------------------------------------

On 2017-06-19T12:01:57Z, dockimbel, commented:
<https://github.com/red/red/issues/2792#issuecomment-309419558>

    The fix is only fixing the crashing, extra work is required for enabling the tab-panel selected from VID.

