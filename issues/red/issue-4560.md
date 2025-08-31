
#4560: [View] window offset reports outdated values
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[GUI]
<https://github.com/red/red/issues/4560>

Could be related to https://github.com/red/red/issues/4355

**Describe the bug**

Every time window is moved, it's reported offset is the old one, not the new one.

**To reproduce**

1. `view/options [text react [probe face/parent/offset]] [offset: 0x0]` - shows a window in the corner
2. Press `Alt+Space` to access it's menu and select `Move`
3. With the `Right Arrow` key, move the window right once (it moves by ~10 pixels)
4. Observe `0x0` in the console, while the window is at `10x0` or so
5. Repeat `Right Arrow`
6. Observe `9x0` in the console, while the window is already at ~`20x0`, etc.
7. Press `Enter` to confirm the move
8. Observe `19x0` new offset in the console - which is the right offset

**Expected behavior**

At steps 4 & 6 - offsets `9x0` and `19x0` respectively - the up to date ones.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-30T03:51:25Z, qtxie, commented:
<https://github.com/red/red/issues/4560#issuecomment-651512673>

    You mean `on-move` handler for the window face?
    ```
    view/options [on-move [probe face/offset]] [offset: 0x0]
    ```
    In your example, `text` face will not receive an `move` event as it's not moved related to the window.

--------------------------------------------------------------------------------

On 2020-06-30T07:29:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/4560#issuecomment-651604327>

    Sorry, it was a typo. It should be `react` there. Fixed now.

