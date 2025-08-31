
#2495: make vector! has issues
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2495>

`make vector! [integer!...]` accepts bitsizes 8, 16, 32, 64. However, with 64 the following crashes:
```
v: make vector! [integer! 64 []]
insert v 1
v/1
```
`make vector! [float!...]` also accepts these bitsizes, but with 8 and 16 the following happens:
```
v: make vector! [float! 8 []]
insert v 1.0
v/1 ; == 0.0 instead of 1.0, same for 16
```
  


Comments:
--------------------------------------------------------------------------------

On 2017-03-25T01:30:18Z, qtxie, commented:
<https://github.com/red/red/issues/2495#issuecomment-289178580>

    64bit integer and 8bit float! are not supported in vector!, we should fire an error when using it.
    FYI, currently supported datatypes in vector:
    ```
    Integer/Char:    8bit, 16bit, 32bit
    Float/Percent:   32bit, 64bit
    ```

--------------------------------------------------------------------------------

On 2017-03-25T10:36:30Z, meijeru, commented:
<https://github.com/red/red/issues/2495#issuecomment-289203501>

    `make vector! [percent! 32 []]` still crashes!!!

--------------------------------------------------------------------------------

On 2017-03-25T23:04:28Z, qtxie, commented:
<https://github.com/red/red/issues/2495#issuecomment-289245647>

    Thanks. Fix it now.

