
#4865: CRASH when making a misspelled word
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4865>

**Describe the bug**

Issue 1 (`-d` console):
```
>> w: to word! to issue! "<s>"

*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/runtime/datatypes/word.reds
*** at line: 432
***
***   stack: red/word/to 00000062h 00448C6Bh 1702876
***   stack: red/word/to 028CBF44h 028CBF54h 15
***   stack: red/actions/to 028CBF44h 028CBF54h
***   stack: red/actions/to*
***   stack: red/interpreter/eval-arguments 028CBF34h 02C6C2B0h 02C6C2B0h 00000000h 00000000h 029AFDF8h
***   stack: red/interpreter/eval-code 029AFDF8h 02C6C270h 02C6C2B0h true 00000000h 00000000h 029AFDF8h
***   stack: red/interpreter/eval-expression 02C6C270h 02C6C2B0h false true false
***   stack: red/interpreter/eval-expression 02C6C260h 02C6C2B0h false false false
***   stack: red/interpreter/eval 028CBF04h true
***   stack: red/natives/catch* true 1
***   stack: ctx||548~try-do 02D81D58h
***   stack: ctx||548~do-command 02D81D58h
***   stack: ctx||548~eval-command 02D81D58h
***   stack: ctx||548~run 02D81D58h
***   stack: ctx||548~launch 02D81D58h
***   stack: ctx||566~launch 02D817F4h
```

Issue 2 (no `-d`):
```
>> w: to word! to issue! "<s>"
== <s>
>> get w
*** Script Error: <s> has no value
*** Where: get
*** Stack:

>> set w 1

*** Runtime Error 1: access violation
*** at: 75658E30h
```

**Expected behavior**

`to word! issue` should either do additional checks or work properly with the invalid symbol.
This for example works well:
```
>> w: to word! /1
== 1
>> set w 100
== 100
>> get w
== 100
```

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-03-25T02:42:38Z, qtxie, commented:
<https://github.com/red/red/issues/4865#issuecomment-806320606>

    There is a checking function when converting issue! to word!. It should be updated for the new lexer. https://github.com/red/red/blob/master/runtime/datatypes/word.reds#L406
    
    E.g. `w: to word! "/1"` is allowed by the new lexer, but not in the converting code.
    ```
    >> w: to word! to issue! "/1"
    *** Syntax Error: /1 invalid character at none
    *** Where: to
    *** Stack:
    ```

--------------------------------------------------------------------------------

On 2021-07-26T13:36:31Z, dockimbel, commented:
<https://github.com/red/red/issues/4865#issuecomment-886710321>

    > E.g. w: to word! "/1" is allowed by the new lexer, but not in the converting code.
    
    What do you mean by "is allowed"? 
    ```
    >> type? load "/1"
    == refinement!
    ```

