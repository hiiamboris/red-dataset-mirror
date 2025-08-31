
#4604: GC-related crash during regression test file lexing
================================================================================
Issue is closed, was reported by 9214 and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4604>

**Describe the bug**
Red fails to run a regression test file from the interpreter.

**To reproduce**
Type the following line in console (tested on GUI one):
```red
>> do %./red/tests/source/units/regression-test-red.red
~~~started test~~~ regression-test
*** Script Error:   has no value
*** Where: do
*** Stack: do-file  
```

That's suspicious for two reasons:
1. Regression test is failing;
1. Obscure error message.

I think any other test file will do, but I haven't thoroughly investigated that. Anyway, repeat the same operation a few more times, rapidly:
```red
root: 5476/7244, runs: 1, mem: 3205036 => 2665392, mark: 7.0ms, sweep: 1.0ms

*** Runtime Error 1: access violation
*** in file: .../red/runtime/unicode.reds
*** at line: 145
***
***   stack: red/unicode/cp-to-utf8 93 0108F000h
***   stack: red/unicode/to-utf8-buffer 02C8A4C4h 0108F000h 58669
***   stack: red/lexer/scan-alt 02C8A4D4h 02C8A4C4h 58669 false true true false 0019FAACh 00000000h
***   stack: red/natives/transcode* true -1 -1 -1 -1 -1 -1 -1
***   stack: load
***   stack: do-file
***   stack: red/natives/do* false -1 -1 -1
***   stack: red/interpreter/eval-arguments 02C8A2D4h 03135950h 03135950h 00000000h 00000000h 02E20BA8h
***   stack: red/interpreter/eval-code 02E20BA8h 03135940h 03135950h false 00000000h 00000000h 02E20BA8h
***   stack: red/interpreter/eval-expression 03135940h 03135950h false false false
***   stack: red/interpreter/eval 02C8A2B4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||561~try-do 02791D60h
***   stack: ctx||561~do-command 02791D60h
***   stack: ctx||561~eval-command 02791D60h
***   stack: ctx||561~run 02791D60h
***   stack: ctx||561~launch 02791D60h
***   stack: ctx||595~launch 027914DCh
```

This never happens if I `recycle/off` first; the original cryptic error message still persists though. Said message is probably a separate issue, but it's hard to tell without this one being fixed first.

**Expected behavior**
I expect regression tests to pass, because, you know, that's what they are supposed to do.

**Platform version**
696ae43, W10.


Comments:
--------------------------------------------------------------------------------

On 2020-08-06T20:17:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4604#issuecomment-670170810>

    I got this on one build:
    ```
    ~~~started test~~~ regression-test                                                                       
                                                                                                             
    *** Runtime Error 1: access violation                                                                    
    *** in file: /D/devel/red/red-src/red-master/runtime/dtoa.reds                                           
    *** at line: 122                                                                                         
    ***                                                                                                      
    ***   stack: red/dtoa/Balloc 1                                                                           
    ***   stack: red/dtoa/Bmultiply 0088B530h 0088B530h                                                      
    ***   stack: red/dtoa/Bpow5mult 00881B90h 6                                                              
    ***   stack: red/dtoa/to-float 00887588h 008875CCh 0018F65Ch                                             
    ***   stack: red/lexer/load-float 0018F764h 00887588h 008875CCh 0 true                                   
    ***   stack: red/lexer/load-integer 0018F764h 00887588h 008875CCh 0 true                                 
    ***   stack: red/lexer/scan-tokens 0018F764h false false                                                 
    ***   stack: red/lexer/scan 026F5554h 00887588h 135 false true true false 0018F8B4h 00000000h 026F5544h  
    ***   stack: red/lexer/scan-alt 026F5554h 026F5544h 135 false true true false 0018F8B4h 00000000h        
    ***   stack: red/natives/transcode* true -1 -1 -1 -1 -1 -1 -1                                            
    ***   stack: load                                                                                        
    ***   stack: red/_function/call 026F53A4h 002C3884h                                                      
    ***   stack: red/interpreter/eval-code 027E03F8h 029F85C8h 02A03C28h true 00000000h 00000000h 027E03F8h  
    ***   stack: red/interpreter/eval-expression 029F85B8h 02A03C28h false true false                        
    ***   stack: red/interpreter/eval-arguments 026F5394h 029F85A8h 02A03C28h 00000000h 00000000h 027E0B98h  
    ***   stack: red/interpreter/eval-code 027E0B98h 029F85A8h 02A03C28h true 00000000h 00000000h 027E0B98h  
    ***   stack: red/interpreter/eval-expression 029F85A8h 02A03C28h false true false                        
    ***   stack: red/interpreter/eval-arguments 026F5374h 029F8598h 02A03C28h 00000000h 00000000h 027E0C58h  
    ***   stack: red/interpreter/eval-code 027E0C58h 029F8588h 02A03C28h true 00000000h 00000000h 027E0C58h  
    ***   stack: red/interpreter/eval-expression 029F8588h 02A03C28h false true false                        
    ***   stack: red/interpreter/eval-arguments 027E66F8h 029F8578h 02A03C28h 00000000h 00000000h 027E66F8h  
    ***   stack: red/interpreter/eval-code 027E66F8h 029F8578h 02A03C28h false 00000000h 00000000h 027E66F8h 
    ***   stack: red/interpreter/eval-expression 029F8578h 02A03C28h false false false                       
    ***   stack: red/interpreter/eval 026F5344h true                                                         
    ***   stack: red/natives/catch* true 1                                                                   
    ***   stack: ctx||465~try-do 002BB6E4h                                                                   
    ***   stack: ctx||465~launch 002BB6E4h                                                                   
    ***   stack: ctx||484~launch 002BB19Ch                                                                   
    ```
    Crashes during test 710 `load "27847278432473892748932789483290483789743824832478237843927849327492 * 4932948478392784372894783927403290437147389024920147892940729142"` but it stops crashing when I remove some comments.
    
    `recycle/off` doesn't help btw, so possible stack corruption here.

--------------------------------------------------------------------------------

On 2020-08-12T07:19:45Z, qtxie, commented:
<https://github.com/red/red/issues/4604#issuecomment-672683108>

    Looks like an issue in the lexer. No crashes if I remove some comments in regression-test-red.red

--------------------------------------------------------------------------------

On 2020-08-13T02:30:51Z, qtxie, commented:
<https://github.com/red/red/issues/4604#issuecomment-673212270>

    ```
    >> do %./red/tests/source/units/regression-test-red.red
    ~~~started test~~~ regression-test
    *** Script Error:   has no value
    *** Where: do
    *** Stack: do-file
    ```
    This error was caused by the new lexer doesn't handle Non-breaking Space(U+00A0) correctly. https://github.com/red/red/blob/master/tests/source/units/regression-test-red.red#L1983
    ```
    s1746: make object! [m: func [][] b: func [arg] [compose/deep [(arg)]]]
                                                   ∧
                                           Non-breaking Space
    ```

--------------------------------------------------------------------------------

On 2020-08-13T16:48:05Z, 9214, commented:
<https://github.com/red/red/issues/4604#issuecomment-673587589>

    @qtxie cannot reproduce the crash after your recent fix 👍 @hiiamboris can you dupe the `dtoa` issue?
    
    Non-breaking space is still a show-stopper though.
    ```red
    >> scan "^(00A0)"
    == word!
    ```

--------------------------------------------------------------------------------

On 2020-08-13T18:25:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4604#issuecomment-673637970>

    No crash for me anymore. Just the error now: `  has no value`

