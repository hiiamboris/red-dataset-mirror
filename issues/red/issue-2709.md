
#2709: vectors divided by char give divergent results
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2709>

The error on vector of integer is off the mark. The result with vectors of float and percent is not understandable.
```
>> v: make vector! [1 2 3]
== make vector! [1 2 3]
>> v / #"^B"
*** Math Error: attempt to divide by zero
*** Where: /   ;; there is no zero in sight!!
>> v: make vector! [1.0 2.0 3.0]
== make vector! [1.0 2.0 3.0]
>> v / #"^B"
== make vector! [1.#INF 1.#INF 1.#INF]
>> v: make vector! [100% 200% 300%]
== make vector! [100% 200% 300%]
>> v / #"^B"
== make vector! [1.#INF 1.#INF 1.#INF]
```



Comments:
--------------------------------------------------------------------------------

On 2017-05-23T08:43:09Z, meijeru, commented:
<https://github.com/red/red/issues/2709#issuecomment-303331801>

    on second thought, the `1.#INF` result may also be a division by zero... But the `char!` value is 2, not 0...

--------------------------------------------------------------------------------

On 2017-06-07T11:54:20Z, dockimbel, commented:
<https://github.com/red/red/issues/2709#issuecomment-306772190>

    Those operations with vectors and chars are not yet implemented. A proper message is displayed now.

