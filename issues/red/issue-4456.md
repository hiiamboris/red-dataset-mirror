
#4456: peculiar rules of ANY-LIST! and OBJECT! comparison
================================================================================
Issue is open, was reported by 9214 and has 2 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/4456>

**Describe the bug**
It is generally assumed that comparison between any given values should yield the same result as a comparison between containers that hold such values. This assumption does not hold in practice for `any-list!` and `object!` values.

**To reproduce**
1. Values inside containers are compared by their datatype IDs: in the example below, `TYPE_PAIR` is lesser than `TYPE_TUPLE` (`37 < 39`); this holds for all datatypes except for `any-word!` and `number!`.
   
     ```red
    >> [1x2] < [3.4.5]
    == true
    >> 1x2 < 3.4.5
    *** Script Error: cannot compare 1x2 with 3.4.5
    *** Where: <
    *** Stack: 
    ```
1. `any-list!` does not implement comparison with `percent!` properly.
    
    ```red
    >> [1] = [100%]
    == false
    >> 1 = 100%
    == true
    ```

**Expected behavior**
The faulty logic can be found in `block!`'s and `object!`'s `compare-each`. I would expect them to not invent bizarre rules and simply follow language semantics.

СС @dockimbel, `block!` / `object!` comparison was a rewrite of Rebol3 and implements such rules so that `sort` can work on them.

**Platform version**
`master`, 053dece4.



Comments:
--------------------------------------------------------------------------------

On 2020-07-09T12:01:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/4456#issuecomment-656086053>

    I find `[x] < [y]` scenario useful when sorting by proxy:
    ```
    data: [1.2.3 4x5 word]
    idxs: [1 2 3]
    sort/compare idxs func [a b] [
        (reduce [:data/:a]) < reduce [:data/:b]
    ]
    ;; rearrange data using idxs
    ;; (data is taken from a pane of faces, and faces can't be sorted efficiently in place)
    ```
    I omitted the gory details. Without this comparison it would be worse:
    ```
    sort/compare idxs func [a b /local s] [
        s: sort reduce [:data/:a :data/:b]
        :s/1 =? :data/:a
    ]
    ```

