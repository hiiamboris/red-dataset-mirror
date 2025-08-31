
#5399: [Regression] Initial reactions get silently ignored sometimes
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5399>

**Describe the bug**

Consider this code:
`r: reactor [x: 1 s: {abc}] react [print ["reacted" i: r/x r/s/:i]]`

In `red-view-25nov22-e6ae842b4.exe`:
```
>> r: reactor [x: 1 s: {abc}] react [print ["reacted" i: r/x r/s/:i]]
reacted 1 a
== [print ["reacted" i: r/x r/s/:i]]
>> r/x: 2
reacted 2 b
== 2
```
In `red-view-26nov22-3b59a3ffc.exe` only subsequent changes are detected:
```
>> r: reactor [x: 1 s: {abc}] react [print ["reacted" i: r/x r/s/:i]]
== none
>> r/x: 2
reacted 2 b
== 2
```

**Expected behavior**

Initial reaction should fire as well.

**Platform version**
```
Red 0.6.4 for Windows built 7-Oct-2023/15:51:08+03:00  commit #0c72515
```


Comments:
--------------------------------------------------------------------------------

On 2023-10-10T15:57:08Z, dockimbel, commented:
<https://github.com/red/red/issues/5399#issuecomment-1755744766>

    From top of my head, that's not a bug, it was an intended change, to avoid firing reactions on initial internal values setting during the creation of the reactor object, as that could cause unwanted side-effects. Though, I would need to research in my notes and changes history to confirm.

--------------------------------------------------------------------------------

On 2023-10-10T16:07:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/5399#issuecomment-1755764167>

    It caught me by surprise, I thought at first that reaction doesn't pick up sources, or they're not valid. Then I figured that it's somehow working but as if `react later`, so I thought it's some bug in my `react` code that always turns on `later`. Then ruled that out, started slicing it until I found the culprit expression, which didn't look like anything suspicious. 
    
    My point is this behavior is quite unexpected. If there's no way for it to work or it causes bad side effects, I vote it prints an annoying message telling me what's wrong so I could fix the code and make it work as I expect.

--------------------------------------------------------------------------------

On 2023-10-10T19:15:49Z, greggirwin, commented:
<https://github.com/red/red/issues/5399#issuecomment-1756079503>

    In this example, the reactor object has been created, so this seems like a bug. We have `react/later` if you don't want it to trigger.

--------------------------------------------------------------------------------

On 2023-10-18T18:12:10Z, dockimbel, commented:
<https://github.com/red/red/issues/5399#issuecomment-1769079119>

    Indeed, it was a silly regression caused by a refactoring of `react` implementation.

