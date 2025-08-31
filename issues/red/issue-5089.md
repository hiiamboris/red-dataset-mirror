
#5089: GUI console does not let you select with the mouse
================================================================================
Issue is closed, was reported by greggirwin and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5089>

GUI console does not let you select with the mouse, after at least one evaluation, unless you go down a line.

Was fine up to at least 15-Feb-2022.

**To reproduce**

1) Enter anything in the console and press Enter to evaluate it.
2) Try to drag the mouse across any single line to select it.

**Expected behavior**

Select text without having to drag down a line.


**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
Red 0.6.4 for Windows built 24-Feb-2022/10:36:26-07:00  commit #bcb5720
--------------------------------------------
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-28T12:16:20Z, qtxie, commented:
<https://github.com/red/red/issues/5089#issuecomment-1054197667>

    This issue was introduced in this commit eb804cf81ecdd0c7a7809e713ce78f7c09cbf668.
    
    No idea why it causes the issue. There is no `text` and `field` face used in the gui-console.

--------------------------------------------------------------------------------

On 2022-02-28T18:51:26Z, greggirwin, commented:
<https://github.com/red/red/issues/5089#issuecomment-1054560643>

    Because `type` is being set to the guessed datatype, when it's the face style. My guess at a glance. Why it triggers that code I don't know, having not worked on it before.

--------------------------------------------------------------------------------

On 2022-02-28T19:24:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/5089#issuecomment-1054586482>

    You almost nailed it. Issue is, `type` is a newly introduced local which now shadows the `face/type` which needs qualified prefix.
    I'm surprised it works at all in this state ;)

--------------------------------------------------------------------------------

On 2022-02-28T20:42:29Z, greggirwin, commented:
<https://github.com/red/red/issues/5089#issuecomment-1054644649>

    Ah yes, `function` in use. I sometimes miss details when viewing bits on github. Thanks @hiiamboris. :+1:

--------------------------------------------------------------------------------

On 2022-05-30T07:34:46Z, qtxie, commented:
<https://github.com/red/red/issues/5089#issuecomment-1140806174>

    @greggirwin @hiiamboris Thanks a lot. 👍 

