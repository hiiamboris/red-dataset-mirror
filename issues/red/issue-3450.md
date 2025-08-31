
#3450: to-char with integer > 10FFFFh should give error
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
<https://github.com/red/red/issues/3450>

### Expected behavior
`to-char <integer>` where the argument is greater than the highest Unicode Code Point should give an error
### Actual behavior
in the same expression the argument is reduced by ANDing with `10FFFFh`
### Steps to reproduce the problem
execute `to-char 110000h`
### Red and platform version
```
all
```


Comments:
--------------------------------------------------------------------------------

On 2018-07-05T17:13:39Z, greggirwin, commented:
<https://github.com/red/red/issues/3450#issuecomment-402792134>

    @endo64, do you want to handle this one, since you were just in that code?

--------------------------------------------------------------------------------

On 2018-07-06T08:42:57Z, endo64, commented:
<https://github.com/red/red/issues/3450#issuecomment-402969041>

    @greggirwin Yep, I'll do it next week.

--------------------------------------------------------------------------------

On 2018-07-13T00:39:53Z, greggirwin, commented:
<https://github.com/red/red/issues/3450#issuecomment-404691654>

    @meijeru, OK to close this issue with @endo64's fix?

--------------------------------------------------------------------------------

On 2018-07-13T07:47:16Z, meijeru, commented:
<https://github.com/red/red/issues/3450#issuecomment-404754725>

    Yes thanks

