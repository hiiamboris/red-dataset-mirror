
#17: Cannot assign c-string value to struct member
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.tested]
<https://github.com/red/red/issues/17>

The Todo-list says: "Structs members read & write access: implemented but untested." I compiled the following program:

```
red/system []
s: struct[a [integer!] b [c-string!]]
s/b: "hello"
```

This gave the following error message:

```
** Script Error: emit expected value argument of type: integer word tag
** Where: access-path
** Near: emit/head/store/struct path/1 value offset
```



Comments:
--------------------------------------------------------------------------------

On 2011-04-25T21:37:28Z, dockimbel, commented:
<https://github.com/red/red/issues/17#issuecomment-1055225>

    Yes, it is broken and it also needs to be refactored as it was written 2 months ago and several things have been changed internally since then. That is why it was put in the todo-list, it is an unfinished work.

--------------------------------------------------------------------------------

On 2011-04-28T09:54:27Z, dockimbel, commented:
<https://github.com/red/red/issues/17#issuecomment-1069081>

    Fixed by commit https://github.com/dockimbel/Red/commit/4e96eec3e4d8d79e72b3d77bcc290b6e8d635143

--------------------------------------------------------------------------------

On 2011-05-09T11:39:09Z, dockimbel, commented:
<https://github.com/red/red/issues/17#issuecomment-1122355>

    Tested OK.

