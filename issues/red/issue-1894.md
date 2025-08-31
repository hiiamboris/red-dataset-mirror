
#1894: collect into undefined_word in parse crashes red
================================================================================
Issue is closed, was reported by xqlab and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1894>

red>> parse [1] [collect into test keep [skip]]

**\* Runtime Error 1: access violation
**\* at: 08063987h



Comments:
--------------------------------------------------------------------------------

On 2016-05-11T10:01:44Z, dockimbel, commented:
<https://github.com/red/red/issues/1894#issuecomment-218415662>

    It will now return an error:
    
    ```
    red>> parse [1] [collect into test keep [skip]]
    *** Script error: PARSE - COLLECT INTO/AFTER expects a series! argument
    *** Where: parse
    ```

