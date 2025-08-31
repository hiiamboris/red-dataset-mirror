
#3682: [View] `do-events` isn't considering the absence of windows
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3682>

**Describe the bug**
When no windows are open:
```
>> do-events
*** Script Error: path none is not valid for none! type
*** Where: eval-path
*** Stack: do-events
```
Moreover, the same happens when a window was *just* closed: it is still inside a pane, but it's `state` is already `none`.

**Expected behavior**
It should check for both empty screen `pane` and `none? state` and exit silently.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Dec-2018/23:37:37+03:00 commit #873a756
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-29T09:15:59Z, dockimbel, commented:
<https://github.com/red/red/issues/3682#issuecomment-450478412>

    > When no windows are open:
    
    I can't make sense of that. If you are using the GUI console, the console itself is a View window. If you are using the CLI console, then that function is not defined.
    
    In the GUI console, I cannot reproduce your error:
    ```
    >> do-events
    (loops forever)
    ```
    which is the currently expected behavior, as `do-events` is starting a new blocking event loop.

--------------------------------------------------------------------------------

On 2018-12-29T12:34:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/3682#issuecomment-450489890>

    @dockimbel you're correct, I'm using the CLI console. Should've been clear on that.
    On Windows it is defined there if you run `red --cli`. It is also defined when you compile it with `needs: view`. Although it is indeed undefined if compiled without.

--------------------------------------------------------------------------------

On 2019-01-01T19:23:36Z, endo64, commented:
<https://github.com/red/red/issues/3682#issuecomment-450751402>

    `do-events` returns `none` if `system/view/screens/1/pane` is `none` done by this [PR 3647](https://github.com/red/red/pull/3647)
    
    But it doesn't check `window was just closed` case.

--------------------------------------------------------------------------------

On 2019-09-07T14:44:32Z, dockimbel, commented:
<https://github.com/red/red/issues/3682#issuecomment-529114410>

    @hiiamboris How do I reproduce the "when a window was just closed" case? I tried without success:
    ```
    >> view [] do-events
    == none
    ```

--------------------------------------------------------------------------------

On 2019-09-07T15:13:56Z, dockimbel, commented:
<https://github.com/red/red/issues/3682#issuecomment-529116794>

    I applied a blind patch as I can't reproduce the "window just closed" case. As the main issue reported has been fixed by endo, I'll close this ticket.

--------------------------------------------------------------------------------

On 2020-03-06T19:48:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/3682#issuecomment-595934605>

    For the record, I couldn't reproduce "window just closed" case in the current builds (and it was never trivial to begin with), but I suppose it was due to premature faces destruction as happens in https://github.com/red/red/issues/4319

