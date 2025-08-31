
#4516: Deceptive error message when selecting from a string
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4516>

**Describe the bug**

In this script, a wrong value was passed as `b` argument - a string instead of an object:
```
>> b: "2"
== "2"
>> b/what
*** Script Error: word type is not allowed here
*** Where: either
*** Stack: 
```
The error message just could not have been any more hideous: it tells nothing about the context. `here` where? what `word`? what `either`? It takes deep line by line tracing to discover where exactly the error comes from.


**Expected behavior**

To the point error message, e.g. `*** Script Error: string 'b' cannot be indexed with a word 'what' in 'b/what'`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-16T22:26:45Z, dockimbel, commented:
<https://github.com/red/red/issues/4516#issuecomment-1217232968>

    This issue has been fixed by a previous commit:
    ```
    >> b: "2"
    == "2"
    >> b/what
    *** Script Error: cannot access what in path b/what
    *** Where: catch
    *** Near : b/what
    *** Stack:
    ```

