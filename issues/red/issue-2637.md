
#2637: + is not symmetrical in its argument types
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2637>

See REPL code below


Comments:
--------------------------------------------------------------------------------

On 2017-04-28T15:21:36Z, meijeru, commented:
<https://github.com/red/red/issues/2637#issuecomment-298027504>

    ```
    >> 1 + make vector! [1 2 3]
    *** Script Error: vector! type is not allowed here
    *** Where: +
    >> (make vector! [1 2 3]) + 1
    == make vector! [2 3 4]
    ```

--------------------------------------------------------------------------------

On 2017-04-28T16:09:55Z, meijeru, commented:
<https://github.com/red/red/issues/2637#issuecomment-298039802>

    See also #2216

--------------------------------------------------------------------------------

On 2017-05-18T15:49:20Z, meijeru, commented:
<https://github.com/red/red/issues/2637#issuecomment-302446550>

    This is part of a vaster issue, which I will first address in Gitter

