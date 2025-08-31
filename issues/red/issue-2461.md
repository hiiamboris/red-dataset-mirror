
#2461: Runtime Error when `make email!` passed a wrong value
================================================================================
Issue is closed, was reported by ghost and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2461>

(1)
```
red>> make email! 1
== 
red>> 
```
This gives empty value. I think, this should give an error?
  
(2) Huge integer value crashes with 
```
red>> make email! 11111111111111

*** Runtime Error 1: access violation
*** at: FFFFFFFFh
```


Comments:
--------------------------------------------------------------------------------

On 2017-03-03T14:50:33Z, dockimbel, commented:
<https://github.com/red/red/issues/2461#issuecomment-283972991>

    `make <series!> <integer!>` creates an empty series of that type with preallocated size given by the integer.  So, (1) is what is expected (same as in Rebol).
    
    (2) seems to be missing an error catching for trying to reserve more memory than possible.

--------------------------------------------------------------------------------

On 2017-03-03T14:52:25Z, ghost, commented:
<https://github.com/red/red/issues/2461#issuecomment-283973528>

    Oh, I didn't know that. Sorry 😄 
    Just checked it... Thanks for the explanation.
      
    The (2) crash happens for `make string!` as well, and probably for other types as well.

--------------------------------------------------------------------------------

On 2017-03-03T15:44:13Z, meijeru, commented:
<https://github.com/red/red/issues/2461#issuecomment-283988068>

    In a previous version (20-Feb-2017) the error message for a too big integer is:
    ```
    *** Script Error: value out of range: none
    *** Where: make
    ```
    and this for file!, email! and url! as well as string!
     

--------------------------------------------------------------------------------

On 2017-03-03T16:10:28Z, dockimbel, commented:
<https://github.com/red/red/issues/2461#issuecomment-283995554>

    Now it will error out properly:
    ```
    red>> make email! 11111111111111
    *** Script Error: value out of range: 11111111111111.0
    *** Where: make
    ```

--------------------------------------------------------------------------------

On 2017-03-03T16:11:34Z, dockimbel, commented:
<https://github.com/red/red/issues/2461#issuecomment-283995811>

    More work is required for catching "out of memory" cases when allocating (big) series.

