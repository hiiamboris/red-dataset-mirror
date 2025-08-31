
#4242: decode-url doesn't handle `a:b` which is valid.
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4242>

**Describe the bug**
`a:b` is a valid URL, but the %networking.red url parser doesn't recognize it.

see: https://gitter.im/red/bugs?at=5e179e84e52f635378b239f6

**To reproduce**
`decode-url a:b`

**Expected behavior**
Return decoded URL object.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 8-Jan-2020/13:51:56-07:00 commit #e26452d
```



Comments:
--------------------------------------------------------------------------------

On 2020-08-04T13:38:42Z, 9214, commented:
<https://github.com/red/red/issues/4242#issuecomment-668602223>

    I can see that the fix was implemented, so maybe it's time to make a PR?

