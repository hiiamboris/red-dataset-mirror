
#5472: event/away? stays false when mouse exit face whil LMB is down
================================================================================
Issue is open, was reported by luce80 and has 12 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/5472>

**Describe the bug**
When I have the left mouse button down I don't receive away? = true notifications, neither in `event/away?` nor in `event/flags`

**To reproduce**
print "" ; open console
view [base all-over on-over [?? event/away? ?? event/flags]]

**Expected behavior**
Even if LMB is down `event/away?` should return `true` when the mouse cursor exits the face boundaries.

**Platform version**
```
>> about/debug
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5092 date: 24-Jan-2024/4:14:00 commit: #10dc97b01cda5bb347f2ca5741da7a82f02b37a4 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```



Comments:
--------------------------------------------------------------------------------

On 2024-01-31T20:06:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/5472#issuecomment-1919862245>

    Your test doesn't show it, but I now think what happens is face gets locked to enable dragging. So `away?` gets generated once LMB is up. So this is more a question of naming, we think of `away?` as geometric property, but it's more complex. And whether `away?` should be applied to the last event with LMB down, or like now - only after its release. And of how do we control the locking? Does OS even allow us or we have to check the offsets?

--------------------------------------------------------------------------------

On 2024-02-01T02:11:18Z, qtxie, commented:
<https://github.com/red/red/issues/5472#issuecomment-1920361417>

    > Your test doesn't show it, but I now think what happens is face gets locked to enable dragging. So `away?` gets generated once LMB is up. So this is more a question of naming, we think of `away?` as geometric property, but it's more complex. And whether `away?` should be applied to the last event with LMB down, or like now - only after its release. And of how do we control the locking? Does OS even allow us or we have to check the offsets?
    
    We need a new option to control the locking. 

--------------------------------------------------------------------------------

On 2024-02-01T02:12:45Z, qtxie, commented:
<https://github.com/red/red/issues/5472#issuecomment-1920362663>

    > Expected behavior
    Even if LMB is down event/away? should return true when the mouse cursor exits the face boundaries.
    
    @luce80 What's the use case for this?

--------------------------------------------------------------------------------

On 2024-02-01T17:54:48Z, luce80, commented:
<https://github.com/red/red/issues/5472#issuecomment-1921895924>

    I am trying to implement an `area` using `rich-text`. When I start selecting the text and then , while still selecting, I exit the boundaries I expect the text to scroll to be able to continue selecting (like you can do in this same GitHub editor...). To do this it would be nice if `event/away?` still works even when LMB is down.
    P.S. my example shows that if you click on the gray base and then try to "drag" it, when you exit it `event/away?` remains `false.`

--------------------------------------------------------------------------------

On 2024-02-02T01:45:19Z, qtxie, commented:
<https://github.com/red/red/issues/5472#issuecomment-1922638114>

    @luce80 Checking `event/offset` in the `over` event is a better option. You can know which edge the mouse cursor is on by checking `event/offset` and how far away from the edge.

--------------------------------------------------------------------------------

On 2024-02-02T13:19:23Z, luce80, commented:
<https://github.com/red/red/issues/5472#issuecomment-1923789343>

    Ok, never mind, the fix was quite easy:
    ```
    away?: func [face event][event/offset <> min max 0x0 event/offset face/size]
    ```
    I spent more time writing in this issue.

