
#133: Argument passing: clarification required
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/133>

Short of looking into the details of the compiler, I cannot answer the following question: when passing a value as actual argument to a function, where the type of the formal argument is `struct![...]`, does the type of the actual argument have to be completely identical, i.e. including the names of the fields, or can the field names be different as long as the field types correspond one by one? The same question when the actual argument is a function: I suppose the return value must be of the same type, but do the argument names have to be the same, or only the argument types (locals do not enter in to the picture I suppose). 



Comments:
--------------------------------------------------------------------------------

On 2011-07-11T15:13:38Z, dockimbel, commented:
<https://github.com/red/red/issues/133#issuecomment-1547162>

    If I remember correctly, the field names can be different as long as the field types correspond one by one. Same for a function passed as argument. I would need to confirm that by having a deeper look in the code (probably when I will come back home, I am currently at RMLL2011 in Strasbourg).

--------------------------------------------------------------------------------

On 2011-07-13T15:25:08Z, dockimbel, commented:
<https://github.com/red/red/issues/133#issuecomment-1563533>

    After having a closer look at the argument type checking code in the compiler, I need to correct my previous answer:
    - Struct members needs to be strictly the same, both names and types have to match (%compiler.r, line 787, `expected = type`). It could be made to match only types, but at the expense of more code and much slower performances.
    - Function! passed as argument do not use the same routine for comparing, it relies on `compare-func-specs`, so callback function arguments can have _different_ names than the one defined in the caller specification block (%compiler.r, line 668, `type <> c-type/:idx`). However, if a struct! is passed as argument in the callback function specification, the struct members names have to _match_ the field names defined in the caller specification block (because of the simple inequality check at line 668).
    
    Hope this helps.

--------------------------------------------------------------------------------

On 2011-07-13T17:16:08Z, meijeru, commented:
<https://github.com/red/red/issues/133#issuecomment-1564396>

    It certainly does. I will update my description in the BNF grammar.

