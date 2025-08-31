
#1803: error on commented closing bracket
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/1803>

Type or paste the following into the console:

```
do [
    print "Hello, World!"
;]
```

Result:

```
red>> do [
[    print "Hello, World!"
[    ;]
*** Script error: get does not allow integer! for its word argument
*** Where: get
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-11T11:53:14Z, ghost, commented:
<https://github.com/red/red/issues/1803#issuecomment-208307127>

    @WiseGenius https://github.com/red/red/issues/1715

--------------------------------------------------------------------------------

On 2016-04-11T11:56:16Z, ghost, commented:
<https://github.com/red/red/issues/1803#issuecomment-208307922>

    Also https://github.com/red/red/issues/1781

