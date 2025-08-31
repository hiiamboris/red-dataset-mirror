
#4750: to integer! #issue silently eats digits
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4750>

**Describe the bug**

1. Issues of odd length throw away the last digit:
```
>> to 0 #f
== 0
>> to 0 #fff
== 255
>> to 0 #fffff
== 65535
```
2. Issues longer than 8 digits throw away the rest:
```
>> to 0 #12345678
== 305419896
>> to 0 #123456789
== 305419896
>> to 0 #1234567890
== 305419896
```

**Expected behavior**

1. [Tastes divided](https://gitter.im/red/bugs?at=5fceb4948d1477540fab098b) on whether issues of odd length should throw an error or produce valid output (and it barely matters anyway), but clearly we don't want conversion to just silently ignore those digits.
2. Error if digits do not fit the `integer!` type (whether it's 32- or 64-bit one).

**Platform version**
```
Red 0.6.4 for Windows built 4-Dec-2020/7:41:48+03:00 commit #382dd4e
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-09T10:08:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4750#issuecomment-741670581>

    Same issue with tuples:
    ```
    >> to tuple! #F
    == 0.0.0
    >> to tuple! #FF
    == 255.0.0
    >> to tuple! #FFF
    == 255.0.0
    >> to tuple! #FFFF
    == 255.255.0
    ```
    and so on

--------------------------------------------------------------------------------

On 2020-12-09T17:34:05Z, greggirwin, commented:
<https://github.com/red/red/issues/4750#issuecomment-741927235>

    Tuples as a byte-view debugging tool. Nice. :^)

--------------------------------------------------------------------------------

On 2020-12-20T12:49:51Z, dockimbel, commented:
<https://github.com/red/red/issues/4750#issuecomment-748603736>

    The corresponding conversion routines have been rewritten to be much more faster and more accurate. For `issue!` to `tuple!` conversions, only following formats are supported: `#rgb`, `#rrggbb` and `#rrggbbaa`.

--------------------------------------------------------------------------------

On 2020-12-20T14:54:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4750#issuecomment-748618091>

    In this case I suggest `hex-to-rgb` func to be rewritten as simply `to tuple! issue`, or made obsolete.

