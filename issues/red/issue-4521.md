
#4521: [Console] PRINT output is missing a newline before closing ] delimiter.
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4521>

From GUI console, if PRINT is preceded by a PRIN call, then the output head/tail gets wrong:
```
>> print mold new-line/all [a b c] yes
[
    a 
    b 
    c
]
>> prin "" print mold new-line/all [a b c] yes
             <<<<<< should not happen
[
    a 
    b 
    c]       <<<<<< missing newline
```
It looks like the LF is printed at head instead of tail of the block...

Note: it works fine in CLI console, so it's a GUI console specific issue.


