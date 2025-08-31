
#2489: Setting `foreach` expression to a word causes crash in compiled code
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2489>

Compile the following code and run it to see the crash:
```
Red []
x: foreach c "123" [c]
```


