
#5189: Trace gets broken by function call with refinements
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5189>

**Describe the bug**
```
trace [
	x: 1 + 2
	y: 4 * 5
]		

trace [
	get/any 'x
	x: 1 + 2
	y: 4 * 5
]		
```
Outputs:
```
    x: 1 + 2                                                 => 3
    y: 4 * 5                                                 => 20
      get/any                                                => 3
```


**Expected behavior**
```
    x: 1 + 2                                                 => 3
    y: 4 * 5                                                 => 20
      get/any                                                => 3
    x: 1 + 2                                                 => 3
    y: 4 * 5                                                 => 20
```

**Platform version**
```
Red 0.6.4 for Windows built 27-Aug-2022/1:55:51+03:00  commit #fa83dc0
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-30T12:53:31Z, dockimbel, commented:
<https://github.com/red/red/issues/5189#issuecomment-1231626484>

    There's also an error in the `trace` docstring:
    ```
    /deep        => Trace into functions and natives (incompatible with /here).
    ```
    No `/here` refinement.

--------------------------------------------------------------------------------

On 2022-08-30T12:55:32Z, dockimbel, commented:
<https://github.com/red/red/issues/5189#issuecomment-1231628669>

    `trace/raw` works fine on the code snippets above, it's the default high-level tracing mode that's guilty, so I let you take care of it and push a PR as it's your own code.

--------------------------------------------------------------------------------

On 2022-08-30T13:09:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/5189#issuecomment-1231645785>

    @dockimbel it doesn't signal that it exited the `get/any` path (or any function path):
    ```
    >> o: object [x: 1]
    >> trace/debug [o/x]
    INIT    none       none                   none                                                                   
    ENTER   none       none                   [<O/X>]                                                                
    FETCH   none       o/x                    [<O/X>]                                                        0       
    ;) it enters o/x:
    ENTER   none       none                   <O>/x                                                          0       
    FETCH   none       o                      <O>/x                                                          0 0     
    PUSH    none       make object! [x: 1]    <O>/x                                                          0 0     
    FETCH   none       x                      o/<X>                                                          0 0     
    PUSH    none       x                      o/<X>                                                          0 0     
    ;) it exits o/x:
    EXIT    none       1                      o/x                                                            0 0     
    PUSH    none       1                      [o/x]                                                          0       
    EXPR    none       1                      [o/x]                                                          0       
        o/x                                                      => 1                                                                                               
    EXIT    none       1                      [o/x]                                                          0       
    ;) note after exit no stack levels (zeroes) are left
    END     none       none                   none                                                                   
    == 1
    
    >> trace/debug [get/any 'thing]
    INIT    none       none                   none                                                                   
    ENTER   none       none                   [<GET/ANY> 'thing]                                                     
    FETCH   none       get/any                [<GET/ANY> 'thing]                                             0       
    ;) it enters get/any but never exits:
    ENTER   none       none                   <GET>/any                                                      0       
    FETCH   none       get                    <GET>/any                                                      0 0     
    OPEN    none       get                    [get/any <THING>]                                              0 0     
    FETCH   none       'thing                 [get/any <THING>]                                              0 1     
    PUSH    none       thing                  [get/any <THING>]                                              0 1     
    CALL    get/any    make native! [["Retu   [get/any 'thing]                                               0 1     
    RETURN  get/any    unset                  [get/any 'thing]                                               0 1     
    PUSH    none       unset                  [get/any 'thing]                                               0 0     
    EXPR    none       unset                  [get/any 'thing]                                               0 0     
          get/any                                                => unset                                                                                           
    EXIT    none       unset                  [get/any 'thing]                                               0 0     
    ;) at the end stack level is above what's expected:
    END     none       none                   none                                                           0       
    ```

--------------------------------------------------------------------------------

On 2022-08-30T15:27:10Z, dockimbel, commented:
<https://github.com/red/red/issues/5189#issuecomment-1231824186>

    The documentation [says](https://github.com/red/docs/blob/master/en/interp-events.adoc#events):
    > (1) Note that a pair of enter and exit events are generated for any path evaluation (like for other block datatypes).
    
    So, there's an EXIT event missing when the path is resolved as a function call.

