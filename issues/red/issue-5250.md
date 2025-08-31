
#5250: [GUI console] Places input line outside of viewport
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5250>

**Describe the bug**

Very annoying and old bug
<img width=400 src=https://i.gyazo.com/6865450871ae50230980d5f3268f31a2.gif></img>


**To reproduce**

1. Input a multi-line expression and press Enter to evaluate it
2. Press Up Up Down to get it from history, then another expression, then the long expression again
3. Press Enter to evaluate it again
4. Voila - you can't see your own input and it won't show itself on key presses, so you have to go scrolling

**Expected behavior**

Input line stays visible unless scrolled manually. Every key press (except Windows key plz!) should show it.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4599 date: 26-Nov-2022/12:23:25 commit: #3b59a3ffc877eb6a5d6bb3a4d2e0b6d41cf6ca0d ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-12-07T16:03:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/5250#issuecomment-1341186945>

    The fix doesn't look complete to me @qtxie:
    <img width=500 src=https://i.gyazo.com/3a9fd91c9d996236cbd7ee733e0ac36b.gif></img>

--------------------------------------------------------------------------------

On 2022-12-07T23:35:56Z, qtxie, commented:
<https://github.com/red/red/issues/5250#issuecomment-1341748214>

    Yes. I noticed that. Looks like a rounding issue.

--------------------------------------------------------------------------------

On 2023-02-07T14:07:23Z, mikeyaunish, commented:
<https://github.com/red/red/issues/5250#issuecomment-1420832829>

    Running the following from the console: ``` view layout [ button "Error text" [ print xyz ]]``` and the error text is buried after a few clicks on the "Error text" button.

