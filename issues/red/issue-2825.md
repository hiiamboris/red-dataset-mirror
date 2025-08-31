
#2825: [VID] Keywords in VID should not be able to used as variable name for faces.
================================================================================
Issue is open, was reported by JenniferLee520 and has 4 comment(s).
[GUI]
<https://github.com/red/red/issues/2825>

In the following code, `data` is mistakenly used as a face name. I was hoping a runtime error to report this.
```Red
view [ 
    data: field 100 
    button [ print data/text ]
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-06-21T06:42:35Z, endo64, commented:
<https://github.com/red/red/issues/2825#issuecomment-309978788>

    I couldn't get it, why it should be runtime error?

--------------------------------------------------------------------------------

On 2017-06-24T12:05:32Z, dockimbel, commented:
<https://github.com/red/red/issues/2825#issuecomment-310834718>

    @endo64 It could result in difficult to read VID code, for example:
    ```
    view [
        style data: field 100 
        text-list 200x200 
        data ["a" "b"]
        data "Hello"
    ]
    ```
    Such cases could be very confusing for beginners.

