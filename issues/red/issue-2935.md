
#2935: VID: be able to have local variables in action
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2935>

for example,
```Red
view [ 
    text "000 Days 00:00:00" font-size 30 rate 1 on-time [ 
        local [ sec-now xmas sec-xmas t ]    ; <=== I would like this support to make these words local
        sec-now: to-integer now
        xmas: 2017-12-24/20:00
        xmas/zone: now/zone
        sec-xmas: to-integer xmas
        t: to-time sec-xmas - sec-now
        face/data: reduce [ t/hour / 24 "Days" t // 24:00 ] 
    ]  
]
```


