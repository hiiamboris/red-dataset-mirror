
#4069: Unexpected error messages in console while running draggable window
================================================================================
Issue is open, was reported by ushakov-s and has 4 comment(s).
[GUI]
<https://github.com/red/red/issues/4069>

When I run this code:
```
f: view/options/flags/no-wait [
        t: h5 red 80x20 "Not frozen more" 
] [options: [drag-on: 'down]] 'no-title
```
Error messages appears in console:
```
*** Script Error: path face/state/4 is not valid for none! type
*** Where: drag-offset
*** Stack: view show do-safe 
*** Script Error: path face/state/4 is not valid for none! type
*** Where: drag-offset
*** Stack: view show do-safe 
*** Script Error: path face/state/4 is not valid for none! type
*** Where: drag-offset
*** Stack: view show do-safe 
```

However code works properly at glance.

Windows 7 Home 32
Red 0.6.4 for Windows built 25-Sep-2019/22:36:30+03:00 commit #f753e25



Comments:
--------------------------------------------------------------------------------

On 2019-10-07T18:43:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4069#issuecomment-539149909>

    [Confirmed on W7 and W10](https://gitter.im/red/bugs?at=5d9b719b37073b36a08928dc)
    
    Another error message is:
    ```
    *** Script Error: + does not allow logic! for its value2 argument
    *** Where: +
    *** Stack: ask do-events do-safe 
    ```
    Mostly when closing the window just opened.

--------------------------------------------------------------------------------

On 2020-08-06T11:04:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/4069#issuecomment-669862070>

    Another problem here: if you don't specify `/no-wait`, and close the newly opened window with Alt+F4, then it will never leave the event loop, thus locking the GUI console.

