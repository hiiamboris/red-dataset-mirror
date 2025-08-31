
#82: NOT interacts strangely with AND
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/82>

I tried the following

```
not 4 => -5
-5 and 3 => 3
3 and -5 => 3
3 and not 4 => 3  ; so far so good
not 4 and 3 => 0 ; wrong!!!!
4 and 3 => 0 ; OK
```

Even if `not 4 and 3` is taken as `not (4 and 3)` it should still be `not 0  => -1`



Comments:
--------------------------------------------------------------------------------

On 2011-06-10T19:44:12Z, dockimbel, commented:
<https://github.com/red/red/issues/82#issuecomment-1344575>

    Tested OK.

