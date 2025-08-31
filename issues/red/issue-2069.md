
#2069: unique/skip does compare only first item in skip group instead of whole group
================================================================================
Issue is closed, was reported by ghost and has 4 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2069>

Example:

red>> unique/skip "abcdefabcghijklmnoghi" 3
== "abcdefbcghijklmnohi"

Expected result:
== "abcdefghijklmno"



Comments:
--------------------------------------------------------------------------------

On 2016-06-24T12:10:34Z, qtxie, commented:
<https://github.com/red/red/issues/2069#issuecomment-228329787>

    So in this case (different between Rebol2 and Rebol3): 
    
    ```
    unique/skip "abc1abc2abc3" 3
    ```
    
    Should return:
    
    ```
    == "abc1abc2abc3"
    ```
    
    Right?

--------------------------------------------------------------------------------

On 2016-06-24T15:22:52Z, dockimbel, commented:
<https://github.com/red/red/issues/2069#issuecomment-228375491>

    @qtxie Right, R2's version is buggy.

