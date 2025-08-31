
#796: Can't output CJK characters properly on Windows
================================================================================
Issue is closed, was reported by qtxie and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/796>

`PRINT` can't output some CJK characters properly on Windows.

```
red>> print "我很帅" 
我很帅                               ;-- correct
red>> print "在开会"
在                                   ;-- wrong
```

"开" unicode is #"^(5F00)"



Comments:
--------------------------------------------------------------------------------

On 2014-04-30T09:18:28Z, JerryTsai, commented:
<https://github.com/red/red/issues/796#issuecomment-41776373>

    Maybe it's just Windows. Not a problem in MacOS.

--------------------------------------------------------------------------------

On 2014-04-30T09:27:03Z, qtxie, commented:
<https://github.com/red/red/issues/796#issuecomment-41777073>

    @JerryTsai Yes, Only on Windows. I have found the cause. ;-)

