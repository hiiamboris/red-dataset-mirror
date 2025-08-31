
#3763: [Red/System] negative float starting with zero crashes compiler
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
<https://github.com/red/red/issues/3763>

**Describe the bug**

Negative floating point numbers starting with zero after decimal point (`-0.01`, `-0.00025`, etc.) will crash compiler with strange error.

**To reproduce**
Steps to reproduce the behavior:

Compile following source:

```
Red/System[]

x: -0.00000008742278

print x
```

When I try to compile it, I get following error:

```
Compiling to native code...
*** Compilation Error: unknown directive .0- 
*** in file: %/home/sony/Code/sint/test.reds 
*** at line: 3 
*** near: [#.0- 8742278 
    print x
]
```

**Expected behavior**
It should compile just fine.


**Platform version (please complete the following information)**
```
>> about
Red 0.6.4 for Linux built 25-Jan-2019/12:19:17+01:00
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-01T22:30:31Z, gltewalt, commented:
<https://github.com/red/red/issues/3763#issuecomment-459890255>

    #3297

--------------------------------------------------------------------------------

On 2019-02-04T11:38:42Z, rebolek, commented:
<https://github.com/red/red/issues/3763#issuecomment-460217926>

    The problem is that lexer changes `-0.01` to `#.0- 1`, because it treats `-0.0` as `decimal-special`, even if it's followed by another digit.

