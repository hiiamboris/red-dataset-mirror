
#3102: Using form as a set-word with `view` breaks `help`
================================================================================
Issue is closed, was reported by gltewalt and has 2 comment(s).
<https://github.com/red/red/issues/3102>

```
>> form: [size 800x600 backdrop coal]
== [size 800x600 backdrop coal]
>> view form
```

### Expected behavior
Normal `help` results from `help system` and `help either`

### Actual behavior
```
>> help system
*** Script Error: pad does not allow word! for its n argument
*** Where: pad
*** Stack: help help-string pad  
```

```
>> help either
*** Script Error: uppercase does not allow block! for its string argument
*** Where: uppercase
*** Stack: help help-string  
```

### Steps to reproduce the problem
Tried various set-words for block `[size 800x600 backdrop coal]`

### Red version and build date, operating system with version.
Red for Windows version 0.6.3 built 29-Oct-2017/20:11:13-06:00


Comments:
--------------------------------------------------------------------------------

On 2017-11-08T21:26:58Z, greggirwin, commented:
<https://github.com/red/red/issues/3102#issuecomment-342965390>

    Has nothing to do with `view`.
    ```
    >>  form: [size 800x600 backdrop coal]
    == [size 800x600 backdrop coal]
    >> help system
    *** Script Error: pad does not allow word! for its n argument
    *** Where: pad
    *** Stack: help help-string pad  
    ```
    It has to do with redefining `form` globally. Redefining standard functions often breaks things.

