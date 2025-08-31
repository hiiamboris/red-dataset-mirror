
#1147: Console wrongly interpret valid block and enters multi-line mode
================================================================================
Issue is closed, was reported by x8x and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1147>

Stuck in multi-line entry mode in the console
by entering what should be a valid block:

``` rebol
red>> ["}" {}]
[    
[    
[    ]
[    ]
[    
(escape)
```



Comments:
--------------------------------------------------------------------------------

On 2015-05-04T11:13:13Z, x8x, commented:
<https://github.com/red/red/issues/1147#issuecomment-98678790>

    Same here:
    
    ``` rebol
    red>> "{"
    {    
    {    
    {    
    (escape)
    ```

