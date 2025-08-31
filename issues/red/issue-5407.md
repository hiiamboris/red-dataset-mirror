
#5407: [Regression, View] Unexplainable initial window relocation
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5407>

**Describe the bug**

Code:
```
view/options [on-created [? face/offset] on-time [? face/offset]][offset: 300x300 rate: 3]
```
Up to `red-view-30sep23-007e2092c.exe`:
```
FACE/OFFSET is a point2D! value: (300, 300)

FACE/OFFSET is a point2D! value: (300, 300)

FACE/OFFSET is a point2D! value: (300, 300)
...
```
Since `red-view-02oct23-ffd15f809.exe`:
```
FACE/OFFSET is a point2D! value: (300, 300)

FACE/OFFSET is a point2D! value: (302, 324.6667)

FACE/OFFSET is a point2D! value: (302, 324.6667)
...
```
Where is `(2, -5.3333)` glitch coming from?
There were a couple of commits at those dates.

**To reproduce**

Observe output of:
`view/options [on-created [? face/offset] on-time [? face/offset]][offset: 300x300 rate: 3]`

**Expected behavior**

All printed values should be `(300,300)`

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5027 date: 16-Oct-2023/7:48:01 commit: #6a055f5dbbf4719391323ecf83c8b29ad2a956bd ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-10-16T18:30:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/5407#issuecomment-1765061057>

    Must be smth to do with borders (client/non-client coordinates mismatch), as with `no-border` flag there's no offset.

