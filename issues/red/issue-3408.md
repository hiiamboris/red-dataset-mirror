
#3408: Inconsistent compiler crash when compiling nested objects
================================================================================
Issue is open, was reported by PeterWAWood and has 0 comment(s).
[type.bug] [type.compiler]
<https://github.com/red/red/issues/3408>

When compiling nested objects, the compiler crashes when compiling objects nested more than 13 deep as part of a larger program. It happily compiles objects nested up to 15 deep on their own.

The compiler crashes when it comes across `--test-- "no5"`  in object-test.red but can compile it when it is isolated in a separate program:
```text
Red[]

#include %../../Red/red/quick-test/quick-test.red
--test-- "no5"
	no5-o1: make object! [
		o2: make object! [
		o3: make object! [
		o4: make object! [
		o5: make object! [
		o6: make object! [
		o7: make object! [
		o8: make object! [
		o9: make object! [
		o10: make object! [
		o11: make object! [
		o12: make object! [
		o13: make object! [
		o14: make object! [
		o15: make object! [
			i: 1
		]]]]]]]]]]]]]]
	]
	--assert no5-o1/o2/o3/o4/o5/o6/o7/o8/o9/o10/o11/o12/o13/o14/o15/i = 1 
```

### Expected behavior
Test no5 passes
### Actual behavior
tests/source/units/object-test.red - compiler error


-=== Red Compiler 0.6.3 ===- 

Compiling /Users/peter/VMShare/Red/red/tests/source/units/object-test.red ...
...using libRedRT built on 7-Jun-2018/9:38:54+8:00
...compilation time : 627 ms

Target: Darwin 

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : at expected index argument of type: number logic pair 
*** Where: resolve-import-refs 
*** Near:  [change at code ref form-struct] 
### Steps to reproduce the problem
Remove the comments in test-no5 in object-test.red and run the test.

### Red and platform version
macOS 10.12.16
commit 3f3c037f0fcfa6394f398db8bae266888ad8ca93 (HEAD -> master, upstream/master)


