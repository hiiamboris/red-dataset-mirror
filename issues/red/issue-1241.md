
#1241: read-input crashes
================================================================================
Issue is closed, was reported by endo64 and has 4 comment(s).
[status.wontfix]
<https://github.com/red/red/issues/1241>

read-input crashes on Windows, v0.5.4

```
red>> read-input "test"
testread-input "test"
== "test"
*** Runtime Error 1: access violation
*** at: 00448DB4h
```



Comments:
--------------------------------------------------------------------------------

On 2015-06-13T15:35:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1241#issuecomment-111720773>

    `read-input` is not meant for users, it can only work when used internaly, use `ask` for getting user input.

--------------------------------------------------------------------------------

On 2015-06-13T15:41:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1241#issuecomment-111722323>

    `ask` stability has been a little improved now and `read-input` renamed to `_read-input` to help discourage users willing to try it. ;-)

