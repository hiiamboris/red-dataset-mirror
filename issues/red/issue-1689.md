
#1689: Calling event! or image! on non Windows platforms crashes interpreter
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1689>

``` rebol
>> event!

*** Runtime Error 1: access violation
*** at: 00023187h
```

event! always returns a runtime error

``` rebol
>> image!

*** Runtime Error 1: access violation
*** at: 00023187h
```

``` rebol
>> image!
;   ¼
```

while image! randomly returns runtime error or ¼

Maybe just unset them on non windows platforms?



