
#57: Node! datatype
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
<https://github.com/red/REP/issues/57>

Read here: https://github.com/red/red/wiki/[PROP]-Node!-datatype


Comments:
--------------------------------------------------------------------------------

On 2019-12-04T12:03:49Z, Oldes, commented:
<https://github.com/red/REP/issues/57#issuecomment-561614692>

    It would be good to see an example, how it should be used. Btw.. `list!` datatype was removed from `Rebol3`, because the internal structures were fragmenting memory. Wouldn't it be same with `node!`?

--------------------------------------------------------------------------------

On 2019-12-04T13:35:50Z, hiiamboris, commented:
<https://github.com/red/REP/issues/57#issuecomment-561648428>

    One of the common usages would be simple tree traversal with `foreach` (towards the leaves) or `foreach/reverse` (towards the root). Here are some real code examples that become trivial one-liners: https://github.com/greggirwin/red-hof/blob/master/code-analysis/while/trees.md 
    
    > because the internal structures were fragmenting memory
    
    I wonder how is this different from just creating and collecting blocks. In any case if fragmentation is expected to be an issue, an implementation should chosen to prevent it.

--------------------------------------------------------------------------------

On 2019-12-04T23:18:44Z, greggirwin, commented:
<https://github.com/red/REP/issues/57#issuecomment-561886127>

    IIRC, a bigger issue with `list!` was that the interface/behavior differed from blocks in ways that made it harder to use correctly.

--------------------------------------------------------------------------------

On 2023-01-30T14:30:48Z, JEROME-TICTEC, commented:
<https://github.com/red/REP/issues/57#issuecomment-1408724710>

    It's kind,
    could we imagine an auto ID for each node, edge (and new one in case of duplicate)
    Just to be able to associate any others "parameters" (tuples)  onto each node edge by ref with this ID.

--------------------------------------------------------------------------------

On 2024-09-10T17:07:51Z, hiiamboris, commented:
<https://github.com/red/REP/issues/57#issuecomment-2341508654>

    @JEROME-TICTEC A node is itself a unique ID (same as objects and series), because it has a unique memory address, so no need. At least if we consider that I don't see how a node could fit into a single cell, this means that it has data on the heap, and that data address is going to be unique.

--------------------------------------------------------------------------------

On 2024-09-13T15:43:14Z, hiiamboris, commented:
<https://github.com/red/REP/issues/57#issuecomment-2349253517>

    Update: added [implementation models descriptions](https://github.com/red/red/wiki/%5BPROP%5D-Node!-datatype#implementation-options)

