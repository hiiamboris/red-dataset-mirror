
#59: WISH: copy/part on image could support also negative x/y values
================================================================================
Issue is open, was reported by Oldes and has 0 comment(s).
<https://github.com/red/REP/issues/59>

Currently if used with negative x/y values, the result is empty image:
```
>> i: make image! 4x4  copy/part tail i -2x-2
== make image! [0x0 #{}]
```
I think it should return bottom/right corner of the image with size 2x2 instead.
It would be consistent with negative integers `part` value like in:
```
>> copy/part tail "1234" -2
== "34"
```



