
#3356: spec block in OBJECT! and FUNCTION! is used from head rather than from index
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3356>

### Expected behavior
```Red
>> object next [x: y: 2] 
== make object! [
    y: 2
]
>> foo: func next [a b][probe 'c]
== func [b][probe 'c]
```
### Actual behavior
```Red
>> object next [x: y: 2] 
== make object! [
    x: unset
    y: 2
]
>> foo: func next [a b][probe 'c]
== func [a b][probe 'c]
```
### Steps to reproduce the problem
See above.
### Red and platform version
```
Red 0.6.3 for Windows built 18-Apr-2018/0:24:50+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2019-08-20T19:04:58Z, dockimbel, commented:
<https://github.com/red/red/issues/3356#issuecomment-523152842>

    The fix only covers object use-case. For functions, they can only store internally the `node` pointer and not the block offset, so you have to provide a block at offset 1 for the spec, or it will just take the spec's head if you fail to do so.

