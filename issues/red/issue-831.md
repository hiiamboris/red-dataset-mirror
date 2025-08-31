
#831: can't redefine a variable after define it as function more than once.
================================================================================
Issue is closed, was reported by qtxie and has 10 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/831>

This code will fail:
%test.red

```
Red []

f: function [][1]
f: function [][1]

f: 100
print f = 100
```

output:

```
> test.exe
*** Error: word has no value!
false
```

but this one works fine.

```
Red []

f: function [][1]
;; f: function [][1]         ;-- comment it.

f: 100
print f = 100
```

output:

```
true
```



Comments:
--------------------------------------------------------------------------------

On 2014-05-24T03:31:36Z, qtxie, commented:
<https://github.com/red/red/issues/831#issuecomment-44076539>

    FYI. Red/System Intermediate output for %test.red 
    https://gist.github.com/qtxie/106b8986bd2aa57ef41e

--------------------------------------------------------------------------------

On 2014-06-12T07:35:54Z, dockimbel, commented:
<https://github.com/red/red/issues/831#issuecomment-45838276>

    This is a complex case to solve for the compiler. I prefer we wait to object support to be included before processing this ticket. Object support in the compiler requires some changes in the way functions are processed, so it will impact the way to solve that specific case too.

--------------------------------------------------------------------------------

On 2014-09-16T10:03:12Z, dockimbel, commented:
<https://github.com/red/red/issues/831#issuecomment-55721582>

    Right, this one should be fixed during the final work on object branch.

--------------------------------------------------------------------------------

On 2016-05-09T10:08:23Z, dockimbel, commented:
<https://github.com/red/red/issues/831#issuecomment-217825873>

    Works fine now.

--------------------------------------------------------------------------------

On 2016-09-08T06:29:23Z, rebolek, commented:
<https://github.com/red/red/issues/831#issuecomment-245505891>

    Still not fixed, see #2207 

