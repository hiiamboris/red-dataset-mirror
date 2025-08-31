
#39: WISH: more reasonable `collect` for `parse`
================================================================================
Issue is open, was reported by hiiamboris and has 14 comment(s).
<https://github.com/red/REP/issues/39>

Background is here (scroll up): :point_up: [December 18, 2018 4:42 PM](https://gitter.im/red/parse?at=5c18f9634e0d6621ba116f18)

The **rationale** is obvious: if we have a rule `[.... collect [] .... collect [] ...]` we expect collects of the same nesting level appear in the output at the **same nesting level**.

Parse of 0.6.4 does not follow this logic, often producing **undesired results**. Worst case is when `collect into` is followed by an anonymous `collect`. An outer `collect [ ... collect into ... collect ... collect ... ]` saves the day, but the **question** remains - **what to do if it's omitted**?
1) should parse join adjacent untargeted (w/o `into`) collect blocks?
2) should it create an implicit outer collection?
3) should it report an error and let the user be more specific?

Any **arguments** favoring/opposing these 3 options?

Implementation-wise, I don't see no trouble:
- Parse already holds the collection block. And it knows when it was closed (that's why `[collect [keep ...] ... keep ...]` fails saying `keep is used w/o collect` something).
- It does not lose the anonymous collection block after `collect into`: `[collect [A] collect into [B] collect [C]]` returns `[A [B]]`

The only thing that's left is to take an appropriate action when it encounters an anonymous collect while having another previously closed anonymous collection block.




Comments:
--------------------------------------------------------------------------------

On 2018-12-27T20:53:07Z, 9214, commented:
<https://github.com/red/REP/issues/39#issuecomment-450229142>

    So far I encountered two use-cases for `collect`: AST building and data extraction.
    
    As of now, it's a nightmare to use for the former case, especially when recursion comes into play - I always ending up using `copy` with `set` and `(...)` expressions.
    
    In the latter case it is OK for trivial processing, but I'd like to see the ability to, say, `collect` into two series in parallel, or specify what goes there, in what order - again, usually I end up using `copy`, `set` and `(...)` instead.
    
    I'd like to hear @giesse opinion on this, because his Topaz/Parse version handles this very elegantly.

--------------------------------------------------------------------------------

On 2018-12-28T03:58:54Z, dockimbel, commented:
<https://github.com/red/REP/issues/39#issuecomment-450284974>

    @9214 We could use the `/collect` refinement I have proposed to switch entirely the parsing rules into "extracting" mode, the same way Topaz does by default IIRC. Though, it would still give you extractions that follow the tree of parsing rules, so I suspect it would not better than with current nested `collect` for more complex use-cases.

--------------------------------------------------------------------------------

On 2018-12-28T05:30:11Z, giesse, commented:
<https://github.com/red/REP/issues/39#issuecomment-450293075>

    My example on AST building: https://github.com/giesse/red-topaz-parse/blob/master/examples/expression-parser.red
    
    `collect` is not the best answer for that, you really want to be building objects or maps instead.

--------------------------------------------------------------------------------

On 2019-02-13T19:52:56Z, 9214, commented:
<https://github.com/red/REP/issues/39#issuecomment-463343246>

    Copying from internal conversations:
    
    I feel like tree building / walking deserves a dedicated dialect. And, in my naive view, Parse already builds a parse tree at runtime, by matching non-terminals (nodes) and terminals (leafs). 
    
    I also noticed that people are reluctant to use Parse with inline `paren!` expressions and `copy`, `set`, `collect`, `keep`, etc, saying that they prefer their grammar being "pure" and whole AST-building business being separate.
    
    With that in mind, perhaps Parse could return a parse tree (proposed `/collect` refinement?), which then can be walked / pruned with a tree-dialect?

--------------------------------------------------------------------------------

On 2019-02-13T20:47:48Z, giesse, commented:
<https://github.com/red/REP/issues/39#issuecomment-463363279>

    I suspect that would be even more obscure for most people. And, in most cases it would require more code to achieve the same thing.
    
    It should be easy to build a tree from `parse`, we agree; currently it is pretty hard.

--------------------------------------------------------------------------------

On 2019-02-13T20:54:53Z, giesse, commented:
<https://github.com/red/REP/issues/39#issuecomment-463366186>

    Somebody asked how to parse something like "[123[45]67]" the other day - I think that should be easy to do but it isn't currently. I would start with fixing that.

--------------------------------------------------------------------------------

On 2019-02-14T08:03:59Z, 9214, commented:
<https://github.com/red/REP/issues/39#issuecomment-463530442>

    For the reference:
    ```red
    digit: charset [#"0" - #"9"]
    array: ["[" collect any items "]"]
    items: [
        copy match digit keep (load match) 
        | array
    ]
    ```
    
    ```red
    >> parse "[1[22[333]22]1[][[]]]" array
    == [1 [2 2 [3 3 3] 2 2] 1 [] [[]]]
    ```

