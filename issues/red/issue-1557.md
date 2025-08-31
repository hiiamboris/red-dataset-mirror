
#1557: Regression: group-box invisibility crash
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1557>

A regression has occured between `red-19jan16-77eda7c.exe` and `red-27jan16-94e4f1d.exe`, and persists in `red-28jan16-94e4f1d.exe`.

```
view [
    button [f/visible?: false]
    f: group-box []
]
```

Clicking the button results in:

```
*** Runtime Error 1: access violation
*** at: 0046E68Dh
```

Setting to `true` has the same result. It only seems to happen if changing while the window is open. The following code works as expected:

```
l: layout [
    f: group-box []
]
view l
f/visible?: false
view l
```

`offset` and `size` don't cause problems:

```
view [
    button [f/offset: 100x200 f/size: 300x400]
    f: group-box []
]
```

No other face seems to be affected in this way:

```
view [
    button [f/visible?: false]
    f: text {Hello, World!}
]
```



