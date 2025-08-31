
#3572: Wrong error message for as object!
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3572>

**Describe the bug**
I naively tried `as object! <error>` which is not allowed, and found the error message misleading. 

**To Reproduce**
Enter `as object! try [1 / 0]` in the console.

**Expected behavior**
`*** Script Error: as does not allow object! for its type argument`

**Screenshots**
`*** Script Error: as does not allow refinement! for its spec argument`

I don't know where the `refinement!` comes from; also `spec` should really be `type`


Comments:
--------------------------------------------------------------------------------

On 2018-12-12T05:51:14Z, dockimbel, commented:
<https://github.com/red/red/issues/3572#issuecomment-446471112>

    Your expectation is wrong, `object!` argument is of type `datatype!`, so allowed as first argument to `as`.
    
    The latest commit returns a correct error message:
    ```
    >> as object! try [1 / 0]
    *** Script Error: as does not allow error! for its spec argument
    *** Where: as
    *** Stack:
    ```

