
#4433: [CRASH] when loading a big map
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4433>

**Describe the bug**
```
load https://raw.githubusercontent.com/hiiamboris/whatever/master/idx

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/hashtable.reds
*** at line: 61
***
***   stack: red/hash-string 02E3BBC0h false
***   stack: red/_hashtable/hash-value 02E3BBC0h false
***   stack: red/_hashtable/get 0222BFB8h 02E3BBC0h 0 0 2 false false
***   stack: red/_hashtable/put-all 0222BFB8h 0 2
***   stack: red/_hashtable/init 966 02B3B460h 1 1
***   stack: red/map/make-at 02B3B460h 02B3B460h 966
***   stack: red/lexer/scan-paren-close 0018FAF0h 0AE3E14Dh 0AE3E14Dh 0 true
***   stack: red/lexer/scan-tokens 0018FAF0h false false
***   stack: red/lexer/scan 02A89384h 0AE10028h 15148892 false true true false 0018FBE4h 00000000h 02A89374h
***   stack: red/natives/transcode* true -1 -1 -1 -1 -1 -1 -1
***   stack: load
***   stack: red/_function/call 02A891D4h 003D3884h
***   stack: red/interpreter/eval-code 02A891D4h 02DC8940h 02DC8940h false 00000000h 00000000h 02B703F8h
***   stack: red/interpreter/eval-expression 02DC8930h 02DC8940h false false false
***   stack: red/interpreter/eval 02A891B4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||528~try-do 003F1FACh
***   stack: ctx||528~do-command 003F1FACh
***   stack: ctx||528~eval-command 003F1FACh
***   stack: ctx||528~run 003F1FACh
***   stack: ctx||528~launch 003F1FACh
***   stack: ctx||561~launch 003F1700h
```
The bug is random, starts at ~2000 lines but depends on the build. Then the more lines are there the more chances of it crashing.

**To reproduce**

Download the file locally so it loads fast.
On `master` it may take minutes to load, so not viable for testing.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 7-May-2020/22:50:22+03:00
master & fast-lexer
```
Build https://github.com/red/red/pull/4097 doesn't crash



Comments:
--------------------------------------------------------------------------------

On 2020-05-07T21:42:01Z, greggirwin, commented:
<https://github.com/red/red/issues/4433#issuecomment-625512138>

    ```
    >> s: read https://raw.githubusercontent.com/hiiamboris/whatever/master/idx
    == {#(^/    "Red" #(^/        %1.red [1]^/        %1.reds [1]^/        %2.red [1]^/        %2.reds [1]^/        %4.red [1]^/      ...
    >> length? s
    == 15148830
    >> format-bytes length? s
    == "14MiB"
    ```
    Nice stress test. Crash reproduced here.

--------------------------------------------------------------------------------

On 2020-05-08T07:14:22Z, qtxie, commented:
<https://github.com/red/red/issues/4433#issuecomment-625674375>

    It's a GC issue, no crashes if turn off the GC.
    
    @hiiamboris Did you merge #4097 into fast-lexer or just use a build from #4097?

--------------------------------------------------------------------------------

On 2020-05-08T08:50:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4433#issuecomment-625712627>

    @qtxie the latter. I have that build stashed for testing purposes. Actually, just tested: the `master` build from Oct 18, 2019 doesn't crash either, so disregard that - I doubt that build contains a fix. 

