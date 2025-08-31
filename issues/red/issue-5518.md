
#5518: [View] `down` flag discrepancies during clicks
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5518>

**Describe the bug**

Running click tests across W10 and GTK (click on the base):

| Test code | Result on W10 | Result on GTK |
|-|-|-|
| `view [base on-down [print ["DOWN" event/flags]] on-up [print ["UP" event/flags]]]` | `DOWN down`<br> `UP` | `DOWN` <br>`UP down` |
| `view [base on-alt-down [print ["DOWN" event/flags]] on-alt-up [print ["UP" event/flags]]]` | `DOWN alt-down`<br> `UP` | `DOWN` <br>`UP` |
| `view [base on-mid-down [print ["DOWN" event/flags]] on-mid-up [print ["UP" event/flags]]]` | `DOWN mid-down` <br>`UP` | `DOWN` <br>`UP mid-down` |

`aux-down` never worked I think, so not tested

**Expected behavior**

Consistency of behavior across platforms and buttons. 
And ideally, working 4th and 5th buttons (for the latter there's not even a designed event name, but having 4th button without 5th is unlikely useful).

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 173 date: 28-Jun-2024/6:46:49 commit: #aed760e16e57123679b53ff1791bef9fa4f6c71e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.5 ahead: 173 date: 28-Jun-2024/6:46:49 commit: #aed760e16e57123679b5
3ff1791bef9fa4f6c71e ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan
 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


