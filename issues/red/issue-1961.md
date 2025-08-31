
#1961: Wish: SWAP to be defined on vector! values
================================================================================
Issue is open, was reported by meijeru and has 4 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/1961>

Again, is there perhaps a reason why it isn't already?



Comments:
--------------------------------------------------------------------------------

On 2016-06-17T06:42:48Z, dockimbel, commented:
<https://github.com/red/red/issues/1961#issuecomment-226692876>

    Yes, it needs to be implemented, series/swap is not designed to support vector! values.

--------------------------------------------------------------------------------

On 2016-06-17T07:51:39Z, meijeru, commented:
<https://github.com/red/red/issues/1961#issuecomment-226704196>

    I consulted the source and it seems that series/swap is not used by any other type. There is string/swap inherited by file! and url!, and block/swap inherited by the other block/like types. Also, series/swap is not registered in the action table.
    Now, given that vector!'s parent is string!, can't vector/swap be inherited from string/swap?

