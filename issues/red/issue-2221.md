
#2221: Runtime crash on making image! with pair! that contains negative number
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2221>

```
make image! -10x10
make image! -10.0x10
*** Runtime Error 1: access violation
*** at: 0041C433h
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-10T09:35:00Z, ifgem, commented:
<https://github.com/red/red/issues/2221#issuecomment-246102256>

    Note:
    
    ```
    make image! -1x0
    == make image! [65526x-1 #{}]
    ```

