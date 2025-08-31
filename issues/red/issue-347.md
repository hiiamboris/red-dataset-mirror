
#347: #system-global broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/347>

```
Red []

#system-global [
    f: does [print-line "Error"]
]
```

-= Red Compiler =- 
Compiling /home/kaj/Desktop/Red/SQLite/examples/test.red ...

...compilation time:     324 ms

Compiling to native code... 

**\* Compilation Error: context specification block is missing 
**\* in file: %/home/kaj/Desktop/Red/SQLite/examples/test.red 
**\* at line: 119 
**\* near: [context <script>]



Comments:
--------------------------------------------------------------------------------

On 2012-12-25T18:50:24Z, dockimbel, commented:
<https://github.com/red/red/issues/347#issuecomment-11675317>

    It was a regression introduced when function! support was added to Red.

