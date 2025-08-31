
#2507: BODY-OF is not defined for vector! values
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2507>

The newest conversion matrices mention BODY-OF vector! as a source for `make/to` with target `any-list!`.
Even though the conversion works,it obviously does not go via `body-of`
```
>> v: make vector! [1 2 3]
>> body-of v
*** Script Error: reflect does not allow vector! for its value argument
>> to block! v
== [1 2 3]  ; OK
```
  


Comments:
--------------------------------------------------------------------------------

On 2018-12-23T21:47:20Z, endo64, commented:
<https://github.com/red/red/issues/2507#issuecomment-449665151>

    Related to #1957 

--------------------------------------------------------------------------------

On 2019-08-20T13:35:42Z, dockimbel, commented:
<https://github.com/red/red/issues/2507#issuecomment-523017861>

    @meijeru The notes in the conversion matrix are just describing the kind of conversion that happens using existing semantics from the language, it does not mean that such conversion methods needs to be actually supported. I could have used `to-block` in order to describe the conversion in the matrix for such case, but I considered that `body-of` was shorter and more generic. It does not mean that `body-of` needs to be supported for such conversion.

