
#3868: sort does not implement the /compare refinement with a block! argument
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.deferred] [type.wish]
<https://github.com/red/red/issues/3868>

**Describe the bug**
`sort` has a `/compare` refinement which allows a `block!`  argument, presumably to be used with a block-like value (to be sorted as records on multiple components), and listing the indexes of the record components in the order they are to be sorted (major to minor) -- this is how it works in REBOL, at least. In Red, the `block!` argument is allowed in the spec, but it is not implemented.
**To reproduce**
```
>> b: [1 c 3 a 2 a 4 f 4 d]
>> sort/skip/compare b 2 [2 1]
*** Script Error: invalid /compare argument: [2 1]
```
**Expected behavior**
```
== [2 a 3 a 1 c 4 d 4 f]
```
**Screenshots**
**Platform version (please complete the following information)**
```
All
```



Comments:
--------------------------------------------------------------------------------

On 2019-05-14T12:38:46Z, dockimbel, commented:
<https://github.com/red/red/issues/3868#issuecomment-492219630>

    This is a feature that has not been implemented. IIRC, the semantics were not clearly documented in Rebol, so we have to define them properly for Red first.
    
    So, I will close this ticket, as it's about a planned feature that we didn't implement yet. Feel free to open a REP for it, or a wiki page to propose some semantics for it.

--------------------------------------------------------------------------------

On 2019-05-14T21:02:52Z, meijeru, commented:
<https://github.com/red/red/issues/3868#issuecomment-492408632>

    I have several old REBOL applications using this, and will try to define the semantics in a REP. But until those semantics have been defined, accepted and implemented, the spec should omit `block!` for the `/compare` argument. We want the specs for all built-in functions to be as helpful as possible, and not lead to misunderstandings.

