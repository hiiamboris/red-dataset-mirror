
#2992: new-line markers inside block are set for no reason
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2992>

Following snippet:
```Red
probe collect [
    foreach [l d] "a1b2" [
        keep reduce [
            (to integer! l) - 1
            to integer! form d
        ]
    ]
]
```
As expected, results in:
```Red
[96 1 97 2]
```
But if I rewrite `(to integer! l) - 1` to `-1 + to integer! l`, it will yield the same result, but formatted differently, as if new-line markers are setted.
```Red
probe collect [
    foreach [l d] "a1b2" [
        keep reduce [
            -1 + to integer! l
            to integer! form d
        ]
    ]
]
```
```Red
[
    96 1
    97 2
]
```
Looks like in this case `keep` (or `reduce`?) somehow preserves the content exactly, because if I rewrite snippet to:
```Red
probe collect [
    foreach [l d] "a1b2" [
        keep reduce [-1 + to integer! l to integer! form d]
    ]
]
```
It again will be
```Red
[96 1 97 2]
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-14T07:15:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2992#issuecomment-329395010>

    I think the value slot headers are not cleared from the new-line marker flags, so the flag is propagating. 

