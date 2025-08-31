
#4337: [GUI Console] locks up when child process shows a requester dialog
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.tested] [type.review]
<https://github.com/red/red/issues/4337>

**Describe the bug**

No idea how this magic works, but: when a **child process** asynchronously started by the GUI console **requests** a file, directory or font - the GUI **console does not respond**.

`request-file`, `request-font`, `request-dir` are all affected


**To reproduce**
- type in GUI console:
```
write %1.red "Red [needs: view] request-file"
call/show {red 1.red}
```
- wait until it shows the requester dialog
- try activating GUI console - it will give focus away to the requester window, although it does not own it

If you have [`reddo`](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups%2Freddo) then first 2 steps can be simpler: `call/show {reddo request-file}`


**Expected behavior**

Requesters of another process should not block the GUI console.
You can test the same code from R2 `call` or using `start` shell command - it will work properly.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 10-Mar-2020/16:22:26+03:00
W7
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-30T04:02:36Z, qtxie, commented:
<https://github.com/red/red/issues/4337#issuecomment-1263075173>

    I put `red-view.exe` in the current working folder, then run the following code in the gui-console. No locks up.
    ```
    write %1.red "Red [needs: view] request-file"
    call/show {red-view 1.red}
    ```

