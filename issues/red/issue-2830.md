
#2830: [VID] Buttons in VID won't follow the layout command. 
================================================================================
Issue is closed, was reported by JenniferLee520 and has 12 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2830>

In the following code, everything is fine.
```Red
view [
    size 200x100
    origin 0x0
    space 0x0
    text gray 200x50 
    return
    base "A" red 50x50
    base "B" green 50x50
    base "C" blue 50x50
    base "D" purple 50x50
]
```
After replacing the 4 Bases with Buttons and run the new code, you will see the problem.
```Red
view [
    size 200x100
    origin 0x0
    space 0x0
    text gray 200x50 
    return
    button "A" red 50x50
    button "B" green 50x50
    button "C" blue 50x50
    button "D" purple 50x50
]
```
This bug is on macOS. I am not sure Windows has this bug or not. My Windows Laptop is not with me. I will test it on Windows while I have my Windows Laptop around.


Comments:
--------------------------------------------------------------------------------

On 2017-06-22T15:31:25Z, greggirwin, commented:
<https://github.com/red/red/issues/2830#issuecomment-310416020>

    It seems fine on Windows.

--------------------------------------------------------------------------------

On 2017-06-22T16:31:02Z, ghost, commented:
<https://github.com/red/red/issues/2830#issuecomment-310433312>

    Just to confirm -
    On rebol,
    ```
    view layout [button "A" red]
    ```
    gives a red button.
    Whereas on Red
    ```
    view [button "A" red]
    ```
    does not give any color.
    
    On Windows 8.1, bug reproduced. (If that is what this is about.)
    
    @greggirwin which windows are you on?

--------------------------------------------------------------------------------

On 2017-06-22T17:12:21Z, greggirwin, commented:
<https://github.com/red/red/issues/2830#issuecomment-310443883>

    Ah, I thought the layout portion was incorrect, not the color. You currently can't set the color of buttons that way. 

--------------------------------------------------------------------------------

On 2017-06-23T04:21:42Z, ghost, commented:
<https://github.com/red/red/issues/2830#issuecomment-310567613>

    @greggirwin
    > You currently can't set the color of buttons that way.
      
    Okay. Then, maybe @JenniferLee520 meant some other layout problem on MacOS.

--------------------------------------------------------------------------------

On 2017-06-23T05:45:12Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2830#issuecomment-310577336>

    I was talking about layout commands, which are "ORIGIN" and "SPACE".

--------------------------------------------------------------------------------

On 2017-06-24T07:27:14Z, dockimbel, commented:
<https://github.com/red/red/issues/2830#issuecomment-310822006>

    Native buttons are not equivalents to barebone faces. On macOS, buttons have a minimal margin preventing them from touching each other. If you need OS-provided buttons with no spaces between them, you should wait for the upcoming `toolbar` widget and use customized base faces in the meantime.

