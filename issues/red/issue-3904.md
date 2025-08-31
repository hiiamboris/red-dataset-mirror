
#3904: [R/S] Inlined array data corruption after an unused operand
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3904>

**Describe the bug**

Correct version of the script:
```
Red/System []

blk: [-1.0 1.0 0.0]
f: as float-ptr! blk
print-line [f/1 " " f/2 " " f/3]
```
Produces (`red -r 1.reds & 1`): `-1.0 1.0 0.0`

Let's insert something before `blk`:
```
Red/System []

""                      ;) <-- this could have been a { comment }
blk: [-1.0 1.0 0.0]
f: as float-ptr! blk
print-line [f/1 " " f/2 " " f/3]
```
Now output is: `0.0 1.590978777845301e-314 5.299808823626645e-315`

Or like this:
```
Red/System []

z: 1
z
blk: [-1.0 1.0 0.0]
f: as float-ptr! blk
print-line [f/1 " " f/2 " " f/3]
```
(same buggy output)

**Expected behavior**

Should always print `-1.0 1.0 0.0`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-May-2019/0:54:25+03:00 commit #3951b6e
```



Comments:
--------------------------------------------------------------------------------

On 2019-05-30T06:28:24Z, endo64, commented:
<https://github.com/red/red/issues/3904#issuecomment-497220209>

    Confirmed on Win10: `Red 0.6.4 for Windows built 27-May-2019/19:00:46+03:00 commit #3dbcad2`

