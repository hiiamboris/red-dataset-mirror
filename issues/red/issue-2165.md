
#2165: Slash not added to url!s
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2165>

Starting with:

```
a: http://www.red-lang.org/
b: http://www.red-lang.org
```

In Red:

```
red>> a/p/about.html
== http://www.red-lang.org/pabout.html
red>> b/p/about.html
== http://www.red-lang.orgpabout.html
```

Rebol 2 and 3:

```
>> a/p/about.html
== http://www.red-lang.org/p/about.html
>> b/p/about.html
== http://www.red-lang.org/p/about.html
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-10T10:43:59Z, dockimbel, commented:
<https://github.com/red/red/issues/2165#issuecomment-238830963>

    Feature not yet implemented.

