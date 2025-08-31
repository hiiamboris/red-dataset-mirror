
#4358: [Draw] MATRIX ignores format of its setup block
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4358>

**Describe the bug**

The transformation matrix can be pre/post multiplied by a given matrix setup, which, according to the [documentation](https://doc.red-lang.org/en/draw.html#_transform), must be a `block!` of 6 `number!`s. On practice, however, the format of the provided block is ignored.

**To reproduce**

```red
draw make image! 0x0 [matrix [neo morpheus trinity]]
```

`OS-matrix-set` simply fetches 6 `float32` values from provided `block!` buffer, ignoring their absence (access over the buffer) and type (treating any value as if it contains valid `float32` in its payload).

**Expected behavior**

An error.

**Platform version**

The latest release, all platforms.



