
#4940: GUI console strips new-line from `prin` output
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4940>

**Describe the bug**

Another quirk to add to https://github.com/red/red/issues/4929#issuecomment-878855443 collection:
```
print "one"
prin "two^/"
print "three"
```
This should print 3 lines.
Instead prints 2:
```
onetwo
three
```


**Platform version**
```
Red 0.6.4 for Windows built 22-Jul-2021/20:44:06+03:00  commit #3c8d386
```



