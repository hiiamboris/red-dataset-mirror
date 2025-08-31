
#1202: Some questions concerning built-in typesets
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
<https://github.com/red/red/issues/1202>

On reviewing the typesets defined in `%environment/scalars.red`, the following questions arise:
- Why is `point!` not occurring in any typeset; it could be in `scalar!`
- In R3, `any-type!` includes `unset!`, in Red it doesn't --- what is the rationale
- The name `immediate!` suggests that the representation contains no pointers. However, for `any-word!` types the representation contains a pointer to context.

Additional questions: 
- the parent type of `vector!` is `string!` but `vector!` is not in `any-string!` --- shouldn't it be?
- `map!` is implemented using the representation structure `red-hash!` but its parent type is not`hash!` --- is there no inheritance to be gained?



Comments:
--------------------------------------------------------------------------------

On 2015-06-07T09:45:02Z, meijeru, commented:
<https://github.com/red/red/issues/1202#issuecomment-109730395>

    I moved these questions to Gitter now.

--------------------------------------------------------------------------------

On 2015-06-07T09:50:34Z, dockimbel, commented:
<https://github.com/red/red/issues/1202#issuecomment-109731362>

    `point!`: it is an internal datatype which should evolve to become truely first class. Currently it has no semantics attached, you can just create one and display it. It has no specific literal format yet. It is used internally in Parse's rules stack and exposed through the `parse/trace` refinement. So, this datatype is a work-in-progress.
    
    `any-type!`: it does, see in %scalar.reds:
    
    ```
    internal!:      make typeset! [unset!]
    ...
    any-type!:      union default! internal!
    ```
    
    `immediate!`: this class of datatypes represents values that can fit in a block cell slot, so that do not require an additional buffer. A word is defined by its symbol ID and a link to a context. Both these properties can fit in a slot, so `any-word!` qualifies for this class.
    
    `vector!`: it inherits many actions from `string!` (so it saves a lot of code duplication), but semantically, it is not a string! (it supports math operations) and does not share the internal auto-scaling storage feature of strings.
    
    `map!`: answered in #1203. 

--------------------------------------------------------------------------------

On 2015-06-07T09:50:52Z, dockimbel, commented:
<https://github.com/red/red/issues/1202#issuecomment-109731375>

    Too late, I already typed the answers here. ;-)

