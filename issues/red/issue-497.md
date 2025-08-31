
#497: DO doesn't evaluate path!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/497>

red>> b: [1]
== [1]
red>> p: 'b/1
== b/1
red>> do p
== b/1



Comments:
--------------------------------------------------------------------------------

On 2016-09-13T04:33:54Z, rebolek, commented:
<https://github.com/red/red/issues/497#issuecomment-246571056>

    This still seems buggy to me:
    
    ## Rebol2
    
    ```
    >> b: [1]
    == [1]
    >> p: 'b/1
    == b/1
    >> do p
    == 1
    ```
    
    ## Red 0.6.1 compiler
    
    Source:
    
    ```
    Red []
    
    b: [1]
    p: 'b/1
    probe do p
    ```
    
    Output:
    
    ```
    E:\Code\red (master)
    λ test
    b/1
    ```
    
    ## Red 0.6.1 interpreter
    
    ```
    red>> b: [1]
    == [1]
    red>> p: 'b/1
    == b/1
    red>> do p
    == false
    ```

--------------------------------------------------------------------------------

On 2018-12-05T11:23:28Z, 9214, commented:
<https://github.com/red/red/issues/497#issuecomment-444452218>

    https://github.com/red/red/issues/3561

