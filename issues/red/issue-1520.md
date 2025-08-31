
#1520: Wish: setting tuple component to none should eliminate the component
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/1520>

Currently, we  have

```
 c: 1.2.3.4 c/4: none c Result: in Rebol 1.2.3 in Red 1.2.3.0
```

The Rebol result is more desirable. In detail: setting any component nr `i` to `none`, where `i > 3`, should curtail the tuple to length `i - 1`. 



