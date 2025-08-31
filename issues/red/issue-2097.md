
#2097: If 0 is the offset parameter of WRITE/SEEK, the file will be truncated.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2097>

``` Red
red>> write/seek %test.bin #{AAAA} 2
red>> read/binary %test.bin
== #{0000AAAA}
red>> write/seek %test.bin #{BBBB} 0  ; <== zero will cause truncation
red>> read/binary %test.bin  ; <== should be #{BBBBAAAA}
== #{BBBB}  
```



