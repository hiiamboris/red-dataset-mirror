
#3172: Replace misbehaving when pattern is the series at same or different index
================================================================================
Issue is closed, was reported by x8x and has 4 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/3172>

### Expected behavior
same as Rebol:
```
  replace t: %a.b t %.c
;   %.c
   replace t: %a.b find/last t %. %.c
;   %a.c
  replace t: %a.b at t 2 %.c
;   %a.c
```
### Actual behavior
```
  replace t: %a.b t %.c
;   %.ca.b
  replace t: %a.b find/last t %. %.c 
;   %a.c.b
  replace t: %a.b at t 2 %.c
;   %a.c.b
```
### Red version and build date, operating system with version.
macos/latest


Comments:
--------------------------------------------------------------------------------

On 2017-12-28T07:32:37Z, qtxie, commented:
<https://github.com/red/red/issues/3172#issuecomment-354243600>

    It works fine in my test. Would you check it again?

--------------------------------------------------------------------------------

On 2017-12-28T10:07:57Z, x8x, commented:
<https://github.com/red/red/issues/3172#issuecomment-354263781>

    Sorry @qtxie it works fine indeed. I have a local custom replace that I missed when wrote the issue. Have a good day!

