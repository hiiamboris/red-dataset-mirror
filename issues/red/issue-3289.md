
#3289: Words in actors in user defined styles are bound to face
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/3289>

### Expected behavior

When defining words in actor code block, they should not be bound to face, for example `offset`, `size` and so on.

### Actual behavior

Look at the example below, setting `offset` will change `face/offset`.

### Steps to reproduce the problem

Try for example this code and click on red box:
```
view [
    style x: base red 100x100 on-down [
        print face/offset 
        offset: 50 
        print face/offset
    ] 
    x
]
```

You can see that `face/offset` changed from `100x100` to `50`.

Also note that this happens only when defining user style, not with actor added to default style:
```
view [
    base red 100x100 on-down [print face/offset offset: 50 print face/offset]
]
```

### Red version and build date, operating system with version.

Red for Windows on Wine

```
>> ? system/build
     date    date!         26-Mar-2018/13:26:01+02:00
```


