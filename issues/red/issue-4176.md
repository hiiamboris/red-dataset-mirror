
#4176: Regression: `is` not working with paths anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4176>

**Describe the bug**

It's fascinating how such a trivial change: https://github.com/red/red/commit/96fb9e48e8ad03084c3cfbfc0f7ac1a43e5fd672#diff-ff0dacd9d5c1090750f41b767ae4027f
could stop the reactivity from working properly

Test snippet:
```
r: make reactor! [n: 1 c: is [1x1 * n] x: is [c/x] t: is [n * 1:0:0] hms: is [rejoin [t/hour t/minute t/second]]]
? r  r/n: 2  ? r
```

Before that commit:
```
R is an object! with the following words and values:
     on-change*  function!     [word old new /local srs]
     n           integer!      1
     c           pair!         1x1
     x           integer!      1
     t           time!         1:00:00
     hms         string!       "100.0"

R is an object! with the following words and values:
     on-change*  function!     [word old new /local srs]
     n           integer!      2
     c           pair!         2x2
     x           integer!      2
     t           time!         2:00:00
     hms         string!       "200.0"
```
After that commit:
```
R is an object! with the following words and values:
     on-change*  function!     [word old new /local srs]
     n           integer!      1
     c           pair!         1x1
     x           integer!      1
     t           time!         1:00:00
     hms         string!       "100.0"

R is an object! with the following words and values:
     on-change*  function!     [word old new /local srs]
     n           integer!      2
     c           pair!         2x2
     x           integer!      1
     t           time!         2:00:00
     hms         string!       "100.0"
```

**Expected behavior**

`x` and `hms` should be updated properly

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Nov-2019/10:17:45+03:00 commit #b2aafe6
```



Comments:
--------------------------------------------------------------------------------

On 2019-12-06T21:35:47Z, greggirwin, commented:
<https://github.com/red/red/issues/4176#issuecomment-562745641>

    Indeed. I imagine an unset is tripping things up in reactive handling somewhere. It's passing through now, rather than tripping an error as before. 

--------------------------------------------------------------------------------

On 2019-12-06T21:55:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/4176#issuecomment-562751172>

    I don't think it has anything to do with `unset` this time though. No errors, as you can see. And it was `keep/only` that was unset. It must be something much more wicked ;)

--------------------------------------------------------------------------------

On 2020-06-16T14:29:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/4176#issuecomment-644801907>

    Looks like it was me who [caused this regression](https://github.com/red/red/commit/f8597c9f247ce3fede77c91e8d5206e842ea3ba8) :D 
    I thought the [commits history](https://github.com/red/red/commits/96fb9e48e8ad03084c3cfbfc0f7ac1a43e5fd672/environment/reactivity.red) shows the merge date, but it actually shows the date the commit was created (created May 20, merged Aug 20). So helpful of Github!
    
     

