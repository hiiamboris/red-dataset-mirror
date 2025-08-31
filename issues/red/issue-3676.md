
#3676: AT <series> <position> does not check for integer type of <position>
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.deferred]
<https://github.com/red/red/issues/3676>

**Describe the bug**
`at <series> <position>`  should allow only integer values for `<position>` except for `image!` values, which also allow pairs. The spec allows integers and pairs generally, but in `%series.reds` there is no check, only an `assert`. In `%image.reds` there is a separate implementation which allows integer and pair values.

**To reproduce**
`at [1 2 3] 3x5`  ;; 3, no error

**Expected behavior**
Error message on usage of pair, except for images

**Platform version (please complete the following information)**
```
all
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-21T17:23:09Z, meijeru, commented:
<https://github.com/red/red/issues/3676#issuecomment-449447596>

    The same issue holds for `skip`.

--------------------------------------------------------------------------------

On 2018-12-22T03:47:44Z, dockimbel, commented:
<https://github.com/red/red/issues/3676#issuecomment-449542566>

    That is unfinished work. Semantics for `pair!` positions when applied to series are not defined yet.

