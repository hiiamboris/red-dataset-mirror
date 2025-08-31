
#644: Runaway insert/dup & append/dup negative
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/644>

```
insert/dup "" "!" -1
append/dup "" "!" -1
```

use up all CPU and memory until exhausted.

(Scheduling in Linux is so bad that even a multi-core machine locks up until the crash.)



