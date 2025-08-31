
#675: Discovery: value! is valid type for routine argument
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/675>

When a routine is defined in Red, the Red types specified for the arguments are converted into RedS types in the generated Intermediate Code by prefixing red-; thus it is acceptable to use value! as an argument type in the routine spec, and treat the argument as of type red-value! in the routine body, even though value! is in itself not a valid Red type.

Question: will this feature remain? If not, it will be sufficient to define a typeset any-type! and to map that onto red-value! ( = cell!).

The same will hold for series!, which can already be used as pseudo-typeset, since red-series! is well-defined.



Comments:
--------------------------------------------------------------------------------

On 2014-02-13T10:13:20Z, dockimbel, commented:
<https://github.com/red/red/issues/675#issuecomment-34964602>

    `value!` is an invalid type specifier and will lead to a compilation error. The android branch already contains a patch for providing support for `any-type!` as a valid routine argument type specification. I have copied that patch to master branch now.

