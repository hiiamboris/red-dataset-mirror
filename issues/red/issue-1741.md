
#1741: Break not working on first cycle in a loop, repeat, forever..
================================================================================
Issue is closed, was reported by x8x and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1741>

``` rebol
foreach a [1 2 3 4][break]
*** Throw error: no loop to break
*** Where: break
```

``` rebol
  t: 0  foreach a [1 2 3 4][if t > 0 [break/return 'ok] t: t + 1]
;   ok
```

``` rebol
  repeat n 4 [break]
*** Throw error: no loop to break
*** Where: break
```

``` rebol
  repeat n 4 [if n > 1 [break/return 'ok]]
;   ok
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-27T13:55:41Z, ghost, commented:
<https://github.com/red/red/issues/1741#issuecomment-202067862>

    There was this (apparently fixed) issue in while loop as well https://github.com/red/red/issues/1702

--------------------------------------------------------------------------------

On 2016-04-12T02:40:38Z, qtxie, commented:
<https://github.com/red/red/issues/1741#issuecomment-208676414>

    A related issue:
    
    ```
    Red []
    i: 1
    while [i <> 100] [
        x: i
        while [x <> 0] [
            if x % 10 = 4 [
                break ; doesn't crash after commented this line
            ]
            x: x / 10
        ]
        i: i + 1
    ]
    print x
    ```
    
    Save this code to a file, `%nobreak.red`, open the console:
    
    ```
    red>> do load %nobreak.red       ;-- works well
    0
    ```
    
    ```
    red>> do %nobreak.red
    *** Throw error: no loop to break
    *** Where: break
    ```

--------------------------------------------------------------------------------

On 2016-05-09T10:16:41Z, dockimbel, commented:
<https://github.com/red/red/issues/1741#issuecomment-217827459>

    All those scripts are now woking well.

