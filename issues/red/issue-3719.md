
#3719: Cannot cross-compile to Android
================================================================================
Issue is closed, was reported by manuelcaeiro and has 2 comment(s).
<https://github.com/red/red/issues/3719>

Red caught my attention with the (claimed) feature of being able to cross-compile to Android.
Cross-compilation to Windows and to Linux worked fine, but to Android does not seem to work.
Command and report:
D:\Games\red-ride>red-latest -t Android calculator.red

-=== Red Compiler 0.6.4 ===-

Compiling D:\Games\red-ride\calculator.red ...
...compilation time : 982 ms

Target: Android

Compiling to native code...
*** Warning: OS_TYPE macro in R/S is redefined
*** Compilation Error: invalid path value: image/extract-data
*** in file: %/D/Games/red-ride/datatypes/binary.reds
*** in function: red/binary/to
*** at line: 1
*** near: [1024x7
    proto: image/extract-data as red-image! spec EXTRACT_ARGB
]




Comments:
--------------------------------------------------------------------------------

On 2019-01-08T18:32:13Z, 9214, commented:
<https://github.com/red/red/issues/3719#issuecomment-452403709>

    Please consult your information sources before raising issues.
    
    Per [blog post](https://www.red-lang.org/2018/04/sneak-peek-at-red-on-android.html):
    > As a reminder, the current work on Android is done in a **private repository**, in order to keep control over the communication about Red on Android, as we want to maximize the announcement effect on that very important milestone.
    
    Android support is one of the next major milestones, and will likely come in 0.6.5 version (per recent [blog post](https://www.red-lang.org/2019/01/full-steam-ahead.html)):
    > With the integration of async I/O and ports, we will be able to complete the wrapping of the Android API using decent human-friendly abstractions. We need to advance Android support to at least beta level by the end of this year. This is one of the major goals we need to achieve.

