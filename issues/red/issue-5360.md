
#5360: VID area object does not trigger on-change event when area/text is changed.
================================================================================
Issue is open, was reported by mikeyaunish and has 20 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5360>

**Before submitting**
Prior to opening this ticket, please share your finding in our [dedicated chat](https://gitter.im/red/bugs), so we can confirm it and help in reproducing it, including on other platforms.

**Describe the bug**
VID area object does not trigger on-change event when area/text is changed.

**To reproduce**
Steps to reproduce the behavior:
1. Run this:
```red
view layout [ a1: area on-change [print "on-change" ] button "change area" [ a1/text: "hi" ] ]
``` 
3. Click on the "change area" button
4. The "on-change" action for the area does NOT get triggered.


**Expected behavior**
The "on-change" action for the area should be triggered.


**Platform version**
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4904 date: 4-Aug-2023/22:25:02 commit: #5d0a4ca210632d93b9e37293a0a8ce1cc7706169 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------


Comments:
--------------------------------------------------------------------------------

On 2023-08-05T01:16:34Z, qtxie, commented:
<https://github.com/red/red/issues/5360#issuecomment-1666330895>

    `on-change` event is triggered only when user typing in the area face.

--------------------------------------------------------------------------------

On 2023-08-05T07:51:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/5360#issuecomment-1666430132>

    @qtxie the reason for this issue is that the same on-change fires for field but not for area.

--------------------------------------------------------------------------------

On 2023-08-05T17:50:16Z, mikeyaunish, commented:
<https://github.com/red/red/issues/5360#issuecomment-1666564299>

    I have found that using this feature on fields is an excellent way to provide a simple external interface to the GUI being developed. It would be useful to have this happen with an area as well. 

--------------------------------------------------------------------------------

On 2023-08-06T03:15:01Z, qtxie, commented:
<https://github.com/red/red/issues/5360#issuecomment-1666693192>

    > I have found that using this feature on fields is an excellent way to provide a simple external interface to the GUI being developed. 
    
    Would you give more details about it? 
    
    You can overflow the stack easily with this _feature._
    ```
    view layout [ a1: field on-change [print "on-change" a1/text: "hi2" ] button "change area" [ a1/text: "hi" ] ]
    ```

--------------------------------------------------------------------------------

On 2023-08-06T03:28:47Z, mikeyaunish, commented:
<https://github.com/red/red/issues/5360#issuecomment-1666696171>

    I am using a hidden field to act as an API interface. By just changing a field/text I can trigger all of the appropriate functions within the interface. It is quicker and easier than creating reactions. I can still just use fields, of course. I had got so accustomed to doing that, I just assumed the same would be possible with areas. Not worth overflowing the stack though.

--------------------------------------------------------------------------------

On 2023-08-06T15:17:42Z, greggirwin, commented:
<https://github.com/red/red/issues/5360#issuecomment-1666893309>

    Cyclic change events aren't a new problem. We had to learn to deal with them in VB as well. :^) You just need a flag.

--------------------------------------------------------------------------------

On 2023-08-07T09:48:11Z, qtxie, commented:
<https://github.com/red/red/issues/5360#issuecomment-1667544888>

    @mikeyaunish So you use `field/text` to trigger the `on-change` function. Why not call the `on-change` function directly?

--------------------------------------------------------------------------------

On 2023-08-07T13:24:20Z, dockimbel, commented:
<https://github.com/red/red/issues/5360#issuecomment-1667853082>

    If it triggers for fields, it should trigger for areas too.
    
    Besides, there's an issue with `a1/text: "hi"` evaluated by the button: if it used once, then some characters are typed in the area, hitting the button again will have no effect!

--------------------------------------------------------------------------------

On 2023-08-09T08:18:21Z, qtxie, commented:
<https://github.com/red/red/issues/5360#issuecomment-1670880684>

    I think it's bug to trigger it for fields. I don't see a good reason to do it. It prevents one to do preprocess for the user's input. For example:
    
    ```
    view layout [ field on-change [face/text: transform-text face/text] ]
    ```

--------------------------------------------------------------------------------

On 2023-08-22T03:22:28Z, qtxie, commented:
<https://github.com/red/red/issues/5360#issuecomment-1687356915>

    > If it triggers for fields, it should trigger for areas too.
    > 
    > Besides, there's an issue with `a1/text: "hi"` evaluated by the button: if it used once, then some characters are typed in the area, hitting the button again will have no effect!
    
    Because the same string being set to `a/text`. A workaround is to copy the text, `a1/text: copy "hi"`.

