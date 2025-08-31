
#1307: Select and Find do not work with pair! argument on hash!
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/1307>

Both Select and Find return none when a pair! is used as the search argument with hash!. The issue does not happen with block!.

```
red>> h: make hash! [1x2 0 3x4 1]
== make hash! [1x2 0 3x4 1]
red>> select h 1x2 
== none
red>> find h 3x4
== none
red>> b: [1x2 0 3x4 1]
== [1x2 0 3x4 1]
red>> select b 1x2
== 0
red>> find b 3x4
== [3x4 1]
```



Comments:
--------------------------------------------------------------------------------

On 2015-11-06T10:39:11Z, dockimbel, commented:
<https://github.com/red/red/issues/1307#issuecomment-154375704>

    @qtxie Still not working after the fix.

--------------------------------------------------------------------------------

On 2015-11-06T11:41:02Z, qtxie, commented:
<https://github.com/red/red/issues/1307#issuecomment-154390563>

    @dockimbel It is working in master branch. ;-)

