
#2298: some problems with return float from routine
================================================================================
Issue is closed, was reported by yykav and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2298>

Source:
```
Red []

test: routine [ v [binary!] return: [float!] ] [ 123.456 ]

f: test #{0102030405060708090A0B0C}
print f
print test #{0102030405060708090A0B0C}

print [test #{0102030405060708090A0B0C}]
f: 2.0 * test #{0102030405060708090A0B0C}
print f
print [2.0 * test #{0102030405060708090A0B0C}]
```
[test1.red.txt](https://github.com/red/red/files/568925/test1.red.txt)

Output:
```
$ cat test1.red
Red []

test: routine [ v [binary!] return: [float!] ] [ 123.456 ]

f: test #{0102030405060708090A0B0C}
print f
print test #{0102030405060708090A0B0C}

print [test #{0102030405060708090A0B0C}]
f: 2.0 * test #{0102030405060708090A0B0C}
print f
print [2.0 * test #{0102030405060708090A0B0C}]

$ red-061.exe -c test1.red

-=== Red Compiler 0.6.1 ===-

Compiling g:\os\red\test1.red ...
...compilation time : 1484 ms

Compiling to native code...
...compilation time : 43073 ms
...linking time     : 391 ms
...output file size : 487424 bytes
...output file      : g:\os\red\test1.exe


$ test1.exe
123.456
123.456
#{0102030405060708090A0B0C}
246.912
*** Script Error: binary! type is not allowed here
*** Where: *
*** Stack: print *

$
```
[out.txt](https://github.com/red/red/files/568929/out.txt)



Comments:
--------------------------------------------------------------------------------

On 2017-02-18T12:11:28Z, dockimbel, commented:
<https://github.com/red/red/issues/2298#issuecomment-280841707>

    Good catch! Strangely, it seems we forgot to add float values marshalling support for routines run from the interpreter.

