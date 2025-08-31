
#3464: Encap mode does not handle nested file inclusion
================================================================================
Issue is open, was reported by 9214 and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/3464>

### Expected behavior
Executables compiled in release mode and in release mode with `-e` flag both act the same.

### Actual behavior
Release mode:
```
O:\dev\bug>O:\dev\red\red.exe -r -t MSDOS c.red
...
O:\dev\bug>c.exe
bar
```
Encapped mode:
```
O:\dev\bug>O:\dev\red\red.exe -r -e -t MSDOS c.red
...
O:\dev\bug>c.exe
*** Script Error: foo has no value
*** Where: do
*** Stack:
```
### Steps to reproduce the problem
Given the following file structure:
```
bug/
    folder/
        a.red
        b.red
    c.red
```
And specificed files content:
```red
Red [File: %a.red]

#include %b.red
```
```red
Red [File: %b.red]

foo: does [print "bar"]
```
```red
Red [File: %c.red]

#include %./folder/a.red

foo
````
Compile `c.red` with `-r` and `-r -e` flags, then execute the binary and compare outputs.

### Red and platform version
```
Red 0.6.3 for Windows built 10-Jul-2018/7:33:50+05:00 commit #fe0c670
```



