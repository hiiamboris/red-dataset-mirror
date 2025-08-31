
#1566: can't paste multiline text into gui-console
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1566>

Pasting the following into the gui-console:

```
print "This is line 1."
print "This line will be ignored."
```

Results in:

```
red>> print "This is line 1."
This is line 1.
red>> 
```

Or pasting this:

```
if true [
    print "I deserve a chance!"
]
```

Results in:

```
red>> if true [
[    
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-01T16:43:56Z, WiseGenius, commented:
<https://github.com/red/red/issues/1566#issuecomment-178062032>

    [This commit](https://github.com/red/red/commit/10555b3f93290da24e38d96bb04ac86aecf73a44) seems to have fixed this.

