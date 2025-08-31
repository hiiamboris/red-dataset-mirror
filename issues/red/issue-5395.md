
#5395: `swap` with `any-string!` and `any-list!` crashes
================================================================================
Issue is closed, was reported by ALANVF and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5395>

**Describe the bug**
When using the `swap` action with the arguments `any-string!` (first) and `any-list!` (second), Red will immediately crash.

Additionally, if the argument types are swapped, it just gives an error that the types are incompatible.

Additionally (2x), if the argument types are `any-block!` (first) and `any-path!` (second), it will error, however flipping them works. This behavior seems unintentional.

**To reproduce**
Steps to reproduce the behavior:
1. Open Red repl
2. Enter `swap "abc" [1 2 3]`
3. The repl will crash

**Expected behavior**
An error message rather than a crash.

For the other issue involving `any-path!`, it's expected that both cases will work.

**Screenshots**
(Screenshot not available, console crashes immediately)

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4679 date: 31-May-2023/0:25:57 commit: #03b64ae50ae4bd5c85d0ce52f41b02ed607186b3 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19042 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-10-03T10:04:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5395#issuecomment-1744641934>

    ```
    >> swap 'a/b/c [1 2 3]
    == 1/b/c
    >> swap [1 2 3] 'a/b/c
    *** Script Error: swap does not allow path! for its <anon> argument
    *** Where: swap
    *** Near : swap [1 2 3] 'a/b/c
    *** Stack:
    
    >> swap "abc" [1 2 3]
    
    *** Runtime Error 101: no value matched in SWITCH
    *** in file: /d/devel/red/red-src/master/runtime/datatypes/string.reds
    *** at line: 543
    ***
    ***   stack: red/string/get-char 00000065h 4472199
    ***   stack: red/string/get-char 057764D8h 16
    ***   stack: red/string/swap 04A71E4Ch 04A71E5Ch
    ***   stack: red/actions/swap 04A71E4Ch 04A71E5Ch
    ***   stack: red/actions/swap*
    ***   stack: red/interpreter/eval-arguments 04A71E3Ch 05776550h 05776550h 04A71E1Ch 00000000h 00000000h 0 false
    ***   stack: red/interpreter/eval-code 053B0158h 05776530h 05776550h 04A71E1Ch false 00000000h 00000000h 053B0158h 0 false
    ***   stack: red/interpreter/eval-expression 05776530h 05776550h 04A71E1Ch false false false
    ***   stack: red/interpreter/eval 04A71E1Ch true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||626~try-do 04B4F7C8h
    ***   stack: ctx||626~do-command 04B4F7C8h
    ***   stack: ctx||626~eval-command 04B4F7C8h
    ***   stack: ctx||626~run 04B4F7C8h
    ***   stack: ctx||626~launch 04B4F7C8h
    ***   stack: ctx||645~launch 04B4F1B4h
    ```

--------------------------------------------------------------------------------

On 2023-10-03T20:06:31Z, ALANVF, commented:
<https://github.com/red/red/issues/5395#issuecomment-1745646390>

    I see this has been fixed, but I noticed that the `any-path!` behavior was not fixed. I do feel like paths should support swap as well, and the previously mentioned inconsistency is still there

--------------------------------------------------------------------------------

On 2023-10-03T20:17:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/5395#issuecomment-1745661344>

    Do you have an example?

--------------------------------------------------------------------------------

On 2023-10-03T23:18:45Z, ALANVF, commented:
<https://github.com/red/red/issues/5395#issuecomment-1745874007>

    ```
    >> swap [1 2 3] 'a/b/c
    *** Script Error: swap does not allow path! for its <anon> argument
    *** Where: swap
    *** Near : swap [1 2 3] 'a/b/c
    *** Stack:  
    
    >> swap 'a/b/c [1 2 3]
    == 1/b/c
    ```

--------------------------------------------------------------------------------

On 2023-10-04T08:12:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5395#issuecomment-1746362169>

    ```
    >> swap [1 2 3] 'a/b/c
    == [a 2 3]
    >> swap 'a/b/c [1 2 3]
    == 1/b/c
    >> about
    Red 0.6.4 for Windows built 3-Oct-2023/15:44:34+03:00  commit #b95ac42
    ```

--------------------------------------------------------------------------------

On 2023-10-04T08:26:44Z, ALANVF, commented:
<https://github.com/red/red/issues/5395#issuecomment-1746384459>

    Must be because I'm using a bit of an old version of Red. My bad then, sorry for the confusion

