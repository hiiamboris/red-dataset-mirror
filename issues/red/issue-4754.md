
#4754: [Regression] GUI console CRASHES on `??`
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/4754>

**Describe the bug**
Save this as 1.red and run `red 1.red`:
```
Red []
?? ??		;-- any `?? multiline-thing` crashes it
```
Effect:
```
*** Script Error: head does not allow none! for its series argument
*** Where: head
*** Stack: 
*** Script Error: head does not allow none! for its series argument
*** Where: head
*** Stack: 
*** Script Error: head does not allow none! for its series argument
*** Where: head
*** Stack: 
*** Script Error: head does not allow none! for its series argument
*** Where: head
*** Stack: 
*** Script Error: head does not allow none! for its series argument
*** Where: head
*** Stack: 
*** Script Error: head does not allow none! for its series argument
*** Where: head
*** Stack: 

*** Runtime Error 19: stack error or overflow
*** in file: /D/devel/red/red-src/red/runtime/allocator.reds
*** at line: 883
***
***   stack: red/alloc-series-buffer 40 1 0
***   stack: red/alloc-series 40 1 0
***   stack: red/alloc-bytes 40
***   stack: red/_hashtable/_alloc-bytes-filled 40 #"^@"
***   stack: red/_hashtable/init 9 02A143C8h 2 2
***   stack: red/_context/create 9 false true 02A143C8h 2
***   stack: red/object/copy 02A13E10h 026AE664h 00000000h false 00000000h
***   stack: red/error/make 00000000h 026AE654h 34
***   stack: red/error/create 02A0ABF8h 02A0C170h 029609E8h 026AE644h 029CFE88h
***   stack: red/fire 1 000A31F0h
***   stack: red/actions/get-action-ptr-from 3 026AE634h 32
***   stack: red/actions/get-action-ptr* 32
***   stack: red/actions/head*
***   stack: ctx||631~vprint 02801008h
***   stack: red-print-gui 026AE564h true
***   stack: red/dyn-print/red-print 026AE564h true
***   stack: red/natives/do-print false true
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 026AE664h
***   stack: red/fire 1 000A3374h
***   stack: red/actions/get-action-ptr-from 3 026AE634h 32
***   stack: red/actions/get-action-ptr* 32
***   stack: red/actions/head*
***   stack: ctx||631~vprint 02801008h
***   stack: red-print-gui 026AE564h true
***   stack: red/dyn-print/red-print 026AE564h true
***   stack: red/natives/do-print false true
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 026AE664h
***   stack: red/fire 1 000A34F8h
***   stack: red/actions/get-action-ptr-from 3 026AE634h 32
***   stack: red/actions/get-action-ptr* 32
***   stack: red/actions/head*
***   stack: ctx||631~vprint 02801008h
***   stack: red-print-gui 026AE564h true
***   stack: red/dyn-print/red-print 026AE564h true
***   stack: red/natives/do-print false true
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 026AE664h
***   stack: red/fire 1 000A367Ch
```

**Platform version**
```
Red 0.6.4 for Windows built 9-Dec-2020/12:04:12
```



