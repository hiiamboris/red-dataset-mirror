
#459: FIND/LAST/TAIL incorrect for blocks, and chars in strings
================================================================================
Issue is closed, was reported by greggirwin and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/459>

red>>  find/last [1 2 3 4 5 6 3 7 8] 3
== [3 7 8]
red>>  find/last/tail [1 2 3 4 5 6 3 7 8] 3
== [6 3 7 8]
red>> find/last "123456378" #"3"
== "378"
red>> find/last/tail "123456378" #"3"
== "6378"

Looks like /LAST makes it reverse the tail part.



Comments:
--------------------------------------------------------------------------------

On 2013-04-03T10:56:18Z, PeterWAWood, commented:
<https://github.com/red/red/issues/459#issuecomment-15830335>

    I've written up these as test cases. Interestingly:
    
    ```
    find/last/tail "123456378" "3"
    ```
    
    returns "78"

--------------------------------------------------------------------------------

On 2013-04-03T15:20:10Z, greggirwin, commented:
<https://github.com/red/red/issues/459#issuecomment-15842901>

    And this is why I wrote the old test generators for REBOL. Each datatype interaction can be subtly different.

