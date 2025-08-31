
#2333: make/to string! <block> is not compatible with make/to block! <string>
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.resolved] [type.documentation]
<https://github.com/red/red/issues/2333>

`to block! "1   2" == [1 2]` but `to string! [1   2] == "12"` whereas `form [1   2] == "1   2"` and `make/to string! is in many cases defined in terms of `form`. I plead for conserving the spaces, in spite of incompatibility with R2/R3. Reason: round trip conservation.


Comments:
--------------------------------------------------------------------------------

On 2016-11-17T23:56:20Z, qtxie, commented:
<https://github.com/red/red/issues/2333#issuecomment-261407992>

    Should we forbid those TO conversions?
    
    ```
    to tuple! [1 2 3]                == 1.2.3
    to block! 1.2.3                  == [1.2.3]
    
    to pair! [1 2]                   == 1x2
    to block! 1x2                    == [1x2]
    ```

--------------------------------------------------------------------------------

On 2016-11-18T11:32:41Z, meijeru, commented:
<https://github.com/red/red/issues/2333#issuecomment-261511334>

    Actually, the table says: `to string! [1 2]` should be `form [1 2]` and this is `"1 2"` with spaces preserved. Therefore, the current implementation of `to string! [1 2]` as `"12"` is even wrong, or at least incompatible with the specification in the table!

--------------------------------------------------------------------------------

On 2017-02-20T10:55:27Z, dockimbel, commented:
<https://github.com/red/red/issues/2333#issuecomment-281048675>

    Red is correct in doing `to string! [1 2] == "12"`. The block (or any-list!) represents a list of constituting elements for the target datatype, concatenating them to each other to create the new datatype. The documentation is wrong by describing it as "FORM list", it should be "Concatenate each FORMed value".

