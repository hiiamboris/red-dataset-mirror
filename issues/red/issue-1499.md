
#1499: get and get/any seem to do the same on unset values
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1499>

This behaviour seems to be against the definition of `get`. See the examples below. `get 'b` ought to have given an error.

```
red>> b
*** Script error: b has no value
*** Where: try
red>> type? get 'b
== unset!
red>> type? get/any 'b
== unset!
red>> error? get 'b
== false
red>> help get
USAGE:
    get word  /any  /case
DESCRIPTION:
    Returns the value a word refers to.
    get is of type: native!
ARGUMENTS:
    word  [word! path!]
REFINEMENTS:
    /any => If word has no value, return UNSET rather than causing an error.
    /case => Use case-sensitive comparison (path only).
```



Comments:
--------------------------------------------------------------------------------

On 2015-12-10T04:50:26Z, dockimbel, commented:
<https://github.com/red/red/issues/1499#issuecomment-163487111>

    `get 'b` should error out, indeed.

