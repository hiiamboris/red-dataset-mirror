
#4537: /LOCAL refinement injected by function constructors is malformed
================================================================================
Issue is closed, was reported by 9214 and has 30 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/4537>

**Describe the bug**
`has` and `function` inject `/local` refinement into constructed function's spec. Such refinement is an `all-word!` value, and, in theory, must be bound to a context, which turns out not to be true on practice.

**To reproduce**
Any of the examples below:
```red
get first spec-of has [foo][]
get first spec-of function [][foo:]
```
Results in:
```red
*** Runtime Error 1: access violation
*** in file: .../red/runtime/datatypes/context.reds
*** at line: 325
***
***   stack: red/_context/get 02C8A414h
***   stack: red/natives/get* false -1 -1
...
```

Because context node is `null`.

**Expected behavior**
I expect function's refinements (including `/local`) to be bound to either global context or function's context.

**Platform version**
4d864b1d



Comments:
--------------------------------------------------------------------------------

On 2020-06-22T18:28:19Z, greggirwin, commented:
<https://github.com/red/red/issues/4537#issuecomment-647698392>

    This is interesting, and a deep, fundamental question. _Do_ words have to be bound to a context, or can words _not_ be bound, meaning they are only ever interpretable as literal data? `/Local` is certainly more in the function's context than global, but also in a sort of limbo as it's just a marker. The next question is what `get /local` should return? What do you expect in this case?

--------------------------------------------------------------------------------

On 2020-06-22T18:30:27Z, greggirwin, commented:
<https://github.com/red/red/issues/4537#issuecomment-647699377>

    I certainly agree that it shouldn't crash though.

--------------------------------------------------------------------------------

On 2020-06-22T18:59:44Z, meijeru, commented:
<https://github.com/red/red/issues/4537#issuecomment-647714191>

    Compare this to `return:` which serves a comparable function to `/local`, and which does not have this problem. Still, the design choice has been made to have a `refinement!` value for the "local variable indicator". Therefore I think that `/local` as injected by `has` and `function` should be bound to the same context as when it is specified explicitly by the user (i.e. not "injected"), thus the global context.

--------------------------------------------------------------------------------

On 2020-06-22T19:37:18Z, greggirwin, commented:
<https://github.com/red/red/issues/4537#issuecomment-647730927>

    Excellent point on `return:` @meijeru. However, `/local` is not global when used manually. Not in the same way as `return` anyway.
    ```
    >> get first spec-of func [/local x][]
    *** Script Error: local has no value
    *** Where: get
    *** Stack:  
    
    >> get first spec-of func [return: [string!]][]
    == make native! [["Returns a value from a function" 
        value [any-type!]
    ]]
    ```
    
    As a note, refinements are part of `all-word!`, not `any-word!`, making them more like issues. e.g. you can't `set` a refinement. Thus `get/set` do not mirror each other here. You are correct in `local` being bound globally discounting being able to set it as a refinement.

--------------------------------------------------------------------------------

On 2020-06-22T19:43:09Z, meijeru, commented:
<https://github.com/red/red/issues/4537#issuecomment-647733261>

    Your `get first spec-of ...` does not prove the non-globality. It is difficult to determine the context of a refinement, since `context?` does not admit a `refinement!` value as argument. If you do `context? to-word first spec-of...` you get the global context.

--------------------------------------------------------------------------------

On 2020-06-22T20:07:44Z, greggirwin, commented:
<https://github.com/red/red/issues/4537#issuecomment-647743586>

    True, but you have to use `to word!` because `context?` also doesn't support refinements.
    
    Let me refine my statement: Do _refinements_ and _issues_ (and potentially other non-any-word! types) have to be bound to a context, or can they not be bound and considered only literal data?

--------------------------------------------------------------------------------

On 2020-06-22T20:18:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4537#issuecomment-647748222>

    Keep it simple approach tells me that they have to. To not spawn special cases.

--------------------------------------------------------------------------------

On 2020-06-22T20:20:05Z, 9214, commented:
<https://github.com/red/red/issues/4537#issuecomment-647748918>

    `any-word!` contains values that have bindings, `all-word!` adds on top of that values that do not explicitly have them (or rather cannot be re-bound by user).
    ```red
    >> exclude all-word! any-word!
    == make typeset! [refinement! issue!]
    ```
    In practice this is not followed strictly, since some natives accept refinements as if they are words referring to values.
    ```red
    >> foo: 'bar
    == bar
    >> get /foo
    == bar
    ```
    Internally both `issue!` and `refinement!` have a binding:
    ```red
    >> find mold words-of system/words "abracadabra"
    == none
    >> #abracadabra
    == #abracadabra
    >> find mold words-of system/words "abracadabra"
    == "abracadabra]"
    >> context? to word! to issue! bind 'foo context [foo: 'bar] 
    == make object! [
        foo: 'bar
    ]
    >> system/words = context? to word! first spec-of func [/local][]
    == true
    ```
    
    `get` accepts refinements, `set` does not. So, perhaps `get` should be forbidden on them, since they do not belong to `any-word!` typeset. It's not a question of implementation, but of the interface. All symbolic values should be bound to a context, and context node should be a reasonable default (`global-ctx`), not `null` — but only a selected few of them should permit access to/thru it.

--------------------------------------------------------------------------------

On 2020-06-22T20:24:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/4537#issuecomment-647750961>

    Yes. And let's not forget that `to word! to refinement! word` should be lossless.

--------------------------------------------------------------------------------

On 2020-09-22T16:56:53Z, dockimbel, commented:
<https://github.com/red/red/issues/4537#issuecomment-696849177>

    Refinements and issues are strictly symbolic, they should not be bound. `get` should error out on them.
    
    > And let's not forget that to word! to refinement! word should be lossless.
    
    No, refinements and words have different syntactic rules. The starting `/` can be followed by any valid word character (including digits).

--------------------------------------------------------------------------------

On 2020-09-24T18:05:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/4537#issuecomment-698500991>

    > No, refinements and words have different syntactic rules. The starting `/` can be followed by any valid word character (including digits).
    
    @dockimbel Which reminds me of the unresolved design issue https://github.com/red/red/issues/650

--------------------------------------------------------------------------------

On 2020-10-06T12:18:19Z, 9214, commented:
<https://github.com/red/red/issues/4537#issuecomment-704229599>

    @dockimbel I've updated `get` in https://github.com/red/red/pull/4594/ and resolved merge conflicts. It's ready to go.

--------------------------------------------------------------------------------

On 2020-10-09T16:48:08Z, dockimbel, commented:
<https://github.com/red/red/issues/4537#issuecomment-706288614>

    `refinement!` has been removed from possible `get` argument types, so that the crash is now gone and an error is properly reported:
    ```
    >> get first spec-of has [foo][]
    *** Script Error: get does not allow refinement! for its word argument
    *** Where: get
    *** Stack:  
    
    >> get first spec-of function [][foo:]
    *** Script Error: get does not allow refinement! for its word argument
    *** Where: get
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2020-10-09T16:52:17Z, 9214, commented:
<https://github.com/red/red/issues/4537#issuecomment-706290677>

    @dockimbel I've made the same change in the above-mentioned PR 3 days ago and updated the respective tests.

--------------------------------------------------------------------------------

On 2020-10-09T16:54:33Z, dockimbel, commented:
<https://github.com/red/red/issues/4537#issuecomment-706291767>

    The PR is making other unnecessary changes on refinements `ctx` field.

