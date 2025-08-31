
#4183: [CRASH] After using a FONT in DRAW
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4183>

:point_up: [December 10, 2019 5:24 PM](https://gitter.im/red/Railroad-Dev?at=5defaab66a85195b9e30f4c6)

**Describe the bug**

Run in GUI console:
```
font: make font! [name: system/view/fonts/fixed size: 20]
view [box draw [font font text 0x0 "ABC"] rate 1 on-time [unview]]
probe font
```
Last line crashes it:
```
*** Runtime Error 1: access violation                                            
*** in file: /D/devel/red/red-src/red/runtime/datatypes/string.reds              
*** at line: 1067                                                                
***                                                                              
***   stack: red/string/concatenate-literal-part 02AD2C54h 00BCA000h 11893157    
***   stack: red/datatype/mold 02E25358h 02AD2C54h false false true 00000000h 0 0
***   stack: red/actions/mold 02E25358h 02AD2C54h false false true 00000000h 0 0 
***   stack: red/error/reduce 02AD2C34h 02BF1610h                                
***   stack: red/error/form 02BF1610h 02AD2C24h 02AD2C04h -18                    
***   stack: red/actions/form 02BF1610h 02AD2C24h 02AD2C04h 0                    
***   stack: red/block/form 02AD2C14h 02AD2C24h 02AD2C04h 0                      
***   stack: red/actions/form 02AD2C14h 02AD2C24h 02AD2C04h 0                    
***   stack: red/actions/form* -1                                                
***   stack: red/natives/do-print true true                                      
***   stack: red/natives/print* true                                             
***   stack: ctx||503~do-command 003B0524h                                       
***   stack: ctx||503~eval-command 003B0524h                                     
***   stack: ctx||503~run 003B0524h                                              
***   stack: ctx||503~launch 003B0524h                                           
***   stack: ctx||535~launch 003AF7E0h                                           
```
Replace `box` with `base` and it won't crash

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 10-Dec-2019/17:04:39+03:00 commit #48cff0d
```



Comments:
--------------------------------------------------------------------------------

On 2020-02-16T18:33:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4183#issuecomment-586737625>

    Funnily, the original snippet does not always crash it, but does produce some oddities:
    ```
    Red []
    
    forever [
    	try/all [font: make font! [name: system/view/fonts/fixed size: 20] view [box draw [font font text 0x0 "ABC"] rate 1 on-time [unview]] probe font]
    	break
    ]
    ```
    Results in:
    ```
    *** Throw Error: no loop to break
    *** Where: break                 
    *** Stack:                       
    ```
    No crash (apparently it generates an error object, and crashes when accessing it), but the `break` error is quite wrong
    
    And more:
    
    - `try` without `/all` - no crash, no error, no output from `probe`
    - `try` without outer `forever` - crashes ;)
    
    And another funny output, of `mold`:
    ```
    Red []
    
    loop 1 [
    	try/all [
    		font: make font! []
    		view [box draw [font font text 0x0 "ABC"] rate 1 on-time [unview]]
    		probe font
    	]
    	probe font
    ]
    ```			
    Is like "you guess what's in the object, I'm not showing it ;)":
    ```
    make object! [...]
    ```

--------------------------------------------------------------------------------

On 2020-05-13T09:29:44Z, qtxie, commented:
<https://github.com/red/red/issues/4183#issuecomment-627867244>

    Seems fixed.

--------------------------------------------------------------------------------

On 2020-05-13T11:24:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/4183#issuecomment-627919428>

    Using the snippet above I'm still getting the break error:
    ```
    >> forever [
    [    	try/all [font: make font! [name: system/view/fonts/fixed size: 20] view [box draw [font font text 0x0 "ABC"] rate 1 on-time [unview]] probe font]
    [    	break
    [    ]
    make object! [
        name: "Consolas"
        size: 20
        style: none
        angle: 0
        color: none
        anti-alias?: false
        shadow: none
        state: [none none handle!]
        parent: none
    ]
    *** Throw Error: no loop to break
    *** Where: break
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2020-05-13T12:38:28Z, qtxie, commented:
<https://github.com/red/red/issues/4183#issuecomment-627954438>

    @hiiamboris Ah, yes. The second bug is not fixed. I think it's more like `break` in `loop` issue than a view font issue.
    ```
    forever [try/all [1] break]
    *** Throw Error: no loop to break
    *** Where: break
    *** Stack:
    ```

--------------------------------------------------------------------------------

On 2020-05-13T12:44:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/4183#issuecomment-627958082>

    Should we open a new issue then?

--------------------------------------------------------------------------------

On 2020-05-13T13:14:52Z, qtxie, commented:
<https://github.com/red/red/issues/4183#issuecomment-627977756>

    Yes. It's better.

--------------------------------------------------------------------------------

On 2020-05-13T13:48:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4183#issuecomment-627998988>

    https://github.com/red/red/issues/4440

