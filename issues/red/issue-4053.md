
#4053: [Compiled] Weird error when calling interpreted `continue` from a compiled loop
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4053>

Looks related to https://github.com/red/red/issues/1169

**Describe the bug**

Compile the following code:
```
Red []
foo: function [][do [continue]]
loop 3 [
    print "foo"
    foo
]
```
It compiles then outputs:
```
root size: 2393, root max: 4271, cycles: 0, before: 1090052, after: 1051316
root size: 2393, root max: 4271, cycles: 1, before: 1087708, after: 1087708
foo

*** Runtime Error 95: no CATCH for THROW
*** in file: common.reds
*** at line: 260
***
***   stack: ***-uncaught-exception
***   stack: ***-uncaught-exception
```

**Expected behavior**

Should output "foo" 3 times, or give a *helpful* error message.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Sep-2019/22:36:30+03:00 commit #f753e25
```



Comments:
--------------------------------------------------------------------------------

On 2019-09-26T18:07:47Z, qtxie, commented:
<https://github.com/red/red/issues/4053#issuecomment-535621950>

    GC bug?

--------------------------------------------------------------------------------

On 2019-09-26T18:33:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4053#issuecomment-535631478>

    No, unlikely.

