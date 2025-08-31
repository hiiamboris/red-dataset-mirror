
#2722: Low lewel `wait` inconsistency
================================================================================
Issue is closed, was reported by Oldes and has 10 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2722>

Low level `wait` is using [`milliseconds`](https://github.com/red/red/blob/master/runtime/platform/win32.reds#L205-L207) on [Windows](https://github.com/red/red/blob/master/runtime/platform/win32.reds#L382) and [`microseconds`](https://github.com/red/red/blob/master/runtime/platform/POSIX.reds#L100-L103) on [POSIX](https://github.com/red/red/blob/master/runtime/platform/POSIX.reds#L215).


Comments:
--------------------------------------------------------------------------------

On 2017-05-30T22:15:46Z, qtxie, commented:
<https://github.com/red/red/issues/2722#issuecomment-305024464>

    We have a wrap function for those OS APIs to keep it consistent.

--------------------------------------------------------------------------------

On 2017-05-31T06:30:01Z, Oldes, commented:
<https://github.com/red/red/issues/2722#issuecomment-305096808>

    Sorry, but I would consider to be more clear to have:
    ```
    
    wait: func [time [integer!]][usleep time * 1000]
    ```
    In the Posix version and not need to worry about code like:
    ```
    time: int/value * #either OS = 'Windows [1000][1000000]
    ..
    ftime: val/value * #either OS = 'Windows [1000.0][1000000.0]
    ..
    time: as-integer (val/value / #either OS = 'Windows [1E6][1E3])
    ```
    as is here: https://github.com/red/red/blob/master/runtime/natives.reds#L2087-L2098

--------------------------------------------------------------------------------

On 2017-05-31T06:33:25Z, Oldes, commented:
<https://github.com/red/red/issues/2722#issuecomment-305097407>

    Red/System may be used without Red runtime context and it should be possible to reuse as much code from Red source as possible without need to rewrite everything.

--------------------------------------------------------------------------------

On 2017-06-01T07:05:56Z, Oldes, commented:
<https://github.com/red/red/issues/2722#issuecomment-305407562>

    @qtxie are you sure you don't want to change it? I'm using this code for R/S only code, but now it would not be consistent when the low level `wait` would be used with Red runtime.
    https://github.com/Oldes/code/blob/ZeroMQ/Library/os/wait.reds

--------------------------------------------------------------------------------

On 2017-06-01T07:08:17Z, Oldes, commented:
<https://github.com/red/red/issues/2722#issuecomment-305408041>

    Or is there any reason why you prefer to use `#either OS = 'Windows [1000][1000000]`? If someone would like to use better precision on POSIX, than can use system dependent `usleep` directly.

