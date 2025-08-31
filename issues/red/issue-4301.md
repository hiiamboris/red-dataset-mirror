
#4301: Bad code in a console prompt kills the REPL
================================================================================
Issue is closed, was reported by ralfwenske and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4301>

as detected by @greggirwin 

**To reproduce**
```
>> system/console/prompt: does [append now " >> "]
```
results in
== func [][append now " >> "]
*** Script Error: append does not allow date! for its series argument
*** Where: append
*** Stack: ask string? prompt 
macmini:~ ralfwenske$
```

**Expected behavior**
Console not crashing

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 13-Feb-2020/19:18:35+10:00 commit #d513c8f
```

Also see #3506 # 1953 #867 #1122


Comments:
--------------------------------------------------------------------------------

On 2020-02-24T00:35:58Z, greggirwin, commented:
<https://github.com/red/red/issues/4301#issuecomment-590136247>

    My test is on Win10, with the console crashing.

--------------------------------------------------------------------------------

On 2020-02-24T08:54:17Z, loziniak, commented:
<https://github.com/red/red/issues/4301#issuecomment-590220811>

    Same in Linux. Kills both CLI and GUI consoles.

--------------------------------------------------------------------------------

On 2020-02-24T08:56:22Z, loziniak, commented:
<https://github.com/red/red/issues/4301#issuecomment-590221514>

    ↑↑↑
    > Also see #3506 #1953 #867 #1122
    
    (I repeat to generate ticket associations in GitHub)

--------------------------------------------------------------------------------

On 2022-08-30T17:28:30Z, dockimbel, commented:
<https://github.com/red/red/issues/4301#issuecomment-1231958078>

    It does not crash anymore, so I'm closing this ticket.

--------------------------------------------------------------------------------

On 2022-08-30T17:35:50Z, dockimbel, commented:
<https://github.com/red/red/issues/4301#issuecomment-1231965126>

    Actually, there's still an issue, the erroneous prompt should be discarded automatically by the console and fall back to the default prompt.

