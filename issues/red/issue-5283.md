
#5283: checkbox copied the parent's color into itself
================================================================================
Issue is closed, was reported by bubnenkoff and has 4 comment(s).
[status.resolved] [type.review] [GUI]
<https://github.com/red/red/issues/5283>

```
view [
   db-settings-panel: panel [] return 

   send-data-to-noSQL-check-panel: panel [ 
        send-data-to-noSQL-check: check "Activate" 
            react [
                either (face/data = true) [
                        db-settings-panel/color: gray
                        send-data-to-noSQL-check-panel/color: none
                    ] [
                            db-settings-panel/color: snow 
                            send-data-to-noSQL-check-panel/color: green
                    ]
            ]                    
          
    ]
]
```

![изображение](https://user-images.githubusercontent.com/6514326/219628005-641389ef-a95d-4fed-b669-502a52dd6e76.png)

The green border should not be displayed.
```
>> about
Red 0.6.4 for Windows built 26-Nov-2022/17:40:58+03:00  commit #94beb4d
``` 




Comments:
--------------------------------------------------------------------------------

On 2023-02-17T17:58:57Z, dockimbel, commented:
<https://github.com/red/red/issues/5283#issuecomment-1435041017>

    A more readable version of the above code:
    ```
    view [
       A: panel [] return 
       B: panel [ 
            check "Activate" react [
                either face/data [
                    A/color: gray
                    B/color: none
                ] [
                    A/color: snow 
                    B/color: green
                ]
            ]
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2023-02-17T18:06:46Z, dockimbel, commented:
<https://github.com/red/red/issues/5283#issuecomment-1435050563>

    GUI rewriting rules are in play there, more specifically the [`color-backgrounds`](https://github.com/red/red/blob/master/modules/view/backends/windows/rules.red#L16) rule. Those rewritting rules are active by default and defined specifically for each GUI platform (e.g. [rules for Windows](https://github.com/red/red/blob/master/modules/view/backends/windows/rules.red)).
    
    If they interfere in any way with user code, they can be easily disabled:
    * fully: `system/view/VID/GUI-rules/active?: no`
    * specifically: `remove find system/view/VID/GUI-rules/OS/Windows 'color-backgrounds`
    
    Those rewriting rules are [documented there](https://github.com/red/docs/blob/master/en/vid.adoc#cross-platform-gui-metrics).

