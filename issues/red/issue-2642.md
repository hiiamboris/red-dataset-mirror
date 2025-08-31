
#2642: DOC: allowable argument types of routine are constrained by red-<type> structures
================================================================================
Issue is open, was reported by meijeru and has 4 comment(s).
[type.design]
<https://github.com/red/red/issues/2642>

Value slots are addressed in Red/System by "overlays" of struct `cell!` == `red-value!`. The existing structs are given in `%runtime/datatypes/structures.reds`. Red argument types occurring in routine specs are "translated" to Red/System argument types for use in the routine body using a lexical procedure: `<type>` becomes `red-<type>`. This constrains the allowable argument types of routine to the ones for which these `red-<type>` structures exist. The following do not exist: `red-percent! red-lit-word! red-set-word! red-get-word! red-issue! red-map!`. On the other hand, since `red-value!` exists, a Red argument type of `value!` is allowed; it is equivalent of course to `any-type!`. Not so innocent is `float32!` which is compiled without problem because fo the existence of `red-float32!`



Comments:
--------------------------------------------------------------------------------

On 2017-04-29T13:11:40Z, meijeru, commented:
<https://github.com/red/red/issues/2642#issuecomment-298168193>

    To be completely correct: types `integer! logic!` and `float!` are NOT translated. This does not affect the issue.

--------------------------------------------------------------------------------

On 2020-07-30T17:20:18Z, 9214, commented:
<https://github.com/red/red/issues/2642#issuecomment-666540377>

    `red-*` type decoration is done by the compiler during `routine!`'s spec processing; it does not prefix `integer!`, `logic!`, `float!`, and skips local variables. `any-type!` is allowed and is aliased to `red-value!` automagically.
    https://github.com/red/red/blob/9fbddcb3e155f598cd1cc7d1790c245e89bfc9ba/compiler.r#L1132
    The handling of typeset blocks is buggy though, since only the first element in them is processed; typesets like `series`, `any-list!` &c are also not handled adequately.
    ```red
    Red []
    
    foo: routine [
    	bar [none! logic!]
    	qux [series!]
    ][]
    ```
    ```red
    *** Compilation Error: invalid definition for function exec/foo: [
        bar [red/red-none! logic!]
        qux [red-series!]
    ]
    *** in file: %utils/preprocessor.r
    *** at line: 1
    ```
    I think in the scenario above compiler should allow only singleton typeset blocks and report a more meaningful error on encountering a `typeset!` value.

