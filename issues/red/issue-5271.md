
#5271: [View] junk in the pane hangs the event loop
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5271>

original report: :point_up: [January 23, 2023 5:55 PM](https://gitter.im/red/help?at=63ce9fe149431d6370123447)

**Describe the bug**

After evaluating this:
`view [panel with [pane: [[]]]]`
it becomes impossible to close the window and get back to console

**Expected behavior**

Error on invalid `pane` content.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4623 date: 29-Dec-2022/20:00:14 commit: #6af0b708408aeab6ca70dcdf7522d03278b7586e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-01-23T15:26:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/5271#issuecomment-1400536429>

    Related root design issue: https://github.com/red/REP/issues/132

