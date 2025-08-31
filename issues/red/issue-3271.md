
#3271: macOS: event loop and resizing problem
================================================================================
Issue is closed, was reported by x8x and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3271>

### Expected behavior
code 1:
```
ok
ok
...
```
print `ok` every 15 seconds
### Actual behavior
code 1:
```
ok
ok
ok
ok
ok
...
```
while resizing `print 'ok` gets fired continuously.

code 2:
```
ok
[    console-2018-3-19-5009(6769,0xa97f61c0) malloc: *** error for object 0x6053b4: incorrect checksum for freed object - object was probably modified after being freed.
*** set a breakpoint in malloc_error_break to debug
ok
[    ok
[    console-2018-3-19-5009(6773,0xa97f61c0) malloc: *** error for object 0x6053b4: incorrect checksum for freed object - object was probably modified after being freed.
*** set a breakpoint in malloc_error_break to debug
ok
[    console-2018-3-19-5009(6759,0xa97f61c0) malloc: *** error for object 0x6053b4: incorrect checksum for freed object - object was probably modified after being freed.
*** set a breakpoint in malloc_error_break to debug
```
same as code 1 but with malloc error and crash
### Steps to reproduce the problem
Run this code on macOS and resize the Terminal window for a couple seconds
code 1:
```
forever [
	print 'ok
	wait 15
]
```
code 2:
```
forever [
	call/wait {sleep 1}
	print 'ok
	wait 15
]
```
### Red version and build date, operating system with version.
latest


Comments:
--------------------------------------------------------------------------------

On 2018-03-25T03:44:53Z, qtxie, commented:
<https://github.com/red/red/issues/3271#issuecomment-375943229>

    @x8x I pushed a fix. Should be working fine now.

