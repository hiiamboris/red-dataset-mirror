
#1654: WISH: change cursor
================================================================================
Issue is closed, was reported by JenniferLee520 and has 6 comment(s).
[status.waiting] [type.wish]
<https://github.com/red/red/issues/1654>

I would like to do it automatically:

``` Red
make face! [ 
    type: 'base
    cursor: %my-cursor.png
]
```

and manually:

``` Red
set-cursor %my-cursor.png
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-22T09:24:56Z, dockimbel, commented:
<https://github.com/red/red/issues/1654#issuecomment-187089116>

    System cursor support will be implemented in 0.6.1.

--------------------------------------------------------------------------------

On 2017-06-09T13:18:38Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1654#issuecomment-307386140>

    It's supported just now.

--------------------------------------------------------------------------------

On 2017-06-09T14:03:48Z, qtxie, commented:
<https://github.com/red/red/issues/1654#issuecomment-307397603>

    We need a way to set the [hotspot](https://msdn.microsoft.com/en-us/library/windows/desktop/ms648379(v=vs.85).aspx#_win32_The_Hot_Spot) of the cursor.

