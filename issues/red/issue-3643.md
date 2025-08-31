
#3643: Red evaluates 2.022794416824728e-308 == 2.2250738585072014e-308 / 1.1 inconsistently across platforms
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3643>

**Describe the bug**
Red evaluates 2.022794416824728e-308 == 2.2250738585072014e-308 / 1.1 inconsistently across platforms. It returns true on Linux and macOS but false on Windows.

**To Reproduce**
Evaluate `2.022794416824728e-308 == 2.2250738585072014e-308 / 1.1`
**Expected behavior**
The behaviour of Red is as consistent as possible across all platforms.
(I have checked with Java and JavaScript and both return true for the expression on Windows.)
A decision is required as to which behaviour is desired:

1. Such expressions should evaluate to true on all platforms
2. Such expressions should evaluate to false on all platforms
3. Red will evaluate such expressions differently on different platforms.

The decision then needs to be implemented. Choice 3 will require the test suite to distinguish which platform it is being run on.

**Platform version(please complete the following information):**
```
Red 0.6.4 for macOS, Ubuntu32, Windows7, Windows10 built 8-Dec-2018/15:08:13+08:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-10T10:46:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/3643#issuecomment-445771685>

    on Windows:
    ```
    >> to-binary 2.022794416824728e-308
    == #{000E8BA2E8BA2E8A}
    ```
    on Linux:
    ```
    >> to-binary 2.022794416824728e-308
    == #{000E8BA2E8BA2E8B}
    ```
    Note the last bit.

--------------------------------------------------------------------------------

On 2018-12-11T02:07:42Z, qtxie, commented:
<https://github.com/red/red/issues/3643#issuecomment-446045759>

    It's an old issue and it's caused by the C's `strtod` is different in each platform. It can be fixed by using our own `strtod`.

--------------------------------------------------------------------------------

On 2020-05-20T07:55:06Z, qtxie, commented:
<https://github.com/red/red/issues/3643#issuecomment-631304982>

    The latest Red returns `false` on 3 platforms (Linux, macOS, Windows).

