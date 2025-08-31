
#2173: Runtime crash on using parse with empty block and rule consists of word!, string!, action!, function!.
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2173>

Parse string! wrong-rule works fine.

```
parse {} [return]
parse {} [parse]
```

And with block! as the input Red crashes:

```
parse [] [return]
parse [] [parse]
parse [] ["why"]
parse [] [red]
parse [] [append]
parse [] [help]
*** Runtime Error 1: access violation
*** at: 000218E5h
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-12T13:36:26Z, rebolek, commented:
<https://github.com/red/red/issues/2173#issuecomment-246349042>

    When compiled, last example (`parse [] [help]`) throws an error. Just the last one, others are ok:
    
    Source:
    
    ```
    Red []
    
    parse [] [return]
    parse [] [parse]
    parse [] ["why"]
    parse [] [red]
    parse [] [append]
    parse [] [help]
    ```
    
    Output:
    
    ```
    E:\Code\red (master)
    λ test
    *** Script Error: PARSE - invalid rule or usage of rule: help
    *** Where: parse
    *** Stack: parse
    ```

