
#2917: time!: Can not set a date with time including subseconds
================================================================================
Issue is closed, was reported by x8x and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2917>

It's always rounded to the second:
```
>> 23-Jul-2017/10:02:07.4
== 23-Jul-2017/10:02:07
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-23T07:57:21Z, x8x, commented:
<https://github.com/red/red/issues/2917#issuecomment-317236120>

    Probably related: `difference` rounds subseconds to the seconds precision.
    ```
    >> difference 1-Jan-1970/0:0:0.6 1-Jan-1970
    == 0:00:01
    ```

--------------------------------------------------------------------------------

On 2017-07-23T07:58:18Z, dockimbel, commented:
<https://github.com/red/red/issues/2917#issuecomment-317236160>

    It's a recent regression, probably from https://github.com/red/red/commit/4acee92cee5e2d60c668ad08cd127cfbea6cd016

