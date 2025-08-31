
#1403: Bug: replace on string crash interpreter
================================================================================
Issue is closed, was reported by x8x and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1403>

``` rebol
  o: ;one line json data string! that I can not publish
  length? o
;   3138061
  r: replace/all o "],[" "],^\["

*** Runtime Error 1: access violation
*** in file: /red/allocator.reds
*** at line: 210
***
***   stack: red/allocate-virtual 6287360 false
***   stack: red/alloc-big 6285172
***   stack: red/alloc-series-buffer 3142569 2 0
***   stack: red/expand-series FF5CE014h 6285138
***   stack: red/string/concatenate 0202385Ch 0202386Ch 4 0 false true
***   stack: red/string/insert 0202385Ch 0202386Ch 0202384Ch false 0202384Ch false
***   stack: red/actions/insert 0202385Ch 0202386Ch 0202384Ch false 0202384Ch false
***   stack: red/actions/insert* -1 -1 -1
***   stack: replace
***   stack: red/_function/call 020B3428h 001DF88Ch
***   stack: red/interpreter/eval-code 020B3428h 0745B0C0h 0745B0C0h true 0745B080h 0745AF20h 020B3428h
***   stack: red/interpreter/eval-path 0745B080h 0745B090h 0745B0C0h false false true false
***   stack: red/interpreter/eval-expression 0745B090h 0745B0C0h false true
***   stack: red/interpreter/eval-expression 0745B080h 0745B0C0h false false
***   stack: red/interpreter/eval 0202378Ch true
***   stack: red/natives/try* 1
***   stack: red/interpreter/eval-arguments 020B06F8h 02098A54h 02098AA4h 02098A34h 02098AECh
***   stack: red/interpreter/eval-code 020B06F8h 02098A44h 02098AA4h true 02098A34h 02098AECh 020B06F8h
***   stack: red/interpreter/eval-path 02098A34h 02098A44h 02098AA4h false false true false
***   stack: red/interpreter/eval-expression 02098A44h 02098AA4h false true
***   stack: red/interpreter/eval-arguments 020B0508h 02098A34h 02098AA4h 02098A14h 02098AB8h
***   stack: red/interpreter/eval-code 020B0508h 02098A24h 02098AA4h true 02098A14h 02098AB8h 020B0508h
***   stack: red/interpreter/eval-path 02098A14h 02098A24h 02098AA4h false false false false
***   stack: red/interpreter/eval-expression 02098A24h 02098AA4h false false
***   stack: red/interpreter/eval 0202376Ch true
***   stack: red/natives/unless*
***   stack: red/interpreter/eval-arguments 020B0E18h 020988F0h 02098910h 00000000h 00000000h
***   stack: red/interpreter/eval-code 020B0E18h 020988C0h 02098910h false 00000000h 00000000h 020B0E18h
***   stack: red/interpreter/eval-expression 020988C0h 02098910h false false
***   stack: red/interpreter/eval 0202374Ch true
***   stack: red/natives/do*
***   stack: ctx183~run 001D9E2Ch
***   stack: ctx183~launch 001D9E2Ch
```

Let me know if you need an actual test code or if above is enough.



Comments:
--------------------------------------------------------------------------------

On 2016-01-17T12:42:28Z, qtxie, commented:
<https://github.com/red/red/issues/1403#issuecomment-172321456>

    @x8x Would you please add some actual test code?

--------------------------------------------------------------------------------

On 2016-01-18T15:44:34Z, x8x, commented:
<https://github.com/red/red/issues/1403#issuecomment-172565549>

    trying to generate a JSON that show the error and stumped in this one, not sure it's related, but IIRC string limit has been removed:
    
    ``` rebol
      o: make string! 5000000
    ;   ""
      p: "[1,2],"
    ;   "[1,2],"
      loop 1000000 [append o p]
    
    *** Runtime Error 1: access violation
    *** at: 0001230Dh
    ```

--------------------------------------------------------------------------------

On 2016-01-19T14:09:56Z, qtxie, commented:
<https://github.com/red/red/issues/1403#issuecomment-172864265>

    @x8x 
    
    ```
      o: make string! 5000000
    ;   ""
      p: "[1,2],"
    ;   "[1,2],"
      loop 1000000 [append o p]
    
    *** Runtime Error 1: access violation
    *** at: 0001230Dh
    ```
    
    This issue should be fixed in the latest version.

--------------------------------------------------------------------------------

On 2016-01-19T16:52:04Z, x8x, commented:
<https://github.com/red/red/issues/1403#issuecomment-172915180>

    Right, https://github.com/red/red/commit/03bff803b30baa3101d0e5b4f08a80616cd7996b fix it. Thank you! 8-)

