
#1051: WORDS-OF shows a wrong result.
================================================================================
Issue is closed, was reported by JerryTsai and has 10 comment(s).
<https://github.com/red/red/issues/1051>

book: object [
    title: none
    author: none
    list-fields: does [
        words-of self
    ]
]
print book/list-fields

; The result is:
; none none title author list-fields



Comments:
--------------------------------------------------------------------------------

On 2015-03-09T13:32:32Z, qtxie, commented:
<https://github.com/red/red/issues/1051#issuecomment-77853235>

    It is the same as in R3:
    
    ```
    >> book: object [title: none author: none list-fields: does [words-of self]]
    >> print book/list-fields
    none none title author list-fields
    ```
    
    `words-of book` will return a block `[title author list-fields]`. Since PRINT will evaluate the words in a block, the result is OK I think.

--------------------------------------------------------------------------------

On 2015-03-09T15:28:49Z, JerryTsai, commented:
<https://github.com/red/red/issues/1051#issuecomment-77875423>

    I think qtxie is right. It's not a bug.

--------------------------------------------------------------------------------

On 2015-03-09T15:35:12Z, dockimbel, commented:
<https://github.com/red/red/issues/1051#issuecomment-77876821>

    Indeed, closing the ticket.
    
    @PeterWAWood Please delete the corresponding unit test.

--------------------------------------------------------------------------------

On 2015-03-09T21:59:43Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1051#issuecomment-77952719>

    @dockimbel I believe that the tests are valid (though perhaps I have made a mistake).The tests do not evaluate the block returned by words-of only compare it with the expected block.

--------------------------------------------------------------------------------

On 2015-03-10T13:11:52Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1051#issuecomment-78049552>

    @dockimbel I have corrected two mistakes in words-of-test.red. The tests now pass.

