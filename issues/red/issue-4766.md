
#4766: unix-style LF + read/lines = trash being read
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4766>

**Describe the bug**
```
Red []

recycle/off

make-dir %tmp$
files: []
repeat i 100 [
	append files f: rejoin [%tmp$/drw i ".red"]
	write/binary f append/dup copy {^/} "11 " i
]
foreach f files [read/lines probe f]
```
Running this script I'm getting:
```
%tmp$/drw1.red
%tmp$/drw2.red
%tmp$/drw3.red
%tmp$/drw4.red
%tmp$/drw5.red
%tmp$/drw6.red
*** Access Error: invalid UTF-8 encoding: #{9867C408}
*** Where: read
*** Stack:
```
In `#{9867C408}` bytes 2 and 3 are random.

**Expected behavior**

No errors.

**Platform version**
```
Red 0.6.4 for Windows built 4-Dec-2020/7:41:48+03:00 commit #382dd4e
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-18T16:23:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/4766#issuecomment-748186730>

    In debug build:
    ```
    %tmp$/drw1.red
    %tmp$/drw2.red
    %tmp$/drw3.red
    %tmp$/drw4.red
    %tmp$/drw5.red
    %tmp$/drw6.red
    
    *** Runtime Error 98: assertion failed
    *** in file: /D/devel/red/red-src/d2d/runtime/unicode.reds
    *** at line: 502
    ***
    ***   stack: red/unicode/load-utf8-buffer 00000062h 4384215 00000010h 02C87CACh false
    ***   stack: red/unicode/load-utf8-buffer 02703158h -1 00000000h 00000000h false
    ***   stack: red/unicode/load-utf8 02703158h -1
    ***   stack: red/string/load-at 02703158h -1 02C87C98h 0
    ***   stack: red/string/load-in 02703158h -1 0269D094h 0
    ***   stack: red/simple-io/lines-to-block 02703158h 19
    ***   stack: red/simple-io/read-file 02C87C60h -1 -1 false true true
    ***   stack: red/simple-io/read 0269D084h 0269D074h 0269D074h false true
    ***   stack: red/file/read 0269D084h 0269D074h 0269D074h false true false 0269D074h
    ***   stack: red/actions/read 0269D084h 0269D074h 0269D074h false true false 0269D074h
    ***   stack: red/actions/read* -1 -1 -1 1 -1 -1
    ***   stack: red/interpreter/eval-arguments 0269D074h 02C7CDF0h 02C7CDF0h 02C7CDC0h 02C7CD88h 029203A8h
    ***   stack: red/interpreter/eval-code 029203A8h 02C7CDD0h 02C7CDF0h true 02C7CDC0h 02C7CD88h 029203A8h
    ***   stack: red/interpreter/eval-path 02C7CDC0h 02C7CDD0h 02C7CDF0h false false false false
    ***   stack: red/interpreter/eval-expression 02C7CDD0h 02C7CDF0h false false false
    ***   stack: red/interpreter/eval 0269D044h false
    ***   stack: red/natives/foreach* false
    ***   stack: red/interpreter/eval-arguments 0269D014h 02C7CEF8h 02C7CEF8h 00000000h 00000000h 02920AF8h
    ***   stack: red/interpreter/eval-code 02920AF8h 02C7CEC8h 02C7CEF8h false 00000000h 00000000h 02920AF8h
    ***   stack: red/interpreter/eval-expression 02C7CEC8h 02C7CEF8h false false false
    ***   stack: red/interpreter/eval 0269CFF4h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||578~try-do 028C1C8Ch
    ***   stack: ctx||578~launch 028C1C8Ch
    ***   stack: ctx||597~launch 028C1734h
    ```

