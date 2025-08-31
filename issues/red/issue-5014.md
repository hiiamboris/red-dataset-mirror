
#5014: [View, Regression] `text` and `field` cannot be set to whitespace
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5014>

**Describe the bug**

Regression happened between 29 Jul 2020 and 17 Aug 2020:
```
view [t: text on-created [t/text: " "]]
```
This code produces a weird error for `text` and `field` faces:
```
*** Script Error: invalid argument: none
*** Where: find
*** Stack: view show show do-safe on-created
```

**Expected behavior**

No errors.

**Platform version**
```
Red 0.6.4 for Windows built 17-Dec-2021/23:20:59+03:00  commit #2b5d37a
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-04T04:47:37Z, qtxie, commented:
<https://github.com/red/red/issues/5014#issuecomment-1236259232>

    No this issue in commit fe574eacde9f08db2f83ceea579bfbea689f4e25.

