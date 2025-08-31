
#3624: Difference in how compiler and interpreter evaluate replace/case/all quote :a/b/A/a/B [a] 'x
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/3624>

**Describe the bug**
Difference in how compiler and interpreter evaluate replace/case/all quote :a/b/A/a/B [a] 'x
```text
replace/case/all quote :a/b/A/a/B [a] 'x - compiled
::a/b/A/x/B

replace/case/all quote :a/b/A/a/B [a] 'x - interpreted
:x/b/A/x/B
```

**To Reproduce**
Run this code:

```
Red[]

print "replace/case/all quote :a/b/A/a/B [a] 'x - compiled"
probe replace/case/all quote :a/b/A/a/B [a] 'x
print ""
print "replace/case/all quote :a/b/A/a/B [a] 'x - interpreted"
probe do [ replace/case/all quote :a/b/A/a/B [a] 'x ]
``` 

**Expected behavior**
A clear and concise description of what you expected to happen.

**Platform version(please complete the following information):**
commit 1e0d5ec2360b336ef8111546e3221024dc28e31f (HEAD -> master, upstream/master)


Comments:
--------------------------------------------------------------------------------

On 2019-11-23T21:24:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/3624#issuecomment-557834111>

    Not `replace`'s fault:
    
    `quote :a/b/A/a/B` >>
    ```
    :a/b/A/a/B   ;) interpreted
    ::a/b/A/a/B  ;) compiled
    ```

--------------------------------------------------------------------------------

On 2020-07-30T17:43:28Z, 9214, commented:
<https://github.com/red/red/issues/3624#issuecomment-666556797>

    Turns out https://github.com/red/red/issues/4451 was a dupe of this one.

