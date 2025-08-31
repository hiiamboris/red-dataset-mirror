
#740: 'PRINT on Windows output uncorrect string
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/740>

Only occurs on Windows. Case as below:

```
red>> print "%e中b"
== "3.472595e-308中b"
```

But if we drop the #"%" or not contains unicode chars in the string, the result is OK.

```
red>> print "e中b"
== "e中b"

red>> print "%eb"
== "%eb"
```



