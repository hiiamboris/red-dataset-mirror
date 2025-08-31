
#5170: [View] `event/key` is wrong for most numpad keys
================================================================================
Issue is closed, was reported by hiiamboris and has 24 comment(s).
[status.built] [type.bug] [status.reviewed] [GUI] [GUI.GTK]
<https://github.com/red/red/issues/5170>

**Describe the bug**

Side by side output from `on-key-down` and `on-key` (tested on W10 & GTK): 
```
num-lock num-lock    ;) Windows-only; GTK doesn't see the key at all
#"+" #"k"
#"-" #"m"
#"7" #"g"
#"8" #"h"
#"9" #"i"
#"4" #"d"
#"5" #"e"
#"6" #"f"
#"1" #"a"
#"2" #"b"
#"3" #"c"
#"0" #"`"
#"." #"n"
#"^M" #"^M"
none #"^S"
#"*" #"j"
#"/" #"o"
```


**To reproduce**

Run the following script:
```
view [
	box focus "press numpad keys"
	on-key [print [mold event/key mold key]]
	on-key-down [key: event/key]
]
```
Initial NumLock state: off (turned on then by first press)
Press keys: `NumLock + - 7 8 9 4 5 6 1 2 3 0 Del Enter Pause * /`


**Expected behavior**

1. Number keys instead of letters (period for del)
2. Pause key as `'pause` in both events, not as ctrl-s or none
3. NumLock (if possible) detected on GTK. 
4. CapsLock on GTK yields `none #"^T"` instead of `caps-lock caps-lock` right now. Should work as on Windows. Didn't test ScrollLock, might be messed up too.

**Platform version**
```
Red 0.6.4 for Windows built 27-Jun-2022/11:51:28+03:00  commit #ed73e33
Red 0.6.4 for Linux built 20-Jul-2022/7:20:15+03:00  commit #0897f65
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-02T19:56:16Z, greggirwin, commented:
<https://github.com/red/red/issues/5170#issuecomment-1203154769>

    As always, thanks for the detailed report and tooling to help test.

--------------------------------------------------------------------------------

On 2022-08-08T20:08:50Z, dockimbel, commented:
<https://github.com/red/red/issues/5170#issuecomment-1208559833>

    @qtxie I've taken care of the Windows part, I let you process the GTK part.

--------------------------------------------------------------------------------

On 2022-08-09T07:43:47Z, qtxie, commented:
<https://github.com/red/red/issues/5170#issuecomment-1209029607>

    1. `event/key` is wrong in `on-key-down`, but it's correct in `on-key`, right? The title of the issue is not accurate.
    
    2. For `on-key-down` and `on-key-up`, the value of `event/key` should be the same no matter `Num Lock` is on or off. I suggest that we always return number keys. That is, value of keys when `Num Lock` is on. So `5` has a value rather than `none` when `Num Lock` is off.

--------------------------------------------------------------------------------

On 2022-08-09T08:03:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/5170#issuecomment-1209048007>

    > For on-key-down and on-key-up, the value of event/key should be the same no matter Num Lock is on or off.
    
    Currently, it's not the same. Why should it be? I think only `event/picked` (scancode) has to be the same. 
    Although it's possible that laptop keyboard driver works differently than desktop, but with numlock off I get:
    ```
    #"+" #"k"
    #"-" #"m"
    home home
    up up
    end end
    left left
    none #"^L"
    right right
    page-up page-up
    down down
    page-down page-down
    insert insert
    delete delete
    #"^M" #"^M"
    none #"^S"
    #"*" #"j"
    #"/" #"o"
    ```

--------------------------------------------------------------------------------

On 2022-08-09T08:22:47Z, qtxie, commented:
<https://github.com/red/red/issues/5170#issuecomment-1209069718>

    > Currently, it's not the same. Why should it be? I think only event/picked (scancode) has to be the same.
    
    To make it easier to know which key is pressed when you don't care much about the value of the key. No matter you pressed `Shift` or `Caps On`, the value is the same. Do we use `event/picked` for scancode?

--------------------------------------------------------------------------------

On 2022-08-09T08:36:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/5170#issuecomment-1209083369>

    Sorry I have misled you. I have no idea what `event/picked` is. Seems to return `to integer! event/key` for `char!` keys, but also some number for `word!` keys, but doesn't look like scan code. I think using it for scan code would be a better idea.

--------------------------------------------------------------------------------

On 2022-08-09T11:03:53Z, dockimbel, commented:
<https://github.com/red/red/issues/5170#issuecomment-1209235724>

    > event/key is wrong in on-key-down, but it's correct in on-key, right? The title of the issue is not accurate.
    
    That's right.
    
    > Do we use event/picked for scancode?
    
    Only if it can be a cross-platform value.

--------------------------------------------------------------------------------

On 2022-08-09T11:24:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/5170#issuecomment-1209254362>

    Scancodes are cross-platform by definition, however device-dependent :p
    https://stackoverflow.com/questions/27075328/list-of-hex-keyboard-scan-codes-and-usb-hid-keyboard-documentation
    
    I also expect there can be a problem with emulated keys (e.g. via `keybd_event`), as one does not usually provide a scan code for an emulated key. I sure didn't. I don't think we can provide cross-platform way of knowing the key regardless of locks state, so maybe to hell with it?

--------------------------------------------------------------------------------

On 2022-08-09T13:42:15Z, dockimbel, commented:
<https://github.com/red/red/issues/5170#issuecomment-1209399375>

     > Scancodes are cross-platform by definition, however device-dependent :p
     
    "cross-platform" includes both operating system and hardware.

--------------------------------------------------------------------------------

On 2022-08-09T13:53:59Z, dockimbel, commented:
<https://github.com/red/red/issues/5170#issuecomment-1209414168>

    Damn auto-closing on "fixes" word!

--------------------------------------------------------------------------------

On 2022-08-10T09:34:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/5170#issuecomment-1210415113>

    Auto closed again ;)

--------------------------------------------------------------------------------

On 2022-08-14T21:33:02Z, dockimbel, commented:
<https://github.com/red/red/issues/5170#issuecomment-1214453041>

    @qtxie Thanks for fixing the Windows version too. 👍 

