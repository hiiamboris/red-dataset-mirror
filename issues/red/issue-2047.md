
#2047: PRINT weirdness
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/2047>

rebol: `print [1 print [2 print [3 3] 2] 1]`

```
% rebol
  print [1 print [2 print [3 3] 2] 1]
3 3
2 ?unset? 2
1 ?unset? 1
  prin [1 prin [2 prin [3 3] 2] 1]   
3 32 ?unset? 21 ?unset? 1  

```

red: `print [1 print [2 print [3 3] 2] 1]`

```
% red
  print [1 print [2 print [3 3] 2] 1]
3 3
  print [1 print [2 print [3 3] 2] 1]3 unset 2 33 unset 1 unset 2 3
3 3
  prin [1 prin [2 prin [3 3] 2] 1]3 unset 2 33 unset 1 unset 2 3            ;#1
3 33 unset 2 33 unset 1 unset 2 3

  print [1 print [2 print [3 3] 2] 1]
3 3
  3 unset 2 33 unset 1 unset 2 31]                                          ;#2
3 33 unset 2 33 unset 1 unset 2 3
```

The command in `#1` and `#2` is `prin [1 prin [2 prin [3 3] 2] 1]`
but in `#1` the cursor was at the end of the command before executing
while in `#2` the cursor was at the beginning.

Again, cursor at end then cursor at start with `print`:

```
  print [1 print [2 print [3 3] 2] 1]
3 3
  3 unset 2 33 unset 1 unset 2 32] 1]
3 3
```



