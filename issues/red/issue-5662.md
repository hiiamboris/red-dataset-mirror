# Issue #5662: `size?` on directories is platform-specific
<https://github.com/red/red/issues/5662>

**Describe the bug**

Observed behavior:
- `size? %existing-file` -> integer size in bytes
- `size? %non-existing-file` -> none
- `size? %directory` -> varies: `none` on Windows, `-1` on Linux
- `size? %/` follows the same behavior as above, though it's special on Windows (there's no physical `%/`)

**To reproduce**

Call `size?` with a directory (with or without an ending slash)

**Expected behavior**

Consistent behavior: e.g. `none` on all platforms (or an error thrown)

**Platform version**
```
Red 0.6.6 for Windows built 9-Sep-2025/3:21:04+08:00  commit #c8b6ebc
Red 0.6.6 for Linux built 16-Oct-2025/19:50:42+08:00  commit #bfc01e1
```


<no comments>
