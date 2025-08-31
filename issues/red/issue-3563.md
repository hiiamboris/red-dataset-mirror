
#3563: Line-breaks in area on Windows add to calculated length 1 for each line-break
================================================================================
Issue is closed, was reported by toomasv and has 10 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3563>

**Describe the bug**
When all of multi-line text is selected in `area`, `selected` property of the face gives different result than `length?`. This distorts calculations of cursor positions in area.

**To Reproduce**
Steps to reproduce the behavior:
1. In console enter: `view [a: area "Some^/line^/here" button "Show" [print [length? a/text a/selected]]]`
2. Select all text in area and press 'Show'
3. See difference in console

**Expected behavior**
`selected` should return same position as is returned by `length?`.

**Screenshots**
![selected-problem](https://files.gitter.im/red/bugs/iJJd/image.png)

**Platform version(please complete the following information):**
```
Red 0.6.3 for Windows built 11-Oct-2018/18:31:29+03:00 commit #1d43d77
```


Comments:
--------------------------------------------------------------------------------

On 2018-10-15T15:24:57Z, DideC, commented:
<https://github.com/red/red/issues/3563#issuecomment-429899041>

    newline is CR+LF on Windows. But Red handles all newline as LF only.
    Might be tricky to handle without counting newlines to add/subtract 1 for each.

--------------------------------------------------------------------------------

On 2019-11-24T17:43:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/3563#issuecomment-557910944>

    It looks like Windows does support LF newlines. Supposedly we should do this after CreateWindow:
    ```
    SendMessage handle 1510h 7 2
    SendMessage handle 1512h 3 3
    ```
    But bad news it's only supported on some newer W10 builds :D 
    For the reference: https://docs.microsoft.com/en-us/windows/win32/controls/edit-control-window-extended-styles  https://docs.microsoft.com/en-us/windows/win32/api/commctrl/ne-commctrl-ec_endofline
    
    

--------------------------------------------------------------------------------

On 2019-12-01T20:50:44Z, toomasv, commented:
<https://github.com/red/red/issues/3563#issuecomment-560157465>

    There is still a problem with this. 
    [![area-select](https://toomasv.red/images/Errors/area-select.gif)](https://toomasv.red/images/Errors/area-select.gif)
    ```
    view [
        ar: area "" on-select [
            probe face/selected 
            if face/selected [
                fi/text: copy/part at ar/text i: face/selected/x face/selected/y - i + 1
        ]] 
        fi: field 150
    ]
    ```
    ```
    >> about
    Red 0.6.4 for Windows built 1-Dec-2019/16:22:50+02:00 commit #fe76454
    ```

--------------------------------------------------------------------------------

On 2019-12-01T20:57:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/3563#issuecomment-560158138>

    ~Interesting. Can't reproduce it on W7.~
    Nevermind. Got it. I'll see where I made a mistake.

--------------------------------------------------------------------------------

On 2019-12-01T21:47:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/3563#issuecomment-560163632>

    https://github.com/red/red/pull/4168 should fix it for good
    Thanks for testing @toomasv 
    I should have tested it more thoroughly, but it was so late at night ;)
    
    ```
    view [a: area b: area react [face/text: attempt [copy/part at a/text a/selected/1 skip a/text a/selected/2]]]
    ```

