
#2835: dyld: Library not loaded: @loader_path/libstructlib.dylib
================================================================================
Issue is closed, was reported by eranws and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2835>

Ran:
```
rebol -qs red.r clear
rebol -s run-all.r
```
on commit 9930e39ecab01af6d41c59e1253a7046389df62e
on MacOS 10.12, Darwin Kernel Version 16.6.0
All tests pass but this:
```
dyld: Library not loaded: @loader_path/libstructlib.dylib
  Referenced from: /Users/eranws/red/red/quick-test/runnable/struct-test
  Reason: image not found
** - struct*******************************************0 / 1 **
```




Comments:
--------------------------------------------------------------------------------

On 2017-06-25T10:09:58Z, dockimbel, commented:
<https://github.com/red/red/issues/2835#issuecomment-310894055>

    @PeterWAWood Could you please fix the `run-all.r` script, so that's it's on par with the `%system/tests/run-all.r` one?

