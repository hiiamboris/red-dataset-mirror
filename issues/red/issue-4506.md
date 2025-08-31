
#4506: Sine gets rounded for no reason
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/4506>

**Describe the bug**
```
>> 1e100 * tan 1e-100         ;) correct
== 1.0
>> 1e100 * atan2 1e-100 1     ;) correct
== 1.0
>> 1e100 * atan 1e-100        ;) correct
== 1.0
>> 1e100 * asin 1e-100        ;) correct
== 1.0
>> 1e100 * sin 1e-100         ;) wrong
== 0.0
>> 1e100 * sine 1e-100        ;) wrong
== 0.0
```

`cos` & `cosine` also do round, but maybe rightfully in this case, as cosine argument and result are of opposite sides of magnitude: cos 0 = 1, acos 1 = 0.
In R/S:
```
    probe cos acos 1e-16
    probe cos acos 1e-17
    probe cos acos 1e-18
```
Outputs:
```
6.123031769111886e-017
6.123031769111886e-017
6.123031769111886e-017
```
So in this case, `0.0` is clearly preferable.

**Expected behavior**

Rounding of `sin` & `sine` result should be done by `form` / `mold`, not by the trig function itself.
`#system [probe 1e100 * sin 1e-100]` outputs `1`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-16T01:50:11Z, qtxie, commented:
<https://github.com/red/red/issues/4506#issuecomment-644481869>

    FYI. In R2 and R3:
    ```
    >> sine/radians 1e-100
    == 0.0
    ```
    I agree with you, accuracy is more important.

