
#3662: [Lexer] Hex literals inconsistencies and bugs
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[type.bug] [type.compiler]
<https://github.com/red/red/issues/3662>

**Describe the bug**
R/S and Red lexers treat these differently, and Red compiler is buggy.

**To reproduce**

**In the interpreter:**
```
>> print [10h 100h 1000h 10000h 100000h 1000000h]
16 256 4096 65536 1048576 16777216
```
That was totally OK!

**Compiled:**
```
Red []
print [10h 100h 1000h 10000h 100000h 1000000h]
```
Prints:
```
16 0 4096 0 1048576 0
```
what???

**R/S:**
```
Red/System []
print-line 100h
```
Prints:
```
Compiling to native code...
*** Loading Error: invalid hex literal: 100h
*** in file: %/D/devel/red/red-src/tests/1.reds
*** at line: 3
```

**Red routine:**
```
Red []
r: routine [][print-line 100h]
r
```
Prints:
```
0
```

**Expected behavior**
All scenarios should follow the interpreted behavior.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 7-Dec-2018/8:41:53+03:00 commit #1bdbdc2
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-14T23:21:40Z, endo64, commented:
<https://github.com/red/red/issues/3662#issuecomment-447508035>

    Confirmed on Win10, `Red 0.6.4 for Windows built 6-Dec-2018/4:52:41+03:00 commit #08e9d17`

--------------------------------------------------------------------------------

On 2018-12-26T15:33:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/3662#issuecomment-449982368>

    One more bit: unlike Red, R/S accepts 2-, 4- and 8-digit hex literals. Nothing in between, not even FFFFFFh (6-digit) and such.

--------------------------------------------------------------------------------

On 2020-08-12T14:13:20Z, 9214, commented:
<https://github.com/red/red/issues/3662#issuecomment-672896401>

    ```red
    >> 1h
    == 1
    >> 10000000h
    == 268435456
    >> 100000000h
    == 0
    ```
    IMO error message on invalid integer in the first and the last cases is preferrable.

