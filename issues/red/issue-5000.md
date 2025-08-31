
#5000: CRASH when molding UTF8 string loaded from binary
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5000>

**Describe the bug**
```
>> load #{223322}             ;) no BOM
== "3"
>> load #{EFBBBF223322}       ;) has BOM

*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/runtime/unicode.reds
*** at line: 570
***
***   stack: red/unicode/load-utf8-buffer 05643303h 3 00000000h 00000000h false
***   stack: red/unicode/load-utf8 056432F0h 3
***   stack: red/symbol/make-red-string 052E9528h
***   stack: red/string/alter 0497C40Ch 052E9528h 91531520 0 true 0
***   stack: red/string/concatenate 0497C40Ch 052E9528h 91531520 0 true false
***   stack: red/string/form 052E9528h 0497C40Ch 0497C40Ch 178
***   stack: red/word/form 05643340h 0497C40Ch 0497C40Ch 178
***   stack: red/word/mold 05643340h 0497C40Ch false false false 0497C40Ch 178 0
***   stack: red/actions/mold 05643340h 0497C40Ch false false false 0497C40Ch 178 0
***   stack: red/block/mold-each 0497C3FCh 0497C40Ch false false false 0497C40Ch 178 0
***   stack: red/block/mold 0497C3FCh 0497C40Ch false false false 0497C40Ch 178 0
***   stack: red/actions/mold 0497C3FCh 0497C40Ch false false false 0497C40Ch 179 0
***   stack: red/actions/mold* -1 -1 -1 1
***   stack: ctx||557~do-command 05751AE8h
***   stack: ctx||557~eval-command 05751AE8h
***   stack: ctx||557~run 05751AE8h
***   stack: ctx||557~launch 05751AE8h
***   stack: ctx||576~launch 057514FCh
```

**To reproduce**

Above. Or create a file with both BOM and a string within, then `load %file`.
Only debug console crashes. Release console happily parses it's own memory:
```
>> load #{EFBBBF223322}
*** Access Error: invalid UTF-8 encoding: #{A074A942}
*** Where: mold
*** Stack:
```

**Platform version**
```
Red 0.6.4 for Windows built 6-Nov-2021/19:36:18+03:00  commit #30e5312
```



Comments:
--------------------------------------------------------------------------------

On 2021-11-26T15:17:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5000#issuecomment-980052442>

    it loads BOM as word, then crashes trying to mold it:
    ```
    >> length? load #{EFBBBF223322}
    == 2
    >> b: load #{EFBBBF223322} ()
    >> type? b/1
    == word!
    ```

--------------------------------------------------------------------------------

On 2021-12-31T00:17:54Z, dockimbel, commented:
<https://github.com/red/red/issues/5000#issuecomment-1003219983>

    I can't believe I've missed that... thanks!

