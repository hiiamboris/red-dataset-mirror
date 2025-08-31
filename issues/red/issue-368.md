
#368: Some cell! aliases seem superfluous 
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/368>

I noticed that the structure alias `red-word!` is also used for storing values of type `lit-word!` etc.
On the contrary, values of type `lit-path!` etc. have each their own alias definition, while the content is identical (only discriminated by the datatype ID in the header). Also, `red-path!` is even identical to `red-block!` and `red-paren!` The same goes for `action!`, `native!` and `op!`. 



Comments:
--------------------------------------------------------------------------------

On 2013-01-06T11:07:06Z, dockimbel, commented:
<https://github.com/red/red/issues/368#issuecomment-11927025>

    I add the alias structures based on the needs to use them for arguments types or type casting needs. I will probably add them all for being able to use them for type casting when extending the core library (by me or others).
    
    There is probably a need for higher-level aliases, like `red-any-block!`, `red-any-string!`, `red-any-function!`, `red-any-word!`,...I am waiting for the typeset! type to be implemented to see how I will finally implement these "super-types".

--------------------------------------------------------------------------------

On 2013-01-06T12:06:00Z, meijeru, commented:
<https://github.com/red/red/issues/368#issuecomment-11927519>

    I understand your approach now. Still, it is curious that you haven't had the need yet for `red-lit-word!` etc.

