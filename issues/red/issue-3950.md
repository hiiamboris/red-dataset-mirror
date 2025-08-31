
#3950: MOLD produces invalid bitset
================================================================================
Issue is closed, was reported by giesse and has 4 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/3950>

The output of `mold` for "complemented" bitsets cannot be used to re-create the bitset.

```
>> mold charset "A"
== "make bitset! #{000000000000000040}"
>> do mold charset "A"
== make bitset! #{000000000000000040}

>> mold complement charset "A"
== "make bitset! [not #{000000000000000040}]"
>> do mold complement charset "A"
*** Internal Error: reserved for future use (or not yet implemented)
*** Where: make
*** Stack:  

>> about
Red 0.6.4 for Linux built 27-Jul-2019/12:09:49-10:00
```
(current master branch)


Comments:
--------------------------------------------------------------------------------

On 2019-07-28T10:53:49Z, meijeru, commented:
<https://github.com/red/red/issues/3950#issuecomment-515752565>

    This has nothing to do with `mold`. Try `make bitset! [not #{000000000000000040}]`. And even `make bitset! [#{000000000000000040}]` is not implemented. See the spec document section 5.3.5 for what is allowed inside the spec block.

--------------------------------------------------------------------------------

On 2019-07-28T18:22:31Z, giesse, commented:
<https://github.com/red/red/issues/3950#issuecomment-515783985>

    @meijeru if `[not #{...}]` is not allowed, then clearly `mold` should not generate such output. If it is supposed to be allowed, then this is a bug in `make bitset!` (more likely).
    
    Still, the statement is true that the output of `mold` is not usable right now (which is my problem, since I'm saving code to a file and then trying to load it back).

