
#5352: [Linux] Impractical `system/console/size` with redirected output
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/5352>

**Describe the bug**

On Windows when script's output is redirected, console assumes default `system/console/size` of `80x50`. On Linux it's `0x0`, which is harmful for the tracer and other width-considering formatters.

**To reproduce**

1. Create `1.red`: `Red [] ?? system/console/size`
2. Run it as `red 1.red >out.txt`
3. See `out.txt` contents.

**Expected behavior**

Consistent sane value like 80x50 across platforms.

**Platform version**
```
Red 0.6.4 for Linux built 18-Jul-2023/22:56:01+03:00  commit #af3d35a
```


