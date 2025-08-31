
#2278: WISH request-file/save/filter should allow multiple extensions for one filter-name
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2278>

The help says that the filter is a block of `filter-name filter` entries. `filter-name` is a string value and `filter` is a single file value such as `%*.red`. I have a need for more than one file value as filter, such as

```
"Picture files" %*.jpg %*.png %*.gif %*.bmp
```

In the implementation of OS-request-file (in `%comdlgs.reds`) this possibilitiy IS used at the lower level. Would there be a way to mirror this by allowing the several file values to be enclosed in a block? Thus

```
"Picture files" [%*.jpg %*.png %*.gif %*.bmp]
```



Comments:
--------------------------------------------------------------------------------

On 2016-10-19T23:10:21Z, qtxie, commented:
<https://github.com/red/red/issues/2278#issuecomment-254967100>

    Thanks. We'll review it. 
    For now, you can use this as a workaround:
    
    ```
    request-file/save/filter ["Picture files" "*.jpg;*.png;*.gif;*.bmp"]
    ```

--------------------------------------------------------------------------------

On 2016-10-20T07:40:02Z, meijeru, commented:
<https://github.com/red/red/issues/2278#issuecomment-255032027>

    Thanks. I did not know about the workaround, and I think this is in fact largely sufficient! So I am ready to withdraw the wish, or at least let you put it on very low priority.

--------------------------------------------------------------------------------

On 2016-11-16T01:25:48Z, qtxie, commented:
<https://github.com/red/red/issues/2278#issuecomment-260825443>

    We have supported it. see doc here: [request-file](https://github.com/red/red/wiki/%5BDOC%5D-Request-file-and-Request-dir)

