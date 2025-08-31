
#4314: RS literal array get corrupted when compiling in debug mode.
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4314>

**To reproduce**
1. Compiling the following code in debug mode:
```
Red/System []

test1: func [/local list [int-ptr!]][
	list: ["base" 4]
	probe as c-string! list/1
	probe list/2
]

test1
```
2. Run the generated executable file:
```
*** Runtime Error 1: access violation
*** in file: /D/EE/QW/red/system/runtime/libc.reds
*** at line: 184
***
***   stack: prin FC000000h
***   stack: _print 1 0019FF40h false
***   stack: print-line 1 0019FF40h
***   stack: test1
```
**Expected behavior**
Output:
```
base
4
```

**Platform version (please complete the following information)**
Red 0.6.4 for Windows built 18-Feb-2020/22:08:58+08:00 commit #b7c6374



Comments:
--------------------------------------------------------------------------------

On 2022-06-20T20:02:56Z, dockimbel, commented:
<https://github.com/red/red/issues/4314#issuecomment-1160804150>

    Testing using latest commit on master, it runs fine now. The literal arrays have been changed since the opening of this ticket to remove the implicit size at index 0. As a side-effect, it has also made this issue disappear.

