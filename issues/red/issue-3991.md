
#3991: Console crash if break is evaluated on foreach-face loop
================================================================================
Issue is open, was reported by planetsizecpu and has 20 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3991>

**Describe the bug**
The Red console crashes if BREAK is evaluated inside a FOREACH-FACE loop

**To reproduce**
Steps to reproduce the behavior:

Copy this code on console: 
```
l: layout [a: area 100x100 red b: box 100x100 green c: field 100x100 blue]
foreach-face l [if face/size/x = 100 [break]]
```
**Expected behavior**
The loop ends and return to the console prompt.

**Platform version (please complete the following information)**
Tested on W10

Red 0.6.4 for Windows built 15-Aug-2019/19:02:53+02:00 commit #b255dee




Comments:
--------------------------------------------------------------------------------

On 2019-08-15T19:00:04Z, dockimbel, commented:
<https://github.com/red/red/issues/3991#issuecomment-521757125>

    > The loop ends and return to the console prompt.
    
    That is not the expected behavior. `break` only breaks from native loops, `foreach-face` is a `function!`.
    
    The minimal code to reproduce it is: 
    ```
    foreach-face layout [base] [break]
    ```

--------------------------------------------------------------------------------

On 2019-08-15T19:39:22Z, dockimbel, commented:
<https://github.com/red/red/issues/3991#issuecomment-521769764>

    In order to properly escape from nested code, throw an exception:
    ```
    l: layout [a: area red b: box 100x100 green c: field 100x100 blue]
    catch [
        foreach-face l [if face/size/x = 100 [print "no more" throw 'break] print "loop"]
    ]
    ```
    `throw` takes a value as argument. In this case, it doesn't matter which one as we don't intercept it for post-processing, so we can use a word to make the intention explicit.

--------------------------------------------------------------------------------

On 2019-08-16T09:32:50Z, planetsizecpu, commented:
<https://github.com/red/red/issues/3991#issuecomment-521949741>

    Thanks Doc, in that case I prefer to let the loop end completely, since I'm not sure if wrapping it with catch will have a higher computational cost, so when you can determine a way to break the loop, if there is one, I can always use it in my code.
    
    Reading the break help I thought it was applicable in foreach-face:
    
    >>? break
    USAGE:
          BREAK
    
    DESCRIPTION:
          Breaks out of a loop, while, until, repeat, foreach, etc.     <---
          BREAK is a native! value.
    
    REFINEMENTS:
          / return => Forces the loop function to return a value.
             value [any-type!]
    
    So it seems rather to indicate that it applies to all types of loop, which is very useful.

--------------------------------------------------------------------------------

On 2019-08-16T19:13:13Z, greggirwin, commented:
<https://github.com/red/red/issues/3991#issuecomment-522120588>

    The computational cost in an interactive environment should rarely matter. Users are slow. ;^)
    
    Applying to all types of loops is great in theory, but how do you determine what a loop is? e.g. `foreach-face` uses `foreach` internally. This is where `catch throw` function attributes can be applied in the future (R2 has them), but also where we have to document what's what. It's hard because a name, or part of it, doesn't imply a particular implementation. That is, just because `foreach-face` has `foreach` in its name doesn't mean it behaves like `foreach`. We have to think about that in standard funcs, to avoid confusion, but it's a general problem that comes from Red's flexibility, and the ability to even define control funcs, which few other langs allow.

--------------------------------------------------------------------------------

On 2019-08-17T08:41:05Z, planetsizecpu, commented:
<https://github.com/red/red/issues/3991#issuecomment-522217836>

    Thanks Gregg, with Doc's explanation I clearly saw that it is my confusion 
    about the name of the function, in fact I did not stop to think that it could 
    be a function, so deeply involved was in the script code!
    
    It occurs to me that it could be a use-case, where it is interesting to break 
    the internal loop in some way, I do use it in a function that is called at a high 
    rate in my game by several other funcs that look for face overlaps, so severy 
    cycle counts:
    
    	; Check if some face overlaps other face in the cave
    	CheckOverlaps: function [f [object!]][
    		Ret: none
    		foreach-face GameData/CaveFace [
    			if face <> f [
    				if overlap? face f [Ret: face] ;Break here would save cycles
    			]
    		]
    		return Ret
    	]
    
    

--------------------------------------------------------------------------------

On 2019-08-23T11:18:09Z, dockimbel, commented:
<https://github.com/red/red/issues/3991#issuecomment-524277532>

    >  since I'm not sure if wrapping it with catch will have a higher computational cost,
    
    There is zero overhead running code in a `catch` block, compared with `do`.

--------------------------------------------------------------------------------

On 2019-08-23T12:12:51Z, planetsizecpu, commented:
<https://github.com/red/red/issues/3991#issuecomment-524292221>

    Thx Doc, I may test `catch` next weeks. 
    
    This days I'm replacing occurrences with much logical operators like `if cond-a or cond-b or cond-c or cond-d [...]` by the form`if any [...][...] ` also `if cond-a and cond-b and cond-c and cond-d [...]` by the form `if all [...][...]` in seek of more speed, although I don't know if there is a difference of speed in evaluation, at least they are more clear.

--------------------------------------------------------------------------------

On 2019-08-23T12:27:11Z, 9214, commented:
<https://github.com/red/red/issues/3991#issuecomment-524296353>

    @dockimbel I believe at this point ticket can be closed.

--------------------------------------------------------------------------------

On 2019-08-23T12:52:24Z, dockimbel, commented:
<https://github.com/red/red/issues/3991#issuecomment-524303702>

    @9214 The crash has not been fixed, just a workaround provided. Such crash should never happen, even with faulty Red code.

--------------------------------------------------------------------------------

On 2020-07-09T22:02:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/3991#issuecomment-656372573>

    FYI the crash output in relevant builds (before the workaround) was:
    ```
    *** Runtime Error 95: no CATCH for THROW
    *** in file: common.reds                
    *** at line: 260                        
    ***                                     
    ***   stack: ***-uncaught-exception     
    ***   stack: ***-uncaught-exception     
    ```

