
#5496: Extra slashes in file/url composition
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5496>

**Describe the bug**

```
>> file: %/dir/file
== %/dir/file
>> url: https://example.com/
== https://example.com/
>> home: %/home/
== %/home/
>> home/:file
== %/home//dir/file
>> url/:file
== https://example.com//dir/file
```
Note the `//` in both results. In R2 and R3 slash is deduplicated.

Even if no trailing slash, it is still duped:
```
>> home2: %/home
== %/home
>> url2: https://example.com
== https://example.com
>> home/:file
== %/home//dir/file
>> url/:file
== https://example.com//dir/file
```

**To reproduce**
```
file: %/dir/file
url: https://example.com/
url2: https://example.com
home: %/home/
home2: %/home
home/:file
home2/:file
url/:file
url2/:file
```

**Expected behavior**

I think deduplication is more useful.

**Platform version**
`Red 0.6.5 for Windows built 7-Mar-2024/2:20:18+03:00  commit #5a39a7a`


