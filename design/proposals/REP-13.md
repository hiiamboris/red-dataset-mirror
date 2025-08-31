
#13: WISH: possibility to make a vector of non-integer values, pre-filled with zeroes
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[Wish]
<https://github.com/red/REP/issues/13>

This is related to Red issue red/red#2596, now closed.

With other `series! types` except `image!`, `make <type> <integer>` just produces an empty series with the prescribed number of elements allocated. Only with `vector!` are the elements initialized to integer zeroes. The utility of this has been forcefully argued, and that I accept. But it seems strange that the same possibility is not offered for vectors with elements of `float!` or `percent!` type, or even `char!` type for that matter.

A more general approach could be to provide some flexible initialisation spec for vectors. 


Comments:
--------------------------------------------------------------------------------

On 2019-01-22T22:19:48Z, Oldes, commented:
<https://github.com/red/REP/issues/13#issuecomment-456585420>

    @meijeru I believe this is already implemented (if I understand your request well)
    ```
    >> make vector! [float! 32 4]
    == make vector! [float! 32 [0.0 0.0 0.0 0.0]]
    >> make vector! [float! 64 4]
    == make vector! [0.0 0.0 0.0 0.0]
    >> make vector! [char! 16 4]
    == make vector! [char! 16 [#"^@" #"^@" #"^@" #"^@"]]
    ```

--------------------------------------------------------------------------------

On 2019-01-23T21:42:20Z, meijeru, commented:
<https://github.com/red/REP/issues/13#issuecomment-456977500>

    I stand corrected, and will (1) withdraw this REP and (2) correct the specs document I am responsible for.

