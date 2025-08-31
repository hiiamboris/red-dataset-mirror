
#24: Function spec is insufficiently specified
================================================================================
Issue is open, was reported by meijeru and has 28 comment(s).
<https://github.com/red/REP/issues/24>

The order of elements (argument specs, optional argument specs, and return spec(s)) in a function spec block is insufficiently determined -- there is no formal documentation, and the compiler and the intepreter treat this apparently differently, so that a formal spec cannot be derived from there.
The most constraining formulation would be the following:
```
<function> ::=
   make function! [<function-spec> <function-body>]
 | func <function-spec> <function-body>
 | has [<argument>*] <function-body>
 | does <function-body>
 | function <function-spec> <function-body>
<function-spec> ::= [<docstring>° <argument-spec> <return-spec>°]
<docstring> ::= <string>
<argument-spec>  ::= <argument>* <optional-argument>*
<argument> ::=
   <argument-name> <argument-doc>°
 | <argument-name> [<typeset-element>*] <argument-doc>°
<argument-name> ::= <word-literal > | '<word-literal> | :<word-literal>
<argument-doc> ::= <string>
<optional-argument> ::= <refinement> <argument-doc>° <argument>*
<refinement> ::= /<word-literal>
<return-spec> ::= return: [<typeset-element>*]
<function-body> ::= <block>
<typeset-element> ::= <type-name> | <typeset-name>
```
Here ° means optional and * means zero or more, as usual.


Comments:
--------------------------------------------------------------------------------

On 2018-07-10T18:39:47Z, meijeru, commented:
<https://github.com/red/REP/issues/24#issuecomment-403924898>

    I offer the following questions for discussion:
    . should there be a prescribed order as suggested above, and if not, should the order be completely free?
    . should there be at most a single return spec?
    . can the type information, if present, be empty, and if so, does it mean `any-type!` ?

--------------------------------------------------------------------------------

On 2018-07-20T15:30:07Z, hiiamboris, commented:
<https://github.com/red/REP/issues/24#issuecomment-406636234>

    > can the type information, if present, be empty, and if so, does it mean `any-type!` ?
    
    currently it is `default!` not `any-type!`, I suggest it's left like this (`default!` doesn't contain `unset!` and `unset!` can be used to make vararg funcs, which is a bad hack ☺)

--------------------------------------------------------------------------------

On 2018-07-20T16:23:36Z, meijeru, commented:
<https://github.com/red/REP/issues/24#issuecomment-406651839>

    This is noted. Another question for discussion is whether the `/local` refinement must be last or not.

--------------------------------------------------------------------------------

