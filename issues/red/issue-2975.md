
#2975: compiled code using object! not work properly
================================================================================
Issue is open, was reported by qtxie and has 6 comment(s).
[status.reviewed] [type.compiler]
<https://github.com/red/red/issues/2975>

```
Red []
obj-a: object [
    func-a: func [][
        extra/func-b
    ]
    extra: none
]
obj-b: object [
    func-b: func [][
        probe "objc-b"
    ]
]
test: function [][
    obj-a/extra: obj-b
    obj-a/func-a
]
test
```
When compiled, should print "objc-b", but nothing show.


Comments:
--------------------------------------------------------------------------------

On 2017-08-16T07:57:45Z, 9214, commented:
<https://github.com/red/red/issues/2975#issuecomment-322695300>

    https://github.com/red/red/issues/2910 ?

--------------------------------------------------------------------------------

On 2018-03-17T10:06:32Z, toomasv, commented:
<https://github.com/red/red/issues/2975#issuecomment-373908757>

    It works on March 16 W10 console. 

--------------------------------------------------------------------------------

On 2018-03-17T11:51:52Z, dockimbel, commented:
<https://github.com/red/red/issues/2975#issuecomment-373914338>

    @toomasv Thanks for the testing, but the issue is when the code is compiled.

