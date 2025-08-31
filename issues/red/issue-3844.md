
#3844: Compiling on Linux fails with a file that sets a word! to the get-word! of an op!, then uses the word!
================================================================================
Issue is closed, was reported by nd9600 and has 4 comment(s).
<https://github.com/red/red/issues/3844>

**Describe the bug**
If you try to compile this file on Linux:
```red
Red [
    Title: "Operator bug test"
]
;a: make op! function [x y] [x + y]
a: :+
probe 4 a 5
```
it fails to compile, with this error (`opTest.red` is the name of the file I compiled):
```
=== Red Compiler 0.6.4 ===- 

Compiling /home/nathan/repos/nd9600/red/opTest.red ...
...using libRedRT built on 9-Apr-2019/13:05:28
...compilation time : 18 ms

Target: Linux 

Compiling to native code...
*** Compilation Error: invalid path value: ops/a* 
*** in file: %/home/nathan/repos/nd9600/red/opTest.red 
*** at line: 332 
*** near: [
    integer/push 5 
    ops/a* 
    stack/unwind 
    f_probe 
    stack/unwind #user-code
]
```

If you use the commented-out line (`a: make op! function [x y] [x + y]`) instead, it works as expected, as does
```
b: function [x y] [x + y]
a: :b

probe a 4 5
```

**To reproduce**
Steps to reproduce the behavior:
1. Compile the file above.
2. See the error

**Expected behavior**
Compilation succeeds, then you can run the resulting file and get `9`.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Linux built 22-Nov-2018/1:40:38+01:00 commit #755eb94
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-09T14:43:26Z, 9214, commented:
<https://github.com/red/red/issues/3844#issuecomment-481281967>

    Duplicate of https://github.com/red/red/issues/2867
    
    @nd9600 this is a known compiler limitation, try to use Encap mode (`-e` flag) instead.

--------------------------------------------------------------------------------

On 2019-04-09T17:30:18Z, greggirwin, commented:
<https://github.com/red/red/issues/3844#issuecomment-481354062>

    Closing as duplicate. 

