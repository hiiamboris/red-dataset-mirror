
#2200: save disassembles hash!
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2200>

```
red>> save %test.txt make hash! [1 2 3]
red>> test: load %test.txt
== [make hash! 1 2 3]
```



