
#4299: /part argument to mold and form overshoots on system object and dates
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4299>

**Describe the bug**

```
;) correct:
>> mold/part [a b c] 3
== "[a "
>> mold/part object [a: "b c"] 3
== "mak"

;) buggy:
>> mold/part system 3
== "make object! [^/    ver"
>> length? mold/part system 3
== 22
>> mold/part system/words 3
== "make object! [^/    dat"
>> length? mold/part system/words 3
== 22
>> mold/part system/lexer 3
== "make"
>> length? mold/part system/lexer 3
== 4
>> mold/part system/build 3
== "make object!"
>> length? mold/part system/build 3
== 12

>> form/part system 3
== "version: 0.6.4^/build: "
>> length? form/part system 3
== 22
>> form/part system/words 3
== "datatype!: datatype!^/u"
>> length? form/part system/words 3
== 22
>> form/part system/lexer 3
== "pre-"
>> length? form/part system/lexer 3
== 4
>> form/part system/build 3
== "date: 19-Feb"
>> length? form/part system/build 3
== 12
```

**To reproduce**
```
mold/part system 3
length? mold/part system 3
mold/part system/words 3
length? mold/part system/words 3
mold/part system/lexer 3
length? mold/part system/lexer 3
mold/part system/build 3
length? mold/part system/build 3

form/part system 3
length? form/part system 3
form/part system/words 3
length? form/part system/words 3
form/part system/lexer 3
length? form/part system/lexer 3
form/part system/build 3
length? form/part system/build 3
```

**Expected behavior**

All results should be 3 chars long.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 19-Feb-2020/21:37:44+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-02T17:39:07Z, Oldes, commented:
<https://github.com/red/red/issues/4299#issuecomment-593524117>

    It is wrong with date too:
    ```red
    >> mold/part now 3
    == "2-Mar-2020/1"
    >> mold/part now 4
    == "2-Mar-2020/18"
    ```

--------------------------------------------------------------------------------

On 2020-03-21T14:25:24Z, 9214, commented:
<https://github.com/red/red/issues/4299#issuecomment-602050612>

    Wrong with dates that have time part inside them, to be precise:
    ```red
    >> mold/part now/date 0
    == ""
    >> mold/part now 0
    == "21-Mar-20"
    ```

--------------------------------------------------------------------------------

On 2021-11-01T07:37:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4299#issuecomment-956002055>

    And with escaped chars:
    ```
    >> print mold/part "^/^/" 0
    
    >> print mold/part "^/^/" 1
    "^         ;) expected "
    >> print mold/part "^/^/" 2
    "^/^       ;) expected "^
    >> print mold/part "^/^/" 3
    "^/^/      ;) expected "^/
    >> print mold/part "^/^/" 4
    "^/^/"     ;) expected "^/^
    ```

--------------------------------------------------------------------------------

On 2021-12-18T14:29:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4299#issuecomment-997210316>

    Now (since September 2021) it's the other way around:
    ```
    >> length? mold/part system 300
    == 115
    >> length? mold/part system 200
    == 15
    >> length? mold/part system 100
    == 0
    >> system
    == 
    ```

--------------------------------------------------------------------------------

On 2022-09-03T13:49:26Z, dockimbel, commented:
<https://github.com/red/red/issues/4299#issuecomment-1236124130>

    Issue has been fixed since the ticket was opened.

