
#1942: Fix for #1920 breaks Red
================================================================================
Issue is closed, was reported by Zamlox and has 24 comment(s).
[type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/1942>

Following code will crash Red:

```
w: layout/only [base 100x100 blue]
main: layout [base 200x200 30.40.50.255]
main/pane/1/pane: w
view main
```

Because 'main' has alpha? set, `Os-make-view` will call `process-layered-region` which calls `get-face-handle`. Last function called will check for `state` and it will crash.



Comments:
--------------------------------------------------------------------------------

On 2016-05-27T22:45:08Z, qtxie, commented:
<https://github.com/red/red/issues/1942#issuecomment-222269252>

    @Zamlox Thanks. I knew I forgot something... 囧

--------------------------------------------------------------------------------

On 2016-05-27T23:02:07Z, qtxie, commented:
<https://github.com/red/red/issues/1942#issuecomment-222271196>

    Should be fixed with commit: 692ad4746116eb63062bce122d1e88b5fbbb7ea6

--------------------------------------------------------------------------------

On 2016-05-28T03:23:18Z, ghost, commented:
<https://github.com/red/red/issues/1942#issuecomment-222287375>

    @qtxie 
    ![untitled](https://cloud.githubusercontent.com/assets/16458742/15624841/7de7ab0e-24b1-11e6-9ab1-ea44778cef7b.png)
    This is #1942

--------------------------------------------------------------------------------

On 2016-05-31T14:02:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1942#issuecomment-222697867>

    @qtxie @nc-x So is #1942 fixed? I can't reproduce the crash anymore.

--------------------------------------------------------------------------------

On 2016-05-31T14:05:59Z, qtxie, commented:
<https://github.com/red/red/issues/1942#issuecomment-222698975>

    Should be fixed now.

--------------------------------------------------------------------------------

On 2016-06-01T03:32:51Z, ghost, commented:
<https://github.com/red/red/issues/1942#issuecomment-222883989>

    @dockimbel I never got any crashes. 
    I just redownloaded the source after the commit which fixed #1920 and caused this issue but got no crashes. :smile: 
    And I am not getting any crashes after the fix for this as well. :smile:
    So most probably fixed.

--------------------------------------------------------------------------------

On 2016-06-01T06:40:48Z, dockimbel, commented:
<https://github.com/red/red/issues/1942#issuecomment-222906420>

    Shoudn't we see a blue face inside the window? It doesn't seem to work, so maybe we should close this ticket and open a new one for that other issue? @qtxie What do you think?

--------------------------------------------------------------------------------

On 2016-06-01T06:51:30Z, qtxie, commented:
<https://github.com/red/red/issues/1942#issuecomment-222908145>

    Nope. It's correct. We can not see anything because the `main` face is totally transparent.

--------------------------------------------------------------------------------

On 2016-06-01T07:08:38Z, dockimbel, commented:
<https://github.com/red/red/issues/1942#issuecomment-222910958>

    But the `main` face has a child face which is blue (not transparent), we should see it?

--------------------------------------------------------------------------------

On 2016-06-01T07:13:35Z, qtxie, commented:
<https://github.com/red/red/issues/1942#issuecomment-222911852>

    Yes, you're right. It's a bug.

--------------------------------------------------------------------------------

On 2016-06-01T07:26:21Z, qtxie, commented:
<https://github.com/red/red/issues/1942#issuecomment-222914163>

    But if we set the `visible?` of the parent to `false`, all child windows become invisible too.

--------------------------------------------------------------------------------

On 2016-06-11T03:28:59Z, qtxie, commented:
<https://github.com/red/red/issues/1942#issuecomment-225334281>

    We can see the blue face now in the last version.

