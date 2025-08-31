
#1384: Some issues with file path reading
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1384>

Should return list of files in current directory:

``` rebol
  read %.
*** Access error: cannot open: .
*** Where: read
```

This one is ok:

``` rebol
  read %" "
*** Access error: cannot open:  
*** Where: read
```

Should return an error without exiting interpreter:

``` rebol
  read %""
*** Runtime Error 98: assertion failed
*** in file: /Volumes/data/HTML/_engine/_code/red/allocator.reds
*** at line: 540

*** Runtime Error 1: access violation
*** in file: /Volumes/data/HTML/_engine/_code/red/debug.reds
*** at line: 70
***
***   stack: __print-debug-stack 0001349Bh
***   stack: ***-on-quit 98 79003
***   stack: red/alloc-series-buffer 0 1 0
***   stack: red/alloc-series 0 1 0
***   stack: red/string/rs-make-at 01A29DACh 0
***   stack: red/simple-io/to-OS-path 01A29D9Ch
***   stack: red/simple-io/read 01A29D9Ch false false
***   stack: red/file/read 01A29D9Ch 01A29D8Ch 01A29D8Ch false false 00000000h
***   stack: red/actions/read 01A29D9Ch 01A29D8Ch 01A29D8Ch false false false 01A29D8Ch
***   stack: red/actions/read* -1 -1 -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 01AB6E08h 01B259F0h 01B259F0h 00000000h 00000000h
***   stack: red/interpreter/eval-code 01AB6E08h 01B259E0h 01B259F0h false 00000000h 00000000h 01AB6E08h
***   stack: red/interpreter/eval-expression 01B259E0h 01B259F0h false false
***   stack: red/interpreter/eval 01A29D8Ch true
***   stack: red/natives/try* 1
***   stack: red/interpreter/eval-arguments 01AB67B8h 01A9EAE0h 01A9EB30h 01A9EAC0h 01A9EB78h
***   stack: red/interpreter/eval-code 01AB67B8h 01A9EAD0h 01A9EB30h true 01A9EAC0h 01A9EB78h 01AB67B8h
***   stack: red/interpreter/eval-path 01A9EAC0h 01A9EAD0h 01A9EB30h false false true false
***   stack: red/interpreter/eval-expression 01A9EAD0h 01A9EB30h false true
***   stack: red/interpreter/eval-arguments 01AB65C8h 01A9EAC0h 01A9EB30h 01A9EAA0h 01A9EB44h
***   stack: red/interpreter/eval-code 01AB65C8h 01A9EAB0h 01A9EB30h true 01A9EAA0h 01A9EB44h 01AB65C8h
***   stack: red/interpreter/eval-path 01A9EAA0h 01A9EAB0h 01A9EB30h false false false false
***   stack: red/interpreter/eval-expression 01A9EAB0h 01A9EB30h false false
***   stack: red/interpreter/eval 01A29D6Ch true
***   stack: red/natives/unless*
***   stack: red/interpreter/eval-arguments 01AB6ED8h 01A9E97Ch 01A9E99Ch 00000000h 00000000h
***   stack: red/interpreter/eval-code 01AB6ED8h 01A9E94Ch 01A9E99Ch false 00000000h 00000000h 01AB6ED8h
***   stack: red/interpreter/eval-expression 01A9E94Ch 01A9E99Ch false false
***   stack: red/interpreter/eval 01A29D4Ch true
***   stack: red/natives/do*
***   stack: ctx182~run 0031FE7Ch
***   stack: ctx182~launch 0031FE7Ch
```

``` rebol
  system/platform
;   MacOSX
```



