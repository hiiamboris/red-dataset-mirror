
#1906: file! accepts wrong path separator `\` and does not convert it to `/`
================================================================================
Issue is closed, was reported by ghost and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1906>

Currently in Red -

```
red>> %\d\
== %\d\
```

whereas in rebol -

```
>> %\d\
== %/d/
```

In Rebol - 

> The standard character for separating directories is the forward slash (/), not the backslash (). If backslashes are found they are converted to forward slashes.

Either Red should behave like Rebol or it should raise an error, but it just accepts wrong path separator.



Comments:
--------------------------------------------------------------------------------

On 2016-05-16T03:48:25Z, dockimbel, commented:
<https://github.com/red/red/issues/1906#issuecomment-219343024>

    We will implement it asap.

--------------------------------------------------------------------------------

On 2016-05-23T16:58:57Z, dockimbel, commented:
<https://github.com/red/red/issues/1906#issuecomment-221031235>

    Fixed by commit [634996c9](https://github.com/red/red/commit/ce76e19676e231a2ec64624ef9400f21634996c9).

