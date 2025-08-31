
#3640: [CRASH] Interoperability bug between libRedRT.so and the GC?
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3640>

**Describe the bug**
The following code crashes (on Linux only) when compiled with `-c` or `-c -u` options.

**To Reproduce**
Compile, execute:
```
Red []
repeat i 10 [
	append/dup b: copy [1 2 3] 1 i * 10000
	print mold/flat stats/info
	length? copy b
	print mold/flat stats/info
	recycle
	print mold/flat stats/info
	o: make object! []
	probe type? try [o/()]
	print "^/"
]
```
**Platform version(please complete the following information):**
```
Red 0.6.4 for Linux built 7-Dec-2018/9:41:53+04:00 commit #1bdbdc2
```
:point_up: [December 8, 2018 11:12 PM](https://gitter.im/red/bugs?at=5c0c25aaf4880a60a249e4b5)


Comments:
--------------------------------------------------------------------------------

On 2018-12-08T22:01:08Z, 9214, commented:
<https://github.com/red/red/issues/3640#issuecomment-445493163>

    Confirmed on 64-bit Mint installation.

--------------------------------------------------------------------------------

On 2018-12-09T06:54:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3640#issuecomment-445515578>

    Can reproduce on Ubuntu 16.04 64-bit.

