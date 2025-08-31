
#5574: [View] `focusable` flag doesn't affect clicks
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.wish] [GUI]
<https://github.com/red/red/issues/5574>

**Describe the bug**

With the introduction of tabbing the `focusable` flag was added to the faces. Setting it to true for some faces affects only tabbing but not makes them focusable by clicking, which IMO is an expected UX from a focusable face.

**To reproduce**

1. Run `view [field "1" base "2" with [flags: 'focusable] react [print select face/parent/selected 'text]]`
2. Focus field `1` then click base `2`
3. Observe that focus is still in field `1` and no `2` line was printed on console

**Expected behavior**

I think `focusable` flag should apply to both common refocusing methods - tabbing and clicking (on-down event).

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 217 date: 28-Nov-2024/20:56:25 commit: #a69159226c6885ef7e67c7c9bc50514fd49f03b2 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-12-19T19:19:34Z, greggirwin, commented:
<https://github.com/red/red/issues/5574#issuecomment-2555604201>

    A tricky thing about focus in general, is that we need some visual affordance to go with it, and we don't always have that. I don't remember if all OSs support e.g. keys for all faces either.

--------------------------------------------------------------------------------

On 2024-12-19T19:26:58Z, greggirwin, commented:
<https://github.com/red/red/issues/5574#issuecomment-2555616404>

    For consistency, then, it's a question of whether all styles *can* get focus, and doc'ing these details.

--------------------------------------------------------------------------------

On 2024-12-21T14:36:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/5574#issuecomment-2558139345>

    Windows allows to focus even e.g. `panel`, but on GTK the same trick fails. Another question is what should attempt to focus such a face do, fail silently or fail with an error.

