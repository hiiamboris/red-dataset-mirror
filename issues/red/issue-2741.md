
#2741: [macOS DRAW] The negative sweep value in ARC command should sweep in the counterclockwise direction.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2741>

Run the following code to see
```Red
view [ box white 100x100 draw [ line-width 10 fill-pen yellow arc 50x50 40x40 0 -90] ]
```
This bug is only in macOS.



Comments:
--------------------------------------------------------------------------------

On 2021-06-05T03:08:12Z, toomasv, commented:
<https://github.com/red/red/issues/2741#issuecomment-855173740>

    This issue has reappeared on Windows now. 
    ![image](https://user-images.githubusercontent.com/11960635/120878336-65603d80-c5c4-11eb-9726-f4e269235d45.png)
    (with code above)

