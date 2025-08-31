
#1784: issue with max, on series
================================================================================
Issue is closed, was reported by mikeparr and has 4 comment(s).
[status.built] [type.bug] [status.reviewed]
<https://github.com/red/red/issues/1784>

Red 0.6  , Win7
Where -    s1: [1 1 1 1]  and s2: [1 1 1 1 1 2]
R2  says that max is s2
Red says that the max is whichever argument is on the left.
( min has not been explored. )



Comments:
--------------------------------------------------------------------------------

On 2016-04-04T10:52:42Z, WiseGenius, commented:
<https://github.com/red/red/issues/1784#issuecomment-205239308>

    > Red says that the max is whichever argument is on the left.
    
    Not always, though. In the following examples, Red behaves identically to Rebol:
    
    ```
    red>> max [1 1 1 1] [1 3 1 1 1 2]
    == [1 3 1 1 1 2]
    red>> max [1 1 1 1 1 2] [1 3 1 1]
    == [1 3 1 1]
    red>> max [1 3 1 1] [1 1 1 1 1 2]
    == [1 3 1 1]
    red>> max [1 3 1 1 1 2] [1 1 1 1]
    == [1 3 1 1 1 2]
    red>> max [1 4 5 8] [2 3 6 7]
    == [2 3 6 7]
    red>> max [2 3 6 7] [1 4 5 8]
    == [2 3 6 7]
    ```
    
    However in this example at least, Red does choose whichever argument is on the left:
    
    ```
    red>> max [1 1 1 1] [1 1 1 1 1 2]
    == [1 1 1 1]
    red>> max [1 1 1 1 1 2] [1 1 1 1]
    == [1 1 1 1 1 2]
    ```
    
    Unlike Rebol:
    
    ```
    >> max [1 1 1 1] [1 1 1 1 1 2]
    == [1 1 1 1 1 2]
    >> max [1 1 1 1 1 2] [1 1 1 1]
    == [1 1 1 1 1 2]
    ```

--------------------------------------------------------------------------------

On 2016-04-04T11:04:56Z, WiseGenius, commented:
<https://github.com/red/red/issues/1784#issuecomment-205245046>

    Likewise with this example, Red's `min` chooses the argument on the **right**:
    
    ```
    red>> min [1 1 1 1] [1 1 1 1 1 2]
    == [1 1 1 1 1 2]
    red>> min [1 1 1 1 1 2] [1 1 1 1]
    == [1 1 1 1]
    ```
    
    Unlike Rebol:
    
    ```
    >> min [1 1 1 1] [1 1 1 1 1 2]
    == [1 1 1 1]
    >> min [1 1 1 1 1 2] [1 1 1 1]
    == [1 1 1 1]
    ```
    
    And these others give the expected results:
    
    ```
    red>> min [1 1 1 1] [1 3 1 1 1 2]
    == [1 1 1 1]
    red>> min [1 1 1 1 1 2] [1 3 1 1]
    == [1 1 1 1 1 2]
    red>> min [1 3 1 1] [1 1 1 1 1 2]
    == [1 1 1 1 1 2]
    red>> min [1 3 1 1 1 2] [1 1 1 1]
    == [1 1 1 1]
    red>> min [1 4 5 8] [2 3 6 7]
    == [1 4 5 8]
    red>> min [2 3 6 7] [1 4 5 8]
    == [1 4 5 8]
    ```

