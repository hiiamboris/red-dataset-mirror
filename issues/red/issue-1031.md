
#1031: Red/System spaces don't seem to be printing from within Red
================================================================================
Issue is closed, was reported by kealist and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1031>

```
Red[]
#system [print "Why are all my spaces disappearing"]
```

will print as:

```
Whyareallmyspacesdisappearing
```

Additionally with routines it will as well:

```
Red[]
f: routine [] [print "Why are all my spaces disappearing"]
f
```

with the same output as above. 



