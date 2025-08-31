
#333: Why are comparison operators in Red natives, not actions?
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/333>

While attempting to document natives and actions, I was struck by the fact that arithmetic operators (`add` etc.) are actions, whereas comparison operators (`equal?` etc.) are natives, which are translated into calls to `natives/equal?*` etc. Each of these dispatches to a call of `natives/compare`, which in its turn calls `actions/compare` which performs the actual comparison by calling on the `compare` function of the appropriate type. This seems a bit roundabout. Or have I missed a subtlety?



Comments:
--------------------------------------------------------------------------------

On 2012-12-10T14:29:47Z, dockimbel, commented:
<https://github.com/red/red/issues/333#issuecomment-11196189>

    I understand your questioning about that approach. The underlying motivation is trying to keep the number of actions low as they are quite costly (in terms of additional code size for each new action). So, packing all comparison operators into a single action seems like a good move. About consistency with math operations, I agree that they could have been "packed" in the same way, but REBOL does not do that, so they might be some advantage doing so that I have not yet met. I tried to prevent future deep changes, but so far, I do not see any advantages of having separate actions for math operators. I guess we should just wait a bit for R3 sources to be released to check if there is a good reason for having math operators as separate actions and change it in Red accordingly.
    
    However, there is one change that could be done right now for better consistency, the `native/compare` is in fact playing the role of `actions/compare*`, so it should be moved to actions (this implementation was preceding the split of actions between Red-stack arguments passing functions (names with `*` suffix) and native-stack arguments passing functions (names with no suffix).

--------------------------------------------------------------------------------

On 2014-04-26T21:35:02Z, dockimbel, commented:
<https://github.com/red/red/issues/333#issuecomment-41481634>

    A fix has been done to clean-up a bit the COMPARE action by moving the relevant code from %natives.reds to %actions.reds.
    
    Still, the math operations are kept as separate actions for now, as it is not excluded that for some future datatypes, we might want to implement a subset of the math actions only, and not all of them. That is already the case for the bitwise action AND, OR, XOR which are relying on the same underlying code for integer! and char!. However, for the upcoming binary! datatype, they will be implemented specifically, but the arithmetic operators will be disabled.
    
    OTOH, we need the COMPARE action to be implemented for all datatypes as we need it for SORT and set operations.

