
#1355: write function not clearing existing data
================================================================================
Issue is closed, was reported by x8x and has 2 comment(s).
<https://github.com/red/red/issues/1355>

``` rebol
  write %file "0000000000"
  read %file
;   "0000000000"
  write %file "11111"
  read %file
;   "1111100000"
```

``` rebol
system/platform
;   MacOSX
```



Comments:
--------------------------------------------------------------------------------

On 2015-09-17T04:47:11Z, x8x, commented:
<https://github.com/red/red/issues/1355#issuecomment-140969461>

    Thanks, the fix works. 8-)

