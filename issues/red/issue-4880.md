
#4880: TRY/ALL & THROW on certain stack depths cripples subsequent loops operation and CRASH
================================================================================
Issue is closed, was reported by hiiamboris and has 18 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4880>

**Describe the bug**

Given a magickal incantation of this form (it took hours to distill it from the codebase):
```
do [do [do [try/all [1]]]]       ;) depth on which try is invoked is important here
loop 1 [loop 1 [continue]]
print "OK"
```
the interpreter can be forced into repentance:
```
*** Throw Error: no loop to continue
*** Where: continue
*** Stack:
```

**To reproduce**

Stack depth is the key to the above code. Add any (equal) depth to `do ..` and `loop 1 ..` lines and the spell will still work. Add set-words before them (also in the equal amount) and it will work. So I am as usual inclined to blame some dark stack trickery where some code parts rely on other distant code parts doing something specific with the stack, but that assumption never holds true long enough during refactoring.

**Expected behavior**

Should print "OK".

**Platform version**

`console-2016-6-30-23134.exe` prints "OK".
`console-2017-4-12-1647.exe` and all versions up to `Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2` do suffer from the spell's harmful effect.



Comments:
--------------------------------------------------------------------------------

On 2021-04-16T18:59:35Z, greggirwin, commented:
<https://github.com/red/red/issues/4880#issuecomment-821485094>

    I'm glad the master of the dark arts is on our side.

--------------------------------------------------------------------------------

On 2021-04-16T19:01:49Z, greggirwin, commented:
<https://github.com/red/red/issues/4880#issuecomment-821489665>

    It will be interesting to see how these findings affect the re-design of Red's internals. 

--------------------------------------------------------------------------------

On 2021-07-24T14:01:46Z, dockimbel, commented:
<https://github.com/red/red/issues/4880#issuecomment-886057958>

    That error seems to be gone in current version:
    ```
    >> do [do [do [try/all [1]]]]       ;) depth on which try is invoked is important here
    == 1
    >> loop 1 [loop 1 [continue]]
    >> print "OK"
    OK
    ```
    
    I will add a regression test anyway.

--------------------------------------------------------------------------------

On 2021-07-24T14:06:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4880#issuecomment-886058623>

    @dockimbel the spell doesn't work from console, as console wraps calls in a series of try & catch scopes. It has to be a separate script.
    
    Or copy it and `do read-clipboard`.

--------------------------------------------------------------------------------

On 2021-07-24T14:57:15Z, dockimbel, commented:
<https://github.com/red/red/issues/4880#issuecomment-886064654>

    Issue still happens in the `run-all-interp` combined tests, while it runs fine from `try-tests` group.

--------------------------------------------------------------------------------

On 2022-09-04T21:08:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4880#issuecomment-1236415731>

    Separate script fed to console exe:
    ```
    Red []
    
    catch [loop 1 [loop 1 [throw 1]]]
    x: x: loop 1 [
    	do [
    		foreach x [1 2 3] [
    			1 - 2 * 3
    			continue
    		]
    	]
    	1
    ] 
    
    print "OK"
    ```
    Result:
    ```
    *** Runtime Error 98: assertion failed
    *** in file: /d/devel/red/red-src/master/runtime/natives.reds
    *** at line: 3359
    ***
    ***   stack: red/natives/foreach-next
    ***   stack: red/natives/foreach* false
    ***   stack: red/interpreter/eval-arguments 0527D98Ch 056F93E8h 056F93E8h 0527D97Ch 00000000h 00000000h 05360BE8h
    ***   stack: red/interpreter/eval-code 05360BE8h 056F93B8h 056F93E8h 0527D97Ch false 00000000h 00000000h 05360BE8h
    ***   stack: red/interpreter/eval-expression 056F93B8h 056F93E8h 0527D97Ch false false false
    ***   stack: red/interpreter/eval 0527D97Ch true
    ***   stack: red/natives/do* false -1 -1 -1 -1
    ***   stack: red/interpreter/eval-arguments 0527D96Ch 056F9420h 056F9430h 0527D95Ch 00000000h 00000000h 05360CA8h
    ***   stack: red/interpreter/eval-code 05360CA8h 056F9410h 056F9430h 0527D95Ch false 00000000h 00000000h 05360CA8h
    ***   stack: red/interpreter/eval-expression 056F9410h 056F9430h 0527D95Ch false false false
    ***   stack: red/interpreter/eval 0527D95Ch true
    ***   stack: red/natives/loop* false
    ***   stack: red/interpreter/eval-arguments 0527D93Ch 056F9520h 056F9540h 0527D8DCh 00000000h 00000000h 05360BA8h
    ***   stack: red/interpreter/eval-code 05360BA8h 056F9500h 056F9540h 0527D8DCh true 00000000h 00000000h 05360BA8h
    ***   stack: red/interpreter/eval-expression 056F9500h 056F9540h 0527D8DCh false true false
    ***   stack: red/interpreter/eval-expression 056F94F0h 056F9540h 0527D8DCh false true false
    ***   stack: red/interpreter/eval-expression 056F94E0h 056F9540h 0527D8DCh false true false
    ***   stack: red/interpreter/eval-expression 056F94D0h 056F9540h 0527D8DCh false true false
    ***   stack: red/interpreter/eval-expression 056F94C0h 056F9540h 0527D8DCh false false false
    ***   stack: red/interpreter/eval 0527D8DCh true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||601~try-do 04A10D10h
    ***   stack: ctx||601~launch 04A10D10h
    ***   stack: ctx||620~launch 04A10720h
    ```
    In `red+view-debug-master-2022-09-04-1dcb853.exe`
    
    Similarly, need preparation (here, `catch` + `throw`) and trigger (`continue` from `foreach`). Also similarly, a matching number of `do [` levels can be added to both preparation and trigger and crash will reappear, e.g. (3 levels added):
    ```
    Red []
    
    do [do [do [catch [loop 1 [loop 1 [throw 1]]]]]]
    do [do [do [x: x: loop 1 [
    	do [
    		foreach x [1 2 3] [
    			1 - 2 * 3
    			continue
    		]
    	]
    	1
    ]]]]
    
    print "OK"
    ```

--------------------------------------------------------------------------------

On 2022-09-04T21:19:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4880#issuecomment-1236417317>

    Another day wasted ☻

--------------------------------------------------------------------------------

On 2022-09-04T21:23:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4880#issuecomment-1236417927>

    With one less loop:
    ```
    Red []
    
    catch [loop 1 [throw 1]]
    x: x: do [
    	foreach x [1 2 3] [
    		1 - 2 * 3
    		continue
    	]
    	1
    ]
    
    print "OK"
    ```
    It tells me:
    ```
    *** Throw Error: no loop to continue
    *** Where: *
    *** Near : continue
    *** Stack:
    ```

--------------------------------------------------------------------------------

On 2022-09-09T15:40:52Z, dockimbel, commented:
<https://github.com/red/red/issues/4880#issuecomment-1242138059>

    The infix chaining is corrupting the call stack. Replacing `1 - 2 * 3` by  `1 - 2` makes it work fine.

