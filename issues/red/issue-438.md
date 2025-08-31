
#438: FOREACH's iterator word doesn't have correct value after loop
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/438>

red>> foreach i [1 2 3] [ ]
red>> i
== none

should be 3



Comments:
--------------------------------------------------------------------------------

On 2013-03-25T18:43:40Z, PeterWAWood, commented:
<https://github.com/red/red/issues/438#issuecomment-15413221>

    This behaviour only differs from that of REBOL in evaluating i to none. REBOL gives a script error.
    
    REBOL 2
    
    ```
    >> foreach i [1 2 3] []
    >> i
    ** Script Error: i has no value
    ** Near: i
    ```
    
    REBOL 3
    
    ```
    >> foreach i [1 2 3] []
    >> i
    ** Script error: i has no value
    ```
    
    Compiling the Red code rather than interpreting it:
    
    ```
    Schulz:Red peter$ ./test
    none
    ```

