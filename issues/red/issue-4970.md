
#4970: [View] CRASH when showing copied rich-text face
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/4970>

**Describe the bug**
```
txt:        "abcde"
lt1:        rtd-layout [""]
lt1/font:   make font! []
lt1/size/x: 5
lt1/text:   txt
lt1/size:   size-text lt1
lt2:        copy/deep lt1
; lt2/font:   copy/deep lt1/font
view compose/deep [
	rich-text draw [text 0x0 (lt1)]
	rich-text draw [text 0x0 (lt2)]
]
```
Run in console.
Output:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/modules/view/backends/windows/text-box.reds
*** at line: 26
***
***   stack: gui/OS-text-box-layout 02C87578h 028A9808h 0 true
***   stack: gui/OS-draw-text 0019F83Ch 02C87568h 02C87578h true
***   stack: parse-draw 0019F83Ch 02C93130h true
***   stack: do-draw 0031160Ah 00000000h 02C93130h false true true true
***   stack: gui/BaseWndProc 0031160Ah 15 0 0
```

**Platform version**
```
Red 0.6.4 for Windows built 18-Sep-2021/18:49:23+03:00  commit #5d45a0e
```



Comments:
--------------------------------------------------------------------------------

On 2021-09-27T09:57:10Z, qtxie, commented:
<https://github.com/red/red/issues/4970#issuecomment-927710475>

    Looks like a native stack alignment issue when calling some OS API. If I add some print statements in `OS-text-box-layout`, no crashes. Also no crash if I switch to software rendering.

--------------------------------------------------------------------------------

On 2021-09-27T10:07:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/4970#issuecomment-927719067>

    Fun ;)
    Then we should prioritize this and let @dockimbel figure it out.

