
#4893: system/options/float/pretty? value is ignored at initialisation
================================================================================
Issue is closed, was reported by zwortex and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4893>

**Before submitting**
https://gitter.im/red/bugs?at=609481110056b2262c32bb41

**Describe the bug**
When starting a new console (regular or gui), the option system/options/float/pretty? is set to false (no pretty printing of float). However when forming a float, its value is rounded. Apparently, the behaviour of form does not reflect the value of the option pretty?. However, if you set the value to false again it is rightly taken into account.

**To reproduce**
```
; start a new console
probe system/options/float/pretty? ;= false
form 1.2354e-16 ;=> 0.0 as if pretty printing
system/options/float/pretty?: false
form 1.2354e-16 ;=> 1.2354e-16 as expected
```

**Expected behavior**
Make sure system/options/float/pretty? value reflects the underlying value used by float after initialisation. Whether the default value for float/pretty? should be pretty? or not pretty? is not for me to say. Maybe other options need being synchronised as well but I haven't checked.

**Platform version**
Red 0.6.4 for Windows built 24-Apr-2021/19:29:49



