
#1655: error when resetting para
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1655>

Resetting the `para` of a face whose `para` isn't `none` errors (on Win XP and 7) with:

```
*** Script error: find does not allow word for its series argument
*** Where: find
```

Examples:

```
view [
    a: area {Hello, World!}
    button {right} [a/para: make para! [align: 'right]]
    do [
        a/para: make para! [align: 'center]
    ]
]
```

```
view [
    a: area {Hello, World!} center
    button {right} [a/para: make para! [align: 'right]]
]
```



