
#143: Library test fails on Mac OS (incompatible version), works on Linux
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/143>

I have started work on writing tests for the library interface. I have committed the files to run a simple test across three platforms (Windows, Linux & Mac OS X). The files are:

tests/source/units/lib-test-source.reds                            ;; the test file is generated from this
tests/source/units/make-lib-auto-test.r                            ;; generates the test file
test/source/units/libs/testlib1.pas                                     ;; the free pascal source of testlib1
test/source/units/libs/libtestlib1.dylib                               ;; Mac OS X
test/source/units/libs/libtestlib1.so                                   ;; Linux
test/source/uinits/libs/testlib1.dll                                      ;; Windows

The test runs successfully under Linux but fails when executing the Red/System program under Mac OS X stating an incompatible library version. 

```
>> pwd
== %/Users/peter/Languages/Red/red-system/tests/
>> do %source/units/make-lib-auto-test.r                            
Script: "Generates Red/System lib tests" (none)
>> do/args %run-test.r "%source/units/auto-tests/lib-auto-test.reds"
Script: "Builds and Runs a single Red/System Tests" (none)
Quick-Test v0.4.1
Running under REBOL 2.7.8.2.5
dyld: Library not loaded: /Users/peter/Languages/Red/red-system/tests/source/units/libs/libtestlib1.dylib
  Referenced from: /Users/peter/Languages/Red/red-system/tests/runnable/lib-auto-test
  Reason: Incompatible library version: lib-auto-test requires version 1.0.0 or later, but libtestlib1.dylib provides version 0.0.0
```



