
#613: Empty bitset! has length 8
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/613>

red>> length? charset []
== 8

R3:

> > length? charset []
> > == 0



Comments:
--------------------------------------------------------------------------------

On 2013-12-18T15:23:53Z, dockimbel, commented:
<https://github.com/red/red/issues/613#issuecomment-30849936>

    The bitset creation allocates the required number of bits rounded to the upper byte limit. **length?** returns the size of the allocated storage which is 8 bits for an empty charset. 

--------------------------------------------------------------------------------

On 2013-12-19T00:11:55Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/613#issuecomment-30894436>

    I understand where it comes from, but R3 made the empty case elegant and consistent with other types.

--------------------------------------------------------------------------------

On 2013-12-19T15:15:08Z, dockimbel, commented:
<https://github.com/red/red/issues/613#issuecomment-30936021>

    As mentioned in #614, bitset! is not a really a series! datatype in R3 (as in Red). I'm still not getting why **empty?** support is even needed for bitset!, but Carl did not mentioned the use-case(s) he had in mind anywhere...so it remains a mystery to me.
    
    **empty?** is really ill-defined in R3 for bitsets, visit these links to see by yourself (beware of headaches ;-)):
    - [Behavior change from Rebol 2 to Rebol 3 for empty BITSET! testing; how to test EMPTY?](http://stackoverflow.com/questions/13453209/behavior-change-from-rebol-2-to-rebol-3-for-empty-bitset-testing-how-to-test-e)
    - [EMPTY? does not return true if no bits are set in BITSET! values](http://curecode.org/rebol3/ticket.rsp?id=1353)
    - **empty?** function help string: "Returns TRUE if empty or NONE, or _for series if index is at or beyond its tail._"
    
    Remember that bitsets have no head, nor tail, nor index position.

--------------------------------------------------------------------------------

On 2013-12-20T18:36:51Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/613#issuecomment-31031238>

    I agree that the implementation of this feature in R3 is buggy, but I don't think that's a reason to reject the feature.
    
    My use case for it is in #614.
    
    I'm not asking for series! iteration, I solved that myself, and your proposed range! type would make it less awkward. However, empty? detection would be costly to implement manually.

--------------------------------------------------------------------------------

On 2014-02-13T13:40:03Z, dockimbel, commented:
<https://github.com/red/red/issues/613#issuecomment-34978287>

    I am closing this ticket as it ends up being a duplicate of #614.

