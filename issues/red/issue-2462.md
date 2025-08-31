
#2462: Source compiler crashes with --red-only command line argument
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2462>

```text
mbp:red peter$ cat ../../Code/Red/test.red
Red []
a: 1
print a
mbp:red peter$ rebol -qs red.r --red-only  ../../Code/Red/test.red
```
gives this result
```text
-=== Red Compiler 0.6.1 ===- 

Compiling /Users/peter/VMShare/Code/Red/test.red ...
...using libRedRT for MacOSX
...compilation time : 19 ms
*** Driver Internal Error: Script Error : result needs a value 
*** Where: main 
*** Near:  [result: compile src opts 
show-stats
] 
```


