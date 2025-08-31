
#2146: Inconvenient difference between hash! and block!.
================================================================================
Issue is closed, was reported by ifgem and has 0 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2146>

```
test: [a: 10]
test/a ;=> 10
;-------------
test: make hash! [a: 10]
test/a ;=> none
```

```
test: make hash! [a: 10 a 20]
test/a ;=> 20
;--------------
test: [a: 10 a 20]
test/a ;=> 10
```



