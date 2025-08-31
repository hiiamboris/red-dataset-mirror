
#5483: Path may render error message meaningless
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.review]
<https://github.com/red/red/issues/5483>

**Describe the bug**

When evaluated this code does not display the meaning of the error:
```
data: [[1 2 3 4]]
row-order: []
included-rows: [1]
column-order: [1 2 3 4]
included-columns: [1 2]
row: 1 column: 2
:data/(row-order/(included-rows/:row))/(column-order/(included-columns/:column))
```
```
*** Script Error: path :data/(row-order/(included-rows/:row))/(column-order/(included-columns/:column)) 
*** Where: catch
*** Near : :data/(row-order/(included-rows/:row))/()
*** Stack:  
```
Only the path fits in, but not what's wrong.

**Expected behavior**

When molded, error meaning should take priority over code parts (Near field seems to handle that fine).

**Platform version**
`Red 0.6.5 for Windows built 14-Feb-2024/15:03:12+03:00  commit #d3409ba`


Comments:
--------------------------------------------------------------------------------

On 2024-02-17T19:10:44Z, dockimbel, commented:
<https://github.com/red/red/issues/5483#issuecomment-1950286280>

    A quick workaround:
    ```
    >> probe try [:data/(row-order/(included-rows/:row))/(column-order/(included-columns/:column))]
    make error! [
        code: 333
        type: 'script
        id: 'bad-path-type
        arg1: :data/(row-order/(included-rows/:row))/(column-order/(included-columns/:column))
        arg2: none!
        arg3: none
        near: [:data/(row-order/(included-rows/:row))/(column-order/(included-columns/:column))]
        where: 'try
        stack: 76780232
    ]
    ```

