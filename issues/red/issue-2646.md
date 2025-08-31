
#2646: make op! allows invalid construction syntax / returned op! causes crash
================================================================================
Issue is closed, was reported by dander and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2646>

```
>> plus: make op! [[x y][x + y]]
== make op! [[x y]]
>> ? plus
USAGE:
        x plus y

DESCRIPTION:

        PLUS is an op! value

ARGUMENTS:
        x
        y
>> 1 plus 1

*** Runtime Error 1: access violation
*** at: 02BD5F0Ch
```


Comments:
--------------------------------------------------------------------------------

On 2019-08-20T14:43:20Z, dockimbel, commented:
<https://github.com/red/red/issues/2646#issuecomment-523047351>

    It's marked a `type.review` rather than `type.bug`, as the corresponding code lines have been just commented until the final decision about supporting that construction syntax (or not) is made.

