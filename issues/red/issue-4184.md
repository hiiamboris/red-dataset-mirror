
#4184: [CRASH] Four ways to trigger `reset-buffer does not allow vector! for its <anon> argument` error
================================================================================
Issue is open, was reported by hiiamboris and has 16 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/4184>

**Describe the bug**

This is some kind of memory corruption, likely combined with also a GUI console bug.

## To reproduce

### Way 1: dump print

This case likely doesn't corrupt anything, but just a GUI console bug
Type in GUI console `loop 20000 [print "sabbracadabra"]`
After some delay it ends with:
```
*** Script Error: reset-buffer does not allow vector! for its <anon> argument
*** Where: reset-buffer
*** Stack: 
```

### Way 2: using parse

[(/bugs December 9, 2019 4:11 PM)](https://gitter.im/red/parse?at=5dee47fd46397c721cb46057)

- Download [this file](https://files.gitter.im/red/parse/8eEG/pubmed_result.txt) to be parsed
- Save this script in the same path as `test.red` or whatever:
```
Red []
results: read %pubmed_result.txt 
output: ""
search_tag: [ "search tags(\[[a-zA-Z-&]*\])^/^/" ]
digit: charset "0123456789"
index: [ some digit #":" ]
letters: charset [#"a" - #"z" #"A" - #"Z"]
linebreak: charset [ #"^/" ]
chars:   union union letters charset[ #"," #" " #":" "-" #"[" #"]" #"^"" #"ş" #"ı" #"Ç" #";" #"'" #"í" #"ó" #"(" #")" #"ö" ] digit
authors: [ index some [ chars ] #"." any [ #" " ] ]
title: [ collect [ some [ keep some [ chars ] opt linebreak ] keep [ #"." | #"?" ] ] ]
ref: [ thru "^/^/^/" ]
article: [ authors opt linebreak title ref ]
file: [ search_tag some article end ]
print parse results file
```
- Run `red test.red` (GUI mode) to get `*** Script Error: reset-buffer does not allow vector! for its <anon> argument` error
- Run `red --cli test.red` to get `parse` return `false` and print output will end with `Sonographic diagnosis of Sonographic diagnosis of` (stopping on line 279 of ~60000)
- Replace `parse` with `parse-trace` and it will stop even sooner, on line 89 `Mahmoudzadeh AP, Malkov S, Fan B ....` with the same errors

### Way 3: using GUI console and base-self-test

Download https://gitlab.com/snippets/1921561 and run:
- `red base-self-test.red` (won't see the output) or better:
- `gui-console base-self-test.red` if you have it compiled (to see the output in console)

There will be windows appearing and disappearing, then for ~10-15 seconds an analysis phase. Then GUI console will appear as if it is printing a lot of output (scrollbar extends continuously), but nothing is mirrored onto the terminal window, so it's not a real output. After ~1 minute or so it crashes with: 
```
~~~started test~~~ base-self-test     
~~~finished test~~~  base-self-test   
  Number of Tests Performed:      35  
  Number of Assertions Performed: 170 
  Number of Assertions Passed:    170 
  Number of Assertions Failed:    0   
                                      
*** Script Error: reset-buffer does not allow vector! for its <anon> argument
*** Where: reset-buffer                                                      
*** Stack: ask                                                               
```
The only `ask` there is in the console code (engine.red), so that indicates that base-self-test code has finished successfully, but corrupted something in GUI console memory.

### Way 4: by exploiting the asynchrony bugs in event processing pipeline

This most likely is the same thing that happens in *way 3*, but isolated.
You need this script, `4.red`:
```
Red [Needs: View]
view/no-wait [base green]
loop 10 [view/no-wait [base rate 10 on-time [unview/only face/parent print mold/all face/state]]]
wait 1 loop 100 [do-events/no-wait]
```
Run it as `gui-console 4.red` (preferably) or as `red 4.red` -- it has to be opened via GUI console
The terminal output I'm getting after it crashes in like a minute is: 
```
== make object! [          ;) this is wrong - should be `none`
    type: 'window
    offset: 717x381
    size: 113x100
    tex...
== make object! [          ;) this is wrong - should be `none`
    type: 'window
    offset: 717x381
    size: 113x100
    tex...
#[none]
#[none]
#[none]
#[none]
#[none]
#[none]
#[none]                ;) note that it's the 9th window, 10th one never returned from unview
== none
root: 5443/5521, runs: 0, mem: 3273584 => 2790260, mark: 3.0ms, sweep: 1.0ms
root: 5443/5521, runs: 1, mem: 3270092 => 3013472, mark: 3.0ms, sweep: 1.0ms
root: 5443/5521, runs: 2, mem: 3204312 => 3094212, mark: 3.0ms, sweep: 1.0ms
root: 5443/5521, runs: 3, mem: 3254320 => 3174212, mark: 3.0ms, sweep: 0.0ms
root: 5443/5521, runs: 4, mem: 3271688 => 3220380, mark: 3.0ms, sweep: 1.0ms
root: 5443/5521, runs: 5, mem: 3274624 => 3243304, mark: 3.0ms, sweep: 0.0ms
root: 5443/5521, runs: 6, mem: 3274964 => 3256724, mark: 3.0ms, sweep: 0.0ms
root: 5443/5521, runs: 7, mem: 3275132 => 3264512, mark: 3.0ms, sweep: 0.0ms
root: 5443/5521, runs: 8, mem: 3275284 => 3269044, mark: 3.0ms, sweep: 0.0ms
root: 5443/5521, runs: 9, mem: 3275328 => 3271728, mark: 3.0ms, sweep: 0.0ms
root: 5443/5521, runs: 10, mem: 3275368 => 3273268, mark: 3.0ms, sweep: 0.0ms
root: 5443/5521, runs: 11, mem: 3275452 => 3274192, mark: 3.0ms, sweep: 0.0ms
root: 5443/5521, runs: 12, mem: 3275440 => 3274720, mark: 3.0ms, sweep: 0.0ms
root: 5443/5521, runs: 13, mem: 3275404 => 3274984, mark: 4.0ms, sweep: 0.0ms
root: 5443/5521, runs: 14, mem: 3275444 => 3275204, mark: 4.0ms, sweep: 1.0ms
root: 5443/5521, runs: 15, mem: 3275472 => 3275292, mark: 4.0ms, sweep: 0.0ms
root: 5443/5521, runs: 16, mem: 3275440 => 3275380, mark: 4.0ms, sweep: 0.0ms
root: 5443/5521, runs: 17, mem: 3275440 => 3275380, mark: 3.0ms, sweep: 1.0ms
root: 5443/5521, runs: 18, mem: 3275424 => 3275424, mark: 4.0ms, sweep: 0.0ms
root: 5443/5521, runs: 19, mem: 5448036 => 4278212, mark: 3.0ms, sweep: 2.0ms
*** Script Error: reset-buffer does not allow vector! for its <anon> argument
*** Where: reset-buffer
*** Stack: ask
```
The GUI output never actually appears on the screen, just keeps scrolling itself down.

Interestingly, these variants are also causing the bug:

```
Red [Needs: View]     ;) state is not accessed as a path in this one, so reactivity is no culprit
view/no-wait [base green]
loop 10 [view/no-wait [base rate 10 on-time [unview/only face/parent print mold/all select face 'state]]]
wait 1 loop 100 [do-events/no-wait]
```
```
Red [Needs: View]     ;) no print in this one at all
view/no-wait [base green]
loop 10 [view/no-wait [base rate 10 on-time [unview/only face/parent]]]
wait 1 loop 100 [do-events/no-wait]
```
But this works okay! (increase rate to 100 to crash it):
```
Red [Needs: View]     ;) print comes before unview in this one
view/no-wait [base green]
loop 10 [view/no-wait [base rate 10 on-time [print mold/all face/state unview/only face/parent]]]
wait 1 loop 100 [do-events/no-wait]
```

**Expected behavior**

Test case 1 should probably put a limit on the output buffer size, and should clear the output beyond that limit.
Test case 2 should finish parsing the file.
Test case 3 should finish tests and exit without any errors (it does not display any errors if those sets of tests are run separately, or from CLI console).
Test case 4 should output `none` 10 times, then leave the green base window open

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 11-Dec-2019/17:29:46+03:00
(and some older ones for sure)
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-11T15:54:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/4184#issuecomment-612451977>

    Here's a variant of the (1) GUI console bug, but it crashes the debug console on assertion (although at the same point where one would expect a `reset-buffer` error so it must have the same cause):
    ```
    ...
    *** Script Error: invalid Draw dialect input at: [none]
    *** Where: ???
    *** Script Error: invalid Draw dialect input at: [none]
    *** Where: ???
    
    *** Runtime Error 98: assertion failed
    *** in file: /D/devel/red/red-src/red/runtime/natives.reds
    *** at line: 3123
    ***
    ***   stack: red/natives/foreach-next
    ***   stack: red/natives/foreach-next
    ***   stack: show
    ***   stack: red/_function/call 024C3154h 01FF3884h
    ***   stack: red/interpreter/eval-code 024C3154h 0747B2E8h 0747B2E8h false 00000000h 00000000h 025F0620h
    ***   stack: red/interpreter/eval-expression 0747B2D8h 0747B2E8h false false false
    ***   stack: red/interpreter/eval 0747B220h true
    ***   stack: red/interpreter/eval-function 024C3124h 0747B220h
    ***   stack: red/_function/call 024C3124h 02020E5Ch
    ***   stack: red/interpreter/eval-code 024C3124h 028EE410h 028EE410h false 00000000h 00000000h 024C3084h
    ***   stack: red/interpreter/eval-expression 028EE3F0h 028EE410h false false false
    ***   stack: red/interpreter/eval 024C3114h true
    ***   stack: red/natives/do* false -1 -1 -1
    ***   stack: red/interpreter/eval-arguments 025F04C0h 028EE3C8h 028EE3C8h 00000000h 00000000h
    ***   stack: red/interpreter/eval-code 025F04C0h 028EE3B8h 028EE3C8h false 00000000h 00000000h 025F04C0h
    ***   stack: red/interpreter/eval-expression 028EE3B8h 028EE3C8h false false false
    ***   stack: red/interpreter/eval 024C30F4h true
    ***   stack: red/natives/try* true 0
    ***   stack: do-safe
    ***   stack: do-actor
    ***   stack: ctx||416~awake 02022388h
    ***   stack: gui/make-event 1637472 0 33
    ***   stack: gui/TimerProc 002B0252h 275 00000001h 85377537
    ```
    
    To reproduce:
    ```
    Red [needs: view]
    
    recycle/off
    
    window: layout collect [
    	keep [my-panel: panel #608]
    	keep/only collect [
    		repeat i 15 [
    			repeat j 15 [
    				keep [base 40x40 #95B black "text"]
    			]
    			keep 'return
    		]
    	]
    ]
    
    view/options window [
    	rate: 100
    	actors: object [
    		on-time: func [f e] [
    			foreach base my-panel/pane [base/draw: reduce [none]]
    			show window
    		]
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2020-05-13T09:23:34Z, qtxie, commented:
<https://github.com/red/red/issues/4184#issuecomment-627863753>

    @hiiamboris Pushed a fix. Let me know if it still throws error or crashes.

--------------------------------------------------------------------------------

On 2020-05-13T11:32:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4184#issuecomment-627922766>

    @qtxie did you actually try any of the above methods? ;)
    That fix IMO only hides the problem deeper, because obviously none of the snippets does anything with vectors.
    And yes I can confirm the bug is still there, although symptoms are different (e.g. infinite console output instead of an outright crash)

--------------------------------------------------------------------------------

On 2020-05-13T12:26:00Z, qtxie, commented:
<https://github.com/red/red/issues/4184#issuecomment-627947741>

    @hiiamboris I think I fixed the reset-buffer issue. It's a bug in gui-console. I tried 1 and 4. I know you like report several bugs in one issue. What's the other bug(or bugs)?

--------------------------------------------------------------------------------

On 2020-05-13T12:51:58Z, qtxie, commented:
<https://github.com/red/red/issues/4184#issuecomment-627962164>

    I can see other 2 issues: 
    1. In way 2, there is a `parse` issue.
    2. In way 4, `unview` doesn't work sometimes.

--------------------------------------------------------------------------------

On 2020-05-13T12:56:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/4184#issuecomment-627964777>

    > I know you like report several bugs in one issue.
    
    I wouldn't know if they are several until some get fixed ;)
    
    > What's the other bug(or bugs)?
    
    (3) and (4) still produce endless console "output" (invisible but scrolls the buffer all the time) for me
    Maybe those should be considered in the context of https://github.com/red/red/issues/4319 though, as `reset-buffer` message is now gone
    
    And in (2) no `reset-buffer` anymore, but `parse` and `parse-trace` fail unexpectedly (at different points)

--------------------------------------------------------------------------------

On 2020-06-16T18:24:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4184#issuecomment-644932271>

    Yet one more way to cause the GUI console to enter infinite scroll mode (effectively it hangs):
    1. Type this in GUI console:
    ```
    w: view/no-wait [p: panel 300x300 []]
    append p/pane layout [button]
    show p
    ```
    2. Two windows should be shown - it's already a bug I think
    3. Close one of the windows
    4. Activate the console and press Enter

--------------------------------------------------------------------------------

On 2020-12-14T07:01:01Z, qtxie, commented:
<https://github.com/red/red/issues/4184#issuecomment-744219756>

    ```
    w: view/no-wait [p: panel 300x300 []]
    append p/pane layout [button]
    ```
    Those two lines of code creates two window faces, they are appended into `system/view/screens/1/pane` . After closing one of the windows in step 3, both two windows are closed somehow. The issue is that just one window face were popped from the `system/view/screens/1/pane`. 
    So `do-events` will just return without launching the event loop. See the code below. `win/state` is none because the window has been closed in step 3.
    https://github.com/red/red/blob/master/modules/view/view.red#L711
    ```
    do-events: function [
    	"Launch the event loop, blocks until all windows are closed"
    	/no-wait			   "Process an event in the queue and returns at once"
    	return: [logic! word!] "Returned value from last event"
    	/local result
    ][
    	if all [win: last head system/view/screens/1/pane win/state][
    		unless win/state/4 [win/state/4: not no-wait]		;-- mark the window from which the event loop starts
    		set/any 'result system/view/platform/do-event-loop no-wait
    		:result
    	]
    ]
    ```
    The console engine calls `ask` in an infinite loop, `ask` calls `do-events` in gui-console, `do-events` returns immediately in this case, which cause a busy loop that freeze the gui-console. 

