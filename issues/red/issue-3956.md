
#3956: Cannot access value in deep nested object when compiled
================================================================================
Issue is open, was reported by qtxie and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/3956>

**Describe the bug**
Compile the following code and run:
```
Red []
d: context [
	value: 998
    f: does [value]
]
h: :d/f

ro6-o: make object! copy [
	a: make object! copy [
	b: make object! copy [ 
	c: make object! copy [
	d: make object! copy [
	e: make object! copy [
	f: make object! copy [
	g: make object! copy [
	h: make object! copy [
	i: make object! copy [
	j: make object! copy [
	k: make object! copy [ data: "12345678901234567890" ]
] ] ] ] ] ] ] ] ] ] ]

ro6-o/a/b/c/d/e/f/g/h/i/j/k/data: none
```
Will get errors:
```
root: 2556/4335, runs: 0, mem: 1090580 => 1048084, mark: 2.9ms, sweep: 0.0ms
root: 2556/4335, runs: 1, mem: 1088076 => 1088076, mark: 1.0ms, sweep: 0.0ms
*** Script Error: cannot access f in path none
*** Where: eval-set-path
*** Stack:
```

**Platform version (please complete the following information)**
All



