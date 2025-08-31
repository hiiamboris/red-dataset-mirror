
#1632: align doesn't update until unview
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1632>

The following code works as expected:

```
view [
    a: area {Hello, World!} center
    return
    f: field {Hello, World!} center
    return
    t: text {Hello, World!} center
    return
    button {left} [a/para/align: f/para/align: t/para/align: 'left]
    button {center} [a/para/align: f/para/align: t/para/align: 'center]
    button {right} [a/para/align: f/para/align: t/para/align: 'right]
]
```

However, in the following code, only the `t` `text` face gets updated by the buttons:

```
l: layout [
    a: area {Hello, World!}
    return
    f: field {Hello, World!}
    return
    t: text {Hello, World!}
    return
    button {left} [p/align: 'left]
    button {center} [p/align: 'center]
    button {right} [p/align: 'right]
]
a/para: f/para: t/para: p: make para! []
view l
```

The align of `field` and `area` don't update until `unview`:

```
l: layout [
    a: area {Hello, World!}
    return
    f: field {Hello, World!}
    return
    t: text {Hello, World!}
    return
    button {left} [p/align: 'left refresh]
    button {center} [p/align: 'center refresh]
    button {right} [p/align: 'right refresh]
]
a/para: f/para: t/para: p: make para! []
refresh: does [unview/only l view l]
view l
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-16T15:15:33Z, dockimbel, commented:
<https://github.com/red/red/issues/1632#issuecomment-184723421>

    Good catch!

--------------------------------------------------------------------------------

On 2016-02-17T07:58:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1632#issuecomment-185086017>

    FYI, `do` in VID allows to run regular Red code once the current VID block has been processed. A simplified version of your test code:
    
    ```
    view [
        a: area {Hello, World!}
        return
        f: field {Hello, World!}
        return
        t: text {Hello, World!}
        return
        button {left}   [p/align: 'left]
        button {center} [p/align: 'center]
        button {right}  [p/align: 'right]
    
        do [a/para: f/para: t/para: p: make para! []]
    ]
    ```
    
    I have put that code in a new %tests/align-test.red file that you can freely expand to add more `para` tests (just send a Pull Request for each change).

