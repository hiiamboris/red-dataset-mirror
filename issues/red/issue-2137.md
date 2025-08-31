
#2137: to string! crashes for binaries from #{C0} to #{F7}
================================================================================
Issue is closed, was reported by x8x and has 2 comment(s).
[type.bug] [status.reviewed] [status.resolved]
<https://github.com/red/red/issues/2137>

```
  repeat n 56 [to string! debase/base at form to-hex n + 191 7 16]

*** Runtime Error 1: access violation
*** at: 0001838Fh
```

and just wondering, shouldn't this return `#{C0}` (`C0` being hex for 192):

```
  append #{}  make char! 192
;   #{C380}
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-01T02:04:11Z, qtxie, commented:
<https://github.com/red/red/issues/2137#issuecomment-236473727>

    When convert a char! to binary!, it will be encoded to UTF-8. We may provide a way to specify how a char! or string! be encoded when convert it to binary! in the future.

