
#2473: `call/console/output` report `Access Error: invalid UTF-8 encoding: #{D5FDD4DA}`
================================================================================
Issue is closed, was reported by bitbegin and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2473>

```
red>> out: ""

red>> ret: call/shell/output "ping localhost" out
== 0
red>> out
== {^/正在 Ping AFODY-604241043 [::1] 具有 32 字节的数据:^/来自 ::1 的回复: 时间<1ms ^/来自 ::1 的回复: 时间<1ms ^/来自 ::1 的回复: 时间<1ms ^/来自 ::1 的回复: 时间<1
red>> ret: call/console/output "ping localhost" out
*** Access Error: invalid UTF-8 encoding: #{D5FDD4DA}
*** Where: call
```

`call/shell/output` is ok


Comments:
--------------------------------------------------------------------------------

On 2017-03-10T07:57:20Z, dockimbel, commented:
<https://github.com/red/red/issues/2473#issuecomment-285602594>

    @bitbegin Which codepage do you use for DOS console?

--------------------------------------------------------------------------------

On 2017-03-10T08:18:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2473#issuecomment-285606251>

    Nevermind, I could reproduce it by creating a file with a name in Chinese and using:
    ```
    ret: call/console/output "cmd /c dir" out: ""
    *** Access Error: invalid UTF-8 encoding: #{CED2B5C4}
    *** Where: call
    ```

