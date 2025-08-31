
#2940: make vector! <float> sets element type/size float! 32
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2940>

* `make series! <float>` normally makes an empty series with number of elements reserved equal to the truncated float.
* `make vector! <integer>` makes a vector of integers of size 32 with the required number of elements all set to integer 0
* `make vector! <float>` makes a vector of floats (BTW this is as yet undocumented) with the required number of elements all set to float 0.0  BUT they are of size 32, which is not the default size for floats



Comments:
--------------------------------------------------------------------------------

On 2017-07-29T14:57:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2940#issuecomment-318836384>

    @qtxie Did you choose the `float32!` default affinity because of modern 2D/3D APIs?

--------------------------------------------------------------------------------

On 2017-07-30T01:19:11Z, qtxie, commented:
<https://github.com/red/red/issues/2940#issuecomment-318870723>

    @dockimbel Nope. Actually it should be `integer!` in both cases. The `<float>` will just round to `<integer>`.

--------------------------------------------------------------------------------

On 2017-07-30T04:38:51Z, dockimbel, commented:
<https://github.com/red/red/issues/2940#issuecomment-318877895>

    Ah, yes, you're right, the `make vector! <float> makes a vector of floats` part is wrong.

--------------------------------------------------------------------------------

On 2017-07-30T13:31:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2940#issuecomment-318902112>

    @qtxie 
    ```
    make vector! 2.5
    == make vector! [float! 32 [0.0 0.0]]
    ```
    That is not the right behavior.

