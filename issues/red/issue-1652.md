
#1652: WISH: Set-Focus function
================================================================================
Issue is closed, was reported by JenniferLee520 and has 6 comment(s).
[type.wish] [status.resolved]
<https://github.com/red/red/issues/1652>

I need to change focus to different faces.

``` Red
set-focus new-face
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-22T04:34:33Z, WiseGenius, commented:
<https://github.com/red/red/issues/1652#issuecomment-187003890>

    @JenniferLee520 Do you mean like this?
    
    ```
    l: layout [
        old-face: area
        new-face: area
        button {set-focus} [l/selected: new-face]
    ]
    l/selected: old-face
    view l
    ```

--------------------------------------------------------------------------------

On 2016-02-22T04:44:06Z, dockimbel, commented:
<https://github.com/red/red/issues/1652#issuecomment-187007063>

    `selected` facet of each window allows you to set the focus on any face.

--------------------------------------------------------------------------------

On 2016-02-22T08:19:41Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1652#issuecomment-187064916>

    Thanks. I didn't know that. 

