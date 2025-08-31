
#1992: Text Automatically Getting copied into clipboard for VID Application
================================================================================
Issue is closed, was reported by ghost and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1992>

Type this into console -

```
view [text "click" [print "clicked"]]
```

Press Enter.
Now double-click on the text `click`.
The text `click` automatically gets copied into clipboard.



Comments:
--------------------------------------------------------------------------------

On 2016-06-16T02:04:53Z, qtxie, commented:
<https://github.com/red/red/issues/1992#issuecomment-226369909>

    The console doesn't do any copy action, Is it a feature of the `text` face?

--------------------------------------------------------------------------------

On 2016-06-16T05:59:46Z, dockimbel, commented:
<https://github.com/red/red/issues/1992#issuecomment-226395201>

    No, `text` widget does nothing like that as far I as know.

--------------------------------------------------------------------------------

On 2016-06-16T23:52:39Z, qtxie, commented:
<https://github.com/red/red/issues/1992#issuecomment-226646311>

    It's not a bug, it's a feature of the static text control since Vista.
    
    > Starting in Windows Vista, version 6 of the common controls provides an alternative. (A less accessible alternative, mind you.) Static text controls automatically copy their contents to the clipboard when you double-click them if you set the SS_NOTIFY style.
    
    https://blogs.msdn.microsoft.com/oldnewthing/20120301-00/?p=8193

--------------------------------------------------------------------------------

On 2016-06-17T03:31:46Z, dockimbel, commented:
<https://github.com/red/red/issues/1992#issuecomment-226672393>

    @qtxie Good finding. I think we should disable it because nobody knows about it and it could interfere with user's clipboard management, and it's probably not provided on other platforms.

