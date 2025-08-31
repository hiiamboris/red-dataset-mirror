
#2382: Routine is not compiled correctly when using libRedRT
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2382>

* Red Version: Latest (master branch)
* OS: Windows 7 64bit
* Test Script: 
```red
Red [
    Note: "Error only occur when using libRedRT, works fine in release mode"
]
rt-process: routine [o [object!] /local value][
    value: object/get-values o
    probe TYPE_OF(value)        ;@@ print 3 when using libRedRT, should be 11
]
myobj!: object [
    value: none
    process: function [][
	rt-process self
    ]
]
oo: make myobj! [value: 123]
oo/process
```


