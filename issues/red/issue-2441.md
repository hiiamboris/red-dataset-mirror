
#2441: Setting tab-size in area does not affect existing text content
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.resolved] [type.review] [GUI]
<https://github.com/red/red/issues/2441>

I naively thought that changing `options/tabs` of an `area` face would affect the existing text (redrawing it). This turned out not to be the case, but even invoking `show` on the face does not change the tabs that are already present in the text. How to achieve that? This is important for the Red editor I am building, where I want to read a `.red` file and display it in an area face, with the tab size set from the header of the `. red` file.


Comments:
--------------------------------------------------------------------------------

On 2017-02-21T07:40:56Z, dockimbel, commented:
<https://github.com/red/red/issues/2441#issuecomment-281267653>

    Properties under `face/options` are not updated live, they are used mostly at face creation time, and even if they are eventually checked at runtime (like for `drag-on`), they remain *passive* properties.
    
    The `area` face type is not meant to be a code editor, so it cannot support all the required features. Though, you can workaround that limitation by either destroying and recreating the area face when you change that property, or by using a Windows-specific routine, which will update it for you:
    ```
    update-tab-size: routine [hWnd [integer!] options [block!]][
        #if OS = 'Windows [
            gui/set-area-options hWnd options
            gui/InvalidateRect hWnd null 1
        ]
    ]
    
    update-tab-size face/state/1 face/options
    ```

