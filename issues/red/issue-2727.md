
#2727: Wish: `reflect` on op! made out of function! values 
================================================================================
Issue is closed, was reported by geekyi and has 10 comment(s).
[type.wish]
<https://github.com/red/red/issues/2727>

Note: For `op!`s made from *Red* `function!`s only (which has source available), not for *RS* values

## Expected
The same value you would get from doing `body-of` or `source` on the original function

## Actual
```red
>> body-of :~
*** Internal Error: reserved for future use (or not yet implemented)
*** Where: reflect
>> source ~
Sorry, ~ is an op! so source is not available
```


Comments:
--------------------------------------------------------------------------------

On 2017-06-01T18:45:19Z, meijeru, commented:
<https://github.com/red/red/issues/2727#issuecomment-305584065>

    Could also work for ops made out of routines (see recent addition to help).

--------------------------------------------------------------------------------

On 2017-06-03T12:28:42Z, meijeru, commented:
<https://github.com/red/red/issues/2727#issuecomment-305972100>

    The flag to be tested in the `header` field of the `red-op!` structure is `800000h` (bit 23,called `node-body`, see `%runtime/allocator.reds`).  Curiously, it does NOT make a difference between function and routine bodies.

--------------------------------------------------------------------------------

On 2017-06-03T18:52:12Z, meijeru, commented:
<https://github.com/red/red/issues/2727#issuecomment-305994320>

    If it is important to know the difference between function and routine body (for a comment/warning to say "routine body is in R/S"): the `code` field of the `red-op!` structure points to a `more` structure which has a `fun` field which points to a `red-function!` OR a `red-routine!` structure.
     

--------------------------------------------------------------------------------

On 2017-06-04T18:30:03Z, meijeru, commented:
<https://github.com/red/red/issues/2727#issuecomment-306057961>

    This is the routine that implements the flag tests mentioned in the previous comments:
    ```
    base-type: routine [
    	{determine type of prefix function that op is derived from} 
    	op [op!]
    	return: [integer!]
    	/local node ser more fun res
    ][
    	either op/header and body-flag <> 0
    	[
    		node: as node! op/code
    		ser: as series! node/value
    		more: ser/offset
    		fun: as red-function! more + 3
    		res: TYPE_OF(fun) ; TYPE_FUNCTION or TYPE_ROUTINE
    	][
    		either op/header and flag-native-op <> 0
    		[
    			res: TYPE_NATIVE
    		][
    			res: TYPE_ACTION
    		]
    	]
    	res
    ]
    ```
    
    Our motto: code/more/fun :smile:

--------------------------------------------------------------------------------

On 2018-04-25T06:16:02Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2727#issuecomment-384172288>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

