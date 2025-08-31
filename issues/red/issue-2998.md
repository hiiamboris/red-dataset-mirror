
#2998: REPEND to HASH! works as REPEND/ONLY
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2998>

``` 
>> h: make hash! []
== make hash! []
>> repend h [1]
== make hash! [[1]]
```

Expected output:
```
== make hash! [1]
```


