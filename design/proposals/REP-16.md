
#16: WISH: MAX/MIN on SERIES returns the longest/shortest one
================================================================================
Issue is open, was reported by 9214 and has 0 comment(s).
[Wish]
<https://github.com/red/REP/issues/16>

Original issue: https://github.com/red/red/issues/3262

This is how I get longest/shortest series out of two as of now:
```red
>> get pick [x y] greater? length? x: [1 2] length? y: [3 4 5]
== [3 4 5]
>> get pick [x y] lesser? length? x: [1 2] length? y: [3 4 5]
== [1 2]
```

This is because `min` and `max`compare series by the elements at indexes:
```red
>> max [100][1 2 3]
== [100]
>> min [1 2 3][100]
== [1 2 3]
>> min [100][1 2 3]
== [1 2 3]
```

What I propose is either base comparison on the length's of the series by default, or provide mezzanine/refinement to do such comparison. 


