
#2395: Wish: more loose binary! parser
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
<https://github.com/red/red/issues/2395>

Rebol:
```
16#{F    F}
```
Red:
```
16#{F    F}
*** Syntax Error: invalid binary! at "#{F    F}"
*** Where: do
```


Comments:
--------------------------------------------------------------------------------

On 2017-01-02T08:20:01Z, meijeru, commented:
<https://github.com/red/red/issues/2395#issuecomment-269943685>

    Aren't you afraid that the *human* readability will suffer if there is no strict grouping by two hexes?
    Imagine finding `#{0 FF 1 2 34 5}` in a program...

