
#6: String variables are acting as immutable
================================================================================
Issue is closed, was reported by PeterWAWood and has 10 comment(s).
[status.tested]
<https://github.com/red/red/issues/6>

Once a string is assigned to a variable it does not get changed by subsequent assignments. The following script (test.reds):

```
Red/System []
str: "original string"
print str
str: "second string"
print str
```

produced the following output:

```
C:\Red\red-system\builds>test
original string
original string
```



Comments:
--------------------------------------------------------------------------------

On 2011-04-04T17:06:23Z, dockimbel, commented:
<https://github.com/red/red/issues/6#issuecomment-954872>

    Global string variables are currently working as constants. I need to either document it properly in specs or change it to allow same behavior as other variables.

--------------------------------------------------------------------------------

On 2011-04-04T23:10:33Z, PeterWAWood, commented:
<https://github.com/red/red/issues/6#issuecomment-956610>

    I would suggest a note in the spec would be sufficient for now unless it is critical for building Red.

--------------------------------------------------------------------------------

On 2011-04-08T22:42:58Z, earl, commented:
<https://github.com/red/red/issues/6#issuecomment-976107>

    Note added to the spec in commit 01f90f8779b764907a1714a717dfdb9bb2bcf3ef.

--------------------------------------------------------------------------------

On 2011-05-05T20:07:03Z, dockimbel, commented:
<https://github.com/red/red/issues/6#issuecomment-1107878>

    Global c-string variables do not act as constants anymore.

--------------------------------------------------------------------------------

On 2011-05-09T11:32:24Z, dockimbel, commented:
<https://github.com/red/red/issues/6#issuecomment-1122331>

    Tested OK.

