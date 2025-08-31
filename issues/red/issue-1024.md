
#1024: Feature Request: Blocks as Keys
================================================================================
Issue is closed, was reported by JacobGood1 and has 4 comment(s).
<https://github.com/red/red/issues/1024>

Since strings can be used as keys and they are mutable could we also have blocks as keys?

m: map [[1 2] [3 4]]
m/[1 2] => [3 4]



Comments:
--------------------------------------------------------------------------------

On 2015-01-30T23:20:12Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1024#issuecomment-72287979>

    Work has yet to start of the map! datatype.
    
    Please could you make a proposal on the [wiki](https://github.com/red/red/wiki) for this feature.

--------------------------------------------------------------------------------

On 2015-01-31T00:44:17Z, dockimbel, commented:
<https://github.com/red/red/issues/1024#issuecomment-72295185>

    You already can use block as keys, but the syntactic form you are asking for is not planned to be supported. Also as Peter pointed out, there is no `map` in Red yet.
    
    ```
    red>> blk: [[1 2][3 4]]
    == [[1 2] [3 4]]
    red>> select/only blk [1 2]
    == [3 4]
    ```