On 2018-09-13T19:32:06Z, 9214, commented:
<https://github.com/red/REP/issues/24#issuecomment-421125411>

    @meijeru I believe it should be:
    ```
    <return-spec> ::= return: [<typeset-element>*] <argument-doc>°
    ```
    
    @greggirwin, worth to extend your [PR](https://github.com/red/red/commit/b1a91e458da84006000fc43ff339fd716b624dae), because [some functions](https://github.com/red/red/blob/master/modules/view/view.red#L855) in Red codebase now appear to have a malformed spec.
    
    ```red
    >> func [return: [] "malformed!"][]
    *** Script Error: invalid function definition: return:
    *** Where: func
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2018-09-14T01:38:59Z, greggirwin, commented:
<https://github.com/red/REP/issues/24#issuecomment-421203488>

    @9214, yes, it makes sense to allow a doc-string for `return:`.

--------------------------------------------------------------------------------

On 2019-01-26T17:11:20Z, meijeru, commented:
<https://github.com/red/REP/issues/24#issuecomment-457847810>

    As a contribution to the discussion: the parse rule for function spec in `%help.red` suggests that (1) refinements and return spec(s) may occur in any order, (2) there may be more than one return spec, and (3) the local refinement must be last. Is this a good interpretation?

--------------------------------------------------------------------------------

On 2019-01-27T16:56:14Z, hiiamboris, commented:
<https://github.com/red/REP/issues/24#issuecomment-457934508>

    (2) More than one `return:` doesn't make any sense to me. In fact it's forbidden by both [R/S compiler](https://github.com/red/red/blob/e7c460382877e749bf7120f8ed77158cec3e4c9c/system/compiler.r#L1267) and [Red compiler](https://github.com/red/red/blob/e7c460382877e749bf7120f8ed77158cec3e4c9c/compiler.r#L1267). Interpreter's logic is [currently a mess](https://github.com/red/red/blob/e7c460382877e749bf7120f8ed77158cec3e4c9c/runtime/datatypes/function.reds#L785) that allows senseless things like this: `f: func [return: [integer!] /x return: [string!]] []` to be considered valid yet as you know it does not accept docstrings for returns, but I don't believe multiple returns are intentional even there.
    
    (1&3) Order of return and locals is only enforced by R/S right now, the other spec formats are orderless by their nature (using `any [...]` block) so these are likely bugs in `help`. I can see two lines of reasoning though:
    - keep these orderless to simplify runtime function composition: i.e. one could add new refinements right to the tail of the spec
    - enforce some order to enforce readability of the spec (return after the mandatory args, locals after other refinements -- I don't think return has to follow all the refinements though!)
    
    Personally I'm more (60 to 40) inclined to support orderlessness.

--------------------------------------------------------------------------------

On 2019-01-27T21:21:28Z, greggirwin, commented:
<https://github.com/red/REP/issues/24#issuecomment-457955421>

    `Help` doesn't currently support multiple `return` specs. The last one wins. 
    
    We should consider the func spec dialect as a work in progress. The basic rules are in place, but advanced and new capabilities need to be considered, as we are discussing here.
    
    A reason to support more than one return is to specify what type may be returned if a given refinement is used. Is that useful enough to support it? If so, the compiler *should* be able to enforce it. It could also collect the various return types and group them for you into a single return typeset.

--------------------------------------------------------------------------------

On 2019-01-28T09:21:49Z, hiiamboris, commented:
<https://github.com/red/REP/issues/24#issuecomment-458052085>

    > A reason to support more than one return is to specify what type may be returned if a given refinement is used. Is that useful enough to support it? If so, the compiler should be able to enforce it
    
    So imagine I declare a function like this:
    ```
    f: func [
       x return: [integer!]
       /s return: [string!]
       /b return: [block!]
       /u return: [unset!]
    ```
    What type will the result of `f/s/b/u 100` be? Typeset from all of its returns?
    It's an interesting idea to consider. But no. I'm not buying it yet. So much complexity... *for what?* Besides, I have a feeling that enforcing this will only be possible by inserting a runtime check into the function code, resulting in extra overhead. Count me as an opponent ☺

--------------------------------------------------------------------------------

On 2019-01-28T19:48:53Z, greggirwin, commented:
<https://github.com/red/REP/issues/24#issuecomment-458275275>

    Great example. For my part, I am good with keeping things simple here, because the user can always spec the type and put notes in the code. If we want to change that in the future, nothing breaks. And if we want a strict language, make it a dialect.

--------------------------------------------------------------------------------

On 2020-02-01T12:36:51Z, hiiamboris, commented:
<https://github.com/red/REP/issues/24#issuecomment-581026293>

    I'm wondering if Red is going to support the attributes block, like REBOL did, e.g. `func [[throw] x y] [...]`, or is there another design planned for this.

--------------------------------------------------------------------------------

On 2020-08-05T14:35:02Z, 9214, commented:
<https://github.com/red/REP/issues/24#issuecomment-669230016>

    Worth addressing in function spec's (re)-design:
    ```red
    >> has ['x :y][]
    == func [/local 'x :y][]
    >> func [/local 'x :y][]
    == func [/local 'x :y][]
    ```
    This doesn't affect semantics in any way, and words with the same symbols are counted as locals.

--------------------------------------------------------------------------------

On 2020-08-06T04:30:45Z, dander, commented:
<https://github.com/red/REP/issues/24#issuecomment-669678026>

    I've noticed that some function specs include the (incredibly useful) signature for `function!` args, but it's not currently possible to create a `function!` using the same spec. Maybe only red/system supports it currently?
    
    ```red
    >> function probe spec-of :parse []
    ["Process a series using dialected grammar rules" 
        input [binary! any-block! any-string!] 
        rules [block!] 
        /case "Uses case-sensitive comparison" 
        /part "Limit to a length or position" 
        length [number! series!] 
        /trace 
        callback [function! [
            event [word!] 
            match? [logic!] 
            rule [block!] 
            input [series!] 
            stack [block!] 
            return: [logic!]
        ]] 
        return: [logic! block!]
    ]
    *** Script Error: invalid type specifier: event word! match? logic! rule block! input series! stack block! return logic!
    *** Where: function
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2020-09-24T18:15:24Z, hiiamboris, commented:
<https://github.com/red/REP/issues/24#issuecomment-698505880>

    https://github.com/red/red/pull/4347#issuecomment-697303029

