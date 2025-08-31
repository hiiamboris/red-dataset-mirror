
#5446: Edge cases of file path construction that aren't practical
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.review]
<https://github.com/red/red/issues/5446>

**Describe the bug**

1. When path is empty, adding a filename to it puts it into system root rather than current directory, which is a ground for gotchas. [Majority vote (4:1)](https://matrix.to/#/%23red_bugs%3Agitter.im/%24n25AdHngNZjiHZ7cJojL4rlyk3guiT7chlrMeLV7lOg?via=tchncs.de&via=gitter.im&via=matrix.org&via=nitro.chat) prefers current directory in this case:
```
>> path: %""
>> path/file.ext
== %/file.ext       ;) accidental root access
```
2. When added filename is an absolute path, resulting path is invalid. So a pattern that successfully adds relative path to the current directory fails if path is absolute:
```
>> path: %/D/devel/red/
>> boot: %./1.exe
>> path/:boot
== %/D/devel/red/./1.exe      ;) valid path to the binary
>> boot: %/D/devel/red/1.exe
>> path/:boot
== %/D/devel/red//D/devel/red/1.exe      ;) garbage out
```
It is understandable that `/` works simply as `append dirize`, but it requires higher level function wrapper to achieve this very common goal.

Similarly we may want to address these cases as well:
```
>> dirize %""      ;) will lead to root access
== %/
>> dirize clean-path %""
== %/C/Users/1/
>> clean-path dirize %""     ;) unexpected order-related difference
== %/
```

**Expected behavior**

```
>> path: %""
>> path/file.ext
== %file.ext

>> path: %/D/devel/red/
>> boot: %/D/devel/red/1.exe
>> path/:boot
== %/D/devel/red/1.exe

>> dirize %""
== %""
>> (dirize clean-path %"") = (clean-path dirize %"")
== true
```

Since there's no direct function equivalent of this behavior, there are multiple options:
1. Keep `/` simple but provide a function wrapper for path joining
2. Make `/` smarter
3. Make `/` smarter and add a function alias to it

I'm leaning towards (3). Note that `append dirize` equivalent cannot fulfill this case, requires more smarts:
```
>> path/:boot
== %/D/devel/red/1.exe
```

**Platform version**

`Red 0.6.4 for Windows built 22-Nov-2023/17:24:25+03:00  commit #34f26df`


