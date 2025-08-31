
#4751: Faulty integer-ranges loading
================================================================================
Issue is closed, was reported by toomasv and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4751>

I have found two ranges of integers erroneously evaluated:
`4294967296 - 6442450943` and `8589934592 - 9999999999`
```
>> 4294967296
== 0
>> 6442450943
== 2147483647

>> 8589934592
== 0
>> 9999999999
== 1410065407
```
Compare consecutive binaries in the start and end of first range:
```
>> to-binary 4294967295
== #{41EFFFFFFFE00000}
>> to-binary 4294967296
== #{00000000}
>> to-binary 4294967297
== #{00000001}
>> 
>> to-binary 6442450942
== #{7FFFFFFE}
>> to-binary 6442450943
== #{7FFFFFFF}
>> to-binary 6442450944
== #{41F8000000000000}
```
And the other range:
```
>> to-binary 8589934591
== #{41FFFFFFFFF00000}
>> to-binary 8589934592
== #{00000000}
>> to-binary 8589934593
== #{00000001}
>> 
>> to-binary 9999999998
== #{540BE3FE}
>> to-binary 9999999999
== #{540BE3FF}
>> to-binary 10000000000
== #{4202A05F20000000}
```

**Expected behavior**

Integers in these ranges should be converted to floats.

**Platform version**

```
Red 0.6.4 for Windows built 8-Dec-2020/23:03:34+02:00 commit #98457f4
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-10T07:21:32Z, qtxie, commented:
<https://github.com/red/red/issues/4751#issuecomment-742296276>

    https://github.com/red/red/blob/master/runtime/lexer.reds#L1252-L1256
    ```
    loop len [
    	i: 10 * i + as-integer (p/1 - #"0")
    	o?: o? or system/cpu/overflow?
    	p: p + 1
    ]
    ```
    When loading `4294967296`, `o?` was `false` while it should be `true`. We have to do the overflow checking after each math operation, otherwise the overflow flag will be overwritten.
    ```
    i: 10 * i
    o?: o? or system/cpu/overflow?
    i: i + as-integer (p/1 - #"0")
    o?: o? or system/cpu/overflow?
    ```
    Another issue is that `load-integer` ran twice in the console when loading. Adding a log message (probe "load-integer") in the beginning of `load-integer`:
    ```
    >> 4294967295
    load-integer
    load-integer
    == 4294967295.0
    ```

