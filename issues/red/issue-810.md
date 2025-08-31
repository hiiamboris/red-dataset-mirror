
#810: CASE return value improperly
================================================================================
Issue is closed, was reported by qtxie and has 8 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/810>

```
Red/System []
res: case [
    true [1 = 0]
]
print-line res              ;-- true, should be false.
```

but the code behaviour is correct as below.

```
Red/System []

res: case [
    true [0 = 1]
]
print-line res              ;-- false, it's correct.
```



Comments:
--------------------------------------------------------------------------------

On 2014-05-08T09:35:48Z, dockimbel, commented:
<https://github.com/red/red/issues/810#issuecomment-42530092>

    I will have a look at it later today.

--------------------------------------------------------------------------------

On 2016-09-29T07:30:44Z, rebolek, commented:
<https://github.com/red/red/issues/810#issuecomment-250391950>

    Checked with latest version and I get `true` as output.

--------------------------------------------------------------------------------

On 2018-12-06T16:37:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/810#issuecomment-444938050>

    Still unfixed in 0.6.4

--------------------------------------------------------------------------------

On 2018-12-06T22:12:05Z, endo64, commented:
<https://github.com/red/red/issues/810#issuecomment-445048662>

    Works correct if there is a assignment inside the case block:
    
    ```
    Red/System []
    r: false  ; or r: true doesn't matter
    res: case [
        true [r: 0 = 1]  ; if remove "r:" then res will be true incorrectly
    ]
    print-line r
    print-line res
    
    ; >> false
    ; >> false
    ```

