
#820: Missing space beside a SPACE item when print a block with SPACEs in it
================================================================================
Issue is closed, was reported by WayneCui and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/820>

This occurs with both the interpreter and compiler, tested on Windows 7 and CentOS 6.5:

```
print [1 2 3]
print [1 space 3]
print [1 space space 3]
;output
1 2 3
1  3
1   3
```

In Rebol 3:

```
print [1 2 3]
print [1 space 3]
print [1 space space 3]
;output
1 2 3
1   3
1     3
```

Same with " " (in Red):

```
print [1 2 3]
print [1 " " 3]
print [1  " "  " " 3]
;output
1 2 3
1  3
1   3
```



Comments:
--------------------------------------------------------------------------------

On 2014-05-20T07:20:46Z, qtxie, commented:
<https://github.com/red/red/issues/820#issuecomment-43593696>

    @WayneTsui Rethinking this issue,  maybe Rebol3's behavior is not that correct.
    Assume we just want two spaces between 1 and 3, how can we do it ?
    
    When we do `print [1 tab 3]`, we get:
    
    ```
    >> print [1 tab 3]
    1   3                      ;-- only one tab between 1 and 3, no space.
    ```
    
    So I think when we `print [1 space 3]`, we should print just 1 space between 1 and 3.
    
    ```
    >> print [1 space 3]
    1 3                        ;-- expected result. just one space.
    ```
    
    @WayneTsui @dockimbel What do you think ?

--------------------------------------------------------------------------------

On 2014-05-21T09:10:37Z, dockimbel, commented:
<https://github.com/red/red/issues/820#issuecomment-43731635>

    The use case `[1 space 3]` is not a common case (spacing is implied when printing a block), so I think we should privilege consistency and emit spaces around like Rebol3 does. For the 2 spaces case, you can always use the `[1 "" 3]` form. When FORM action was first implemented for blocks, I tried to improve the whitespace handling introducing an exception, but I think that consistency should win in this case.

--------------------------------------------------------------------------------

On 2014-05-24T13:49:36Z, earl, commented:
<https://github.com/red/red/issues/820#issuecomment-44087767>

    I agree that the simpler rule "always inject one space between elements", which favours consistency over another exception, is the better choice. Collapsing repeated sequences of a particular element into a single occurence of that element is better left for a separate function (maybe call it `squeeze`?).

--------------------------------------------------------------------------------

On 2014-06-10T07:01:32Z, dockimbel, commented:
<https://github.com/red/red/issues/820#issuecomment-45580106>

    I will proceed with the changes mentioned above. The rule for spacing will be applied more strickly in Red than Rebol:
    
    Rebol:
    
    ```
    >> form [[""] [a] [] [a] [[[]]]]
    == "a  a "
    ```
    
    Red:
    
    ```
    red>> form [[""] [a] [] [a] [[[]]]]
    == " a  a "
    ```

