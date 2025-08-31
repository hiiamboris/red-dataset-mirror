
#36: WISH: timezone over valid range should not be normalized
================================================================================
Issue is open, was reported by Oldes and has 0 comment(s).
<https://github.com/red/REP/issues/36>

Red docs say that zones are values between -16:00 and +15:00 and values over it are normalized.
I have a feeling, that this normalization is strange and there should be error instead, so one can see, that the input is wrong and there would not be non-logical results like:
```
>> 1-1-2000/0:0:0+15:00 = 1-1-2000/0:0:0+47:00 
== true
```



