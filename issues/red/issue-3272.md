
#3272: Make reduce/into and compose/into faster while inserting at the tail
================================================================================
Issue is closed, was reported by DideC and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/3272>

Per @dockimbel comment:

In reduce native implementation, for the /into branch it relies on a full blown insert action, while it will use a low-level append function otherwise. /into is more versatile, as it can insert data anywhere in the target series. **We could add a fast-path if the target series is at tail, to match the speed of the regular reducing. You can open a ticket for it, it should be a quick fix.**

```
size: 10
draw: make block! 3000
dt: function [nb code] [t: now/time/precise  loop nb [do code]  print now/time/precise - t]

dt 100 [clear draw loop 1000 [reduce/into ['circle random size random 20] draw]]
;== 0:00:00.609
dt 100 [clear draw loop 1000 [reduce ['circle random size random 20] draw]]
;== 0:00:00.078
dt 100 [clear draw loop 1000 [compose/into [circle (random size) (random 20)] draw]]
;== 0:00:00.594
dt 100 [clear draw loop 1000 [compose [circle (random size) (random 20)] draw]]
;== 0:00:00.078
```


Comments:
--------------------------------------------------------------------------------

On 2018-03-22T10:34:58Z, dockimbel, commented:
<https://github.com/red/red/issues/3272#issuecomment-375257008>

    In order to maximize the speed for `/into` refinement, you need to ensure that the target block is at tail. So the right testing code is:
    ```
    size: 10
    draw: make block! 3000
    dt: function [nb code] [t: now/time/precise  loop nb code  print now/time/precise - t]
    
    dt 100 [clear draw loop 1000 [reduce/into ['circle random size random 20] tail draw]]
    dt 100 [clear draw loop 1000 [reduce ['circle random size random 20] draw]]
    
    dt 100 [clear draw loop 1000 [compose/into [circle (random size) (random 20)] tail draw]]
    dt 100 [clear draw loop 1000 [compose [circle (random size) (random 20)] draw]]
    ````
    Testing from the console, I get here:
    ```
    >> dt 100 [clear draw loop 1000 [reduce/into ['circle random size random 20] tail draw]]
    0:00:00.081
    >> dt 100 [clear draw loop 1000 [reduce ['circle random size random 20] draw]]
    0:00:00.069
    >> 
    >> dt 100 [clear draw loop 1000 [compose/into [circle (random size) (random 20)] tail draw]]
    0:00:00.08
    >> dt 100 [clear draw loop 1000 [compose [circle (random size) (random 20)] draw]]
    0:00:00.07
    ```
    It show a little bit slower result for `/into` which is caused by extra overhead of the interpreter for processing the refinement and extra argument fetching. If the code gets compiled, such overhead would be eliminated by the compiler, and we should get similar results. Here is the testing code used for the compiled version:
    ```
    size: 10
    draw: make block! 3000
    
    t: now/time/precise 
    loop 100 [clear draw loop 1000 [reduce/into ['circle random size random 20] tail draw]]
    print now/time/precise - t
    
    
    t: now/time/precise 
    loop 100 [clear draw loop 1000 [reduce ['circle random size random 20] draw]]
    print now/time/precise - t
    
    
    t: now/time/precise 
    loop 100 [clear draw loop 1000 [compose/into [circle (random size) (random 20)] tail draw]]
    print now/time/precise - t
    
    t: now/time/precise 
    loop 100 [clear draw loop 1000 [compose [circle (random size) (random 20)] draw]]
    print now/time/precise - t
    ```
    And the results:
    ```
    0:00:00.024
    0:00:00.026
    0:00:00.055
    0:00:00.057
    ```
    That confirms the interpreter's overhead. 
    
    The `/into` option is now faster when the target block is at tail position.

