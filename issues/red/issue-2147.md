
#2147: Chinese characters are corrupted.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/2147>

In Windows 10,

``` Red
view [
    txt: field 250x30
    on-enter [
        print txt/text
    ]
]
```

For example. you type in "红色", and you get "¢r"



Comments:
--------------------------------------------------------------------------------

On 2016-08-03T09:01:19Z, ifgem, commented:
<https://github.com/red/red/issues/2147#issuecomment-237182812>

    Russian, Polish characters... aren't printed properly either.

