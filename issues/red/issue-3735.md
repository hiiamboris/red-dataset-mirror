
#3735: [Crash] in RTD-LAYOUT after RECYCLE
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/red/issues/3735>

**Describe the bug**

This code `1.red`
```
Red [Needs: View]
recycle
rtd-layout reduce [""]
```

Crashes when run as:
- `red --cli 1.red`
- `red -c 1.red & 1.exe` (with possible `-e` or `-d`, doesn't matter)

But not in release mode or GUI console (incidental?).

Giving the output:
```
root size: 3471, root max: 4887, cycles: 0

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/unicode.reds
*** at line: 844
***
***   stack: red/unicode/get-cache 02E5D9E0h 2
***   stack: red/unicode/to-utf16-len 02E5D9E0h 0018FA18h false
***   stack: gui/create-text-layout 02E5D9E0h 02BD0D30h 150 150
***   stack: gui/OS-text-box-layout 02BA08B4h 02BD00C8h 0 false
***   stack: ctx371~text-box-metrics 02BA08B4h 02BA08C4h 3
***   stack: size-text
***   stack: ctx375~calc-size 0030A484h
***   stack: ctx375~fetch-options 0030A484h
***   stack: make-face
***   stack: rtd-layout 0030B364h
***   stack: red/_function/call 02BA03D4h 0030B364h
***   stack: red/interpreter/eval-code 02BA03D4h 02E57958h 02E57958h false 00000000h 00000000h 02CA42B4h
***   stack: red/interpreter/eval-expression 02E57938h 02E57958h false false false
***   stack: red/interpreter/eval 02BA03B4h true
***   stack: red/natives/catch* true 1
***   stack: ctx473~try-do 003C1C8Ch
***   stack: ctx473~launch 003C1C8Ch
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-13T17:10:00Z, qtxie, commented:
<https://github.com/red/red/issues/3735#issuecomment-472517400>

    Does it still crash?

--------------------------------------------------------------------------------

On 2019-03-13T17:20:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/3735#issuecomment-472521948>

    @qtxie no, can't reproduce since late January.

