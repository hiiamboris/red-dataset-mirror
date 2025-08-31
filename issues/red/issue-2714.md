
#2714: Compiler error: Find-aliased expected type argument of type: word
================================================================================
Issue is closed, was reported by Oldes and has 6 comment(s).
[status.resolved]
<https://github.com/red/red/issues/2714>

If I very simplify the test case:
```Red
#import [LIB stdcall [test: "test" []]]
print-line test
```
throws error:
```
*** Red/System Compiler Internal Error: Script Error : find-aliased expected type argument of type: word 
*** Where: get-type-id 
*** Near:  [either alias: find-aliased/position type/1 [
get-alias-id alias
]]
```

It would be great if the error message could be more descriptive. So the reason of this error could be found easily (providing line number in the source).


Comments:
--------------------------------------------------------------------------------

On 2017-07-29T08:49:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2714#issuecomment-318814680>

    I get here:
    ```
    *** Compilation Error: invalid import specification at: LIB stdcall test test
    ```

--------------------------------------------------------------------------------

On 2017-07-29T08:53:01Z, Oldes, commented:
<https://github.com/red/red/issues/2714#issuecomment-318814887>

    So maybe already fixed by accident. Above looks good enough. 

--------------------------------------------------------------------------------

On 2017-07-29T08:57:35Z, dockimbel, commented:
<https://github.com/red/red/issues/2714#issuecomment-318815149>

    Ok, closing the ticket, you can ask for re-opening if you see this issue appearing again.

