
#1570: Regression: crash when view image!
================================================================================
Issue is closed, was reported by WiseGenius and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1570>

```
red>> img: make image! [100x100 255.0.0]
== make image! [100x100 #{
FF0000FF0000FF0000FF0000FF0000FF0000FF0000...
red>> view [image img]

*** Runtime Error 1: access violation
*** at: 004702FFh
```

Same result when replacing `image` with `base`.



Comments:
--------------------------------------------------------------------------------

On 2016-02-02T04:00:06Z, dockimbel, commented:
<https://github.com/red/red/issues/1570#issuecomment-178358045>

    Cannot reproduce the crash, works fine here on Win7, both from CLI and GUI consoles.

--------------------------------------------------------------------------------

On 2016-02-02T04:11:32Z, WiseGenius, commented:
<https://github.com/red/red/issues/1570#issuecomment-178361174>

    Hmm. I just downloaded the latest source, and I'm still getting the crash on both consoles in both Windows XP and Windows 7.

--------------------------------------------------------------------------------

On 2016-02-02T04:13:14Z, ghost, commented:
<https://github.com/red/red/issues/1570#issuecomment-178361605>

    I can reproduce the crash on windows 8.1 with latest master binaries.

--------------------------------------------------------------------------------

On 2016-02-02T04:39:30Z, dockimbel, commented:
<https://github.com/red/red/issues/1570#issuecomment-178370228>

    Tried with master binary, cannot reproduce it either, the window with the image shows up with no issue...strange, will try on another box.

--------------------------------------------------------------------------------

On 2016-02-02T04:51:16Z, ghost, commented:
<https://github.com/red/red/issues/1570#issuecomment-178373114>

    @dockimbel console compiled in debug mode gives - 
    
    ```
    red>> img: make image! [100x100 255.0.0]
    == make image! [100x100 #{
    FF0000FF0000FF0000FF0000FF0000FF0000FF0000...
    red>> view [image img]
    opts: context [type offset size text color image f...
    
    *** Runtime Error 1: access violation
    *** in file: /C/Users/ABC/Desktop/red-master/environment/console/modules/view/backends/windows/gui.reds
    *** at line: 61
    ***
    ***   stack: gui/get-face-values 000D04C2h
    ***   stack: gui/BaseWndProc 000D04C2h 5 0 6553700
    ```

--------------------------------------------------------------------------------

On 2016-02-02T08:32:11Z, qtxie, commented:
<https://github.com/red/red/issues/1570#issuecomment-178442707>

    I can reproduce it on Win 10.

