
#5460: No overflow on NaN->integer
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5460>

**Describe the bug**
```
>> to integer! 1.#nan
== -2147483648
```
Propagates errors further.

**Expected behavior**

`Script Error: integer! overflow/underflow`

**Platform version**
`Red 0.6.4 for Windows built 30-Dec-2023/17:13:04+03:00  commit #f8f2559`


