
#2913: Red/System structure test failures under FreeBSD
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/2913>

```text
~~~started test~~~ struct!

===group=== Struct passed/returned by value
--test-- svb11 FAILED**************
--test-- svb12 FAILED**************
--test-- svb12 FAILED**************
--test-- svb16.3 FAILED**************
--test-- svb17.3 FAILED**************
--test-- svb17.3 FAILED**************
--test-- loc-svb11 FAILED**************
--test-- loc-svb12 FAILED**************
--test-- loc-svb12 FAILED**************
--test-- loc-svb16.3 FAILED**************
--test-- loc-svb17.3 FAILED**************
--test-- loc-svb17.3 FAILED**************
--test-- svb30.3 FAILED**************
--test-- svb31.3 FAILED**************
--test-- svb31.3 FAILED**************
~~~finished test~~~ struct!
  Number of Tests Performed:      143
  Number of Assertions Performed: 552
  Number of Assertions Passed:    537
  Number of Assertions Failed:    15
****************TEST FAILURES****************
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-22T12:49:12Z, dockimbel, commented:
<https://github.com/red/red/issues/2913#issuecomment-317181487>

    All tests are passing now.
    
    @PeterWAWood The libstruct.so that is used by run-all.r is invalid on my FreeBSD image, I had to recompile it manually to run the tests. This is the message I get:
    ```
    /usr/local/lib/compat/libc.so.6: version GLIBC_2.1.3 required by /root/red/quick-test/runnable/libstructlib.so not defined
    ```
    I will upload my version, and let you test it.

