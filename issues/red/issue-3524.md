
#3524: Stack overflows in current master branch vs. stable release
================================================================================
Issue is closed, was reported by giesse and has 10 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3524>

Stable release:

```
$ red
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> count: 0 f: func [] [count: count + 1 f] f
*** Internal Error: stack overflow
*** Where: f
*** Stack: f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f  

>> count
== 326
```

Master branch:

```
$ ../Red/console 
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> count: 0 f: func [] [count: count + 1 f] f
*** Internal Error: stack overflow
*** Where: f
*** Stack: f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f  

>> count
== 190
```


Comments:
--------------------------------------------------------------------------------

On 2018-08-31T16:16:23Z, giesse, commented:
<https://github.com/red/red/issues/3524#issuecomment-417714710>

    Just for reference:
    
    ```
    REBOL/Core 2.7.6.4.2 (14-Mar-2008)
    
    >> count: 0 f: func [] [count: count + 1 f] f
    ** Internal Error: Stack overflow
    ** Where: f
    ** Near: count: count + 1 f
    >> count
    == 1804
    ```

--------------------------------------------------------------------------------

On 2018-08-31T16:20:53Z, giesse, commented:
<https://github.com/red/red/issues/3524#issuecomment-417715858>

    And:
    
    ```
    Topaz Interpreter - (C) 2011 Gabriele Santilli - MIT License
    >> count: 0 f: func [] [system/words/count: system/words/count + 1 f] f
    *** Internal error: Javascript error: Maximum call stack size exceeded
    *** Stack: f
    [...]
    >> count
    == 2253
    ```

--------------------------------------------------------------------------------

On 2018-09-02T00:08:50Z, endo64, commented:
<https://github.com/red/red/issues/3524#issuecomment-417895864>

    Same as master for simple-gc branch `>> count ; == 190`

--------------------------------------------------------------------------------

On 2018-10-04T03:55:59Z, dockimbel, commented:
<https://github.com/red/red/issues/3524#issuecomment-426877078>

    I will look at the stack depth reduction in master branch, then we can extend the default stack depth to a bigger value.

--------------------------------------------------------------------------------

On 2018-10-05T23:19:29Z, dockimbel, commented:
<https://github.com/red/red/issues/3524#issuecomment-427523321>

    The call stack frame size was extended from 12 to 20 bytes per call, resulting in a reduced number of possible calls.
    
    The stack has been extended by commit: [e2e296476](https://github.com/red/red/commit/3269581fa46efc6cd904a0fd62d7bfde2e296476):
    ```
    >> count: 0 f: func [] [count: count + 1 f] f
    *** Internal Error: stack overflow
    *** Where: +
    *** Stack: f f f f f...
    >> count
    == 1984
    ```

