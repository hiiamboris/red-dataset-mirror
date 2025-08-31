
#1452: base opacity of 0 displays as 255
================================================================================
Issue is closed, was reported by WiseGenius and has 8 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1452>

Setting a `base` face to an opacity of `0` makes it display an opacity of `255`. Setting it to any other value (including `1`) seems to work, though.
This is the case in `view` and `vid` on Windows XP and Windows 7.



Comments:
--------------------------------------------------------------------------------

On 2015-12-17T13:42:28Z, WiseGenius, commented:
<https://github.com/red/red/issues/1452#issuecomment-165455876>

    The behaviour has since changed so that all values seem to display transparency, except `255` which still seems to display opacity.
    
    ```
    view [
        base 255.0.0.0 10x10
        base 255.0.0.1 10x10
        base 255.0.0.64 10x10
        base 255.0.0.100 10x10
        base 255.0.0.128 10x10
        base 255.0.0.160 10x10
        base 255.0.0.200 10x10
        base 255.0.0.224 10x10
        base 255.0.0.254 10x10
        base 255.0.0.255 10x10
    ]
    ```
    
    Result:
    ![xp](https://cloud.githubusercontent.com/assets/7657453/11870936/a8683200-a517-11e5-9430-5a59645099f1.png)

--------------------------------------------------------------------------------

On 2015-12-17T15:22:04Z, WiseGenius, commented:
<https://github.com/red/red/issues/1452#issuecomment-165481949>

    This seems to be working consistently now:
    ![xp2](https://cloud.githubusercontent.com/assets/7657453/11873343/b129b78e-a525-11e5-91c7-f5ef8aafb69b.png)

--------------------------------------------------------------------------------

On 2016-01-15T11:33:45Z, dockimbel, commented:
<https://github.com/red/red/issues/1452#issuecomment-171938966>

    Issue should be fixed by now.

--------------------------------------------------------------------------------

On 2016-01-15T11:38:25Z, WiseGenius, commented:
<https://github.com/red/red/issues/1452#issuecomment-171940163>

    Yes, it is, as shown in the picture above.

