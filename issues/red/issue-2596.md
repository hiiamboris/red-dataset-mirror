
#2596: make vector! <integer>  produces vector of all zeroes instead of an empty one
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[type.review]
<https://github.com/red/red/issues/2596>

With other `series!` types, `make <type> <integer>` just produces an empty series with the prescribed number of components allocated. Only with `vector!`  are the components pre-initialized to zero. 


Comments:
--------------------------------------------------------------------------------

On 2017-04-18T11:56:51Z, meijeru, commented:
<https://github.com/red/red/issues/2596#issuecomment-294806482>

    One more exception: `make image! <pair>` makes a non-empty white image... However, `image!` does not allow `insert`,so that makes sense.

--------------------------------------------------------------------------------

On 2017-04-18T13:27:03Z, meijeru, commented:
<https://github.com/red/red/issues/2596#issuecomment-294843391>

    `make <type> <integer>` yields an empty value for the following composite types: `any-block!`, `any-string!`,  `binary`, `bitset!` and `map!`. If fails for `image!` and `any-object!`, and behaves differently for `vector!`.

--------------------------------------------------------------------------------

On 2017-07-28T15:43:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2596#issuecomment-318688298>

    Same as in Rebol3, you want your vector pre-filled with zeros, so you can write values at different places directly, without any additional construction steps. Will be the same for the future `matrix!` datatype (which could or could not be derivated from `vector!`).

--------------------------------------------------------------------------------

On 2017-07-29T10:54:01Z, meijeru, commented:
<https://github.com/red/red/issues/2596#issuecomment-318820771>

    How do you make a vector of floats which are all zero?? I accept the utility of this facility, but it seems strange that it is available only for the default element type.

--------------------------------------------------------------------------------

On 2019-08-30T16:34:18Z, qtxie, commented:
<https://github.com/red/red/issues/2596#issuecomment-526666888>

    I got a bite by a bug caused by this difference today. Is the need to pre-filled it really stronger than make it consistent with the other series datatypes? IMHO, If someone want it to be pre-filled, they can easily write a simple function to do it. Just one line of code. And I don't the performance would be a problem in this case.

--------------------------------------------------------------------------------

On 2019-08-30T16:38:28Z, 9214, commented:
<https://github.com/red/red/issues/2596#issuecomment-526668097>

    I'd say pre-filling should be handled only with `block!` prototype:
    ```red
    >> make vector! [integer! 32 [1 2 3]]
    == make vector! [1 2 3]
    >> make vector! [percent! 64 3]
    == make vector! [0% 0% 0%]
    ```
    @gltewalt @greggirwin this is not documented in `vector!` spec, FYI.

