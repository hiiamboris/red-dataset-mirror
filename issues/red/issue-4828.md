
#4828: [Regression, D2D] Translation hides the pattern pen
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4828>

**Describe the bug**

Used to be: 
(translation changes: `0x0 1x0 2x0 3x0 4x0`)
![](https://i.gyazo.com/4f6faa53321e4b6535617c9abf455ffe.png)
(disregard the fact pattern is not aligned to pixel boundaries)

Now:
![](https://i.gyazo.com/b7eeaa42472dfc92a5c549d9ee178d9d.png)
Only `translate 0x0` pattern is correct.

**To reproduce**
```
Red []

view collect [
    repeat i 5 [
        keep [base cyan draw]
        keep/only compose [
            translate (as-pair i - 1 0) [
                fill-pen pattern 4x4 [pen off fill-pen black box 0x0 2x2 box 2x2 4x4] 
                box 10x10 70x70
            ]
        ]
    ]
]
```


**Platform version**
```
Red 0.6.4 for Windows built 9-Feb-2021/20:31:32+03:00 commit #18bc5f7
```



