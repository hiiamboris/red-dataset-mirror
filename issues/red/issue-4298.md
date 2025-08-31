
#4298: image/alpha set-path is not bound-checked
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.review]
<https://github.com/red/red/issues/4298>

**Describe the bug**

```
>> i: make image! 2x2
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
>> i/alpha
== #{00000000}
>> i/alpha: 1 i/alpha
== #{01010101}
>> i/alpha: -1 i/alpha
== #{FFFFFFFF}           ;) expected #{00000000}
>> i/alpha: 255 i/alpha
== #{FFFFFFFF}
>> i/alpha: 256 i/alpha
== #{00000000}           ;) expected #{FFFFFFFF}
```

**Expected behavior**

Alpha value should be clipped within 0..255 before applying it.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 19-Feb-2020/21:37:44+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-25T14:41:01Z, 9214, commented:
<https://github.com/red/red/issues/4298#issuecomment-603877917>

    Only the rightmost byte of an integer value is taken into account (alpha component of BGRA), ignoring the sign:
    
    ```red
    >> to-hex -1
    == #FFFFFFFF
    >> to-hex 256
    == #00000100
    ```
    
    The same principle holds for other image components (`/argb`, `/rgb`). `integer!` is merely a collection of 4 bytes in these cases, and I don't think sign bit should enforce any specific semantics for any of them.

--------------------------------------------------------------------------------

On 2020-03-25T15:17:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4298#issuecomment-603899989>

    `rgb: integer` should be forbidden IMO, as it is both endianness-dependent and broken. See how it flips:
    ```
    >> i: make image! [1x1 #{112233} #{44}]
    >> i/argb
    == #{332211BB}
    >> i/rgb
    == #{112233}
    >> i/rgb: to-integer i/rgb  i/rgb
    == #{332211}
    >> i/rgb: to-integer i/rgb  i/rgb
    == #{112233}
    ```
    
    Same for `argb: integer`
    ```
    >> i/argb: to-integer i/argb  i/argb
    == #{2211BBCC}
    >> i/argb: to-integer i/argb  i/argb
    == #{11BBCCDD}
    >> i/argb: to-integer i/argb  i/argb
    == #{BBCCDDEE}
    >> i/argb: to-integer i/argb  i/argb
    == #{CCDDEE44}
    >> i/argb: to-integer i/argb  i/argb
    == #{DDEE4433}
    >> i/argb: to-integer i/argb  i/argb
    == #{EE443322}
    >> i/argb: to-integer i/argb  i/argb
    == #{44332211}
    >> i/argb: to-integer i/argb  i/argb
    == #{332211BB}
    >> i/argb: to-integer i/argb  i/argb
    == #{2211BBCC}
    ```
    Looks like a RNG with period=7 ;)

