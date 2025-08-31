
#5375: `to float!` accepts arbitrary junk after exponent
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5375>

**Describe the bug**
```
>> to float! "1e0"
== 1.0
>> to float! "1ex"
== 1.0e72
>> to float! "1exy"
== 1.#INF
>> to float! "1e-xy"
== 0.0
>> to float! "1e/xy"
== 1.#INF
```

**To reproduce**
```
to float! "1e0"
to float! "1ex"
to float! "1exy"
to float! "1e-xy"
to float! "1e/xy"
```

**Expected behavior**

An error.

**Platform version**

`Red 0.6.4 for Windows built 25-Aug-2023/4:07:38+03:00  commit #10f54d6`


Comments:
--------------------------------------------------------------------------------

On 2023-09-01T17:34:04Z, greggirwin, commented:
<https://github.com/red/red/issues/5375#issuecomment-1703101528>

    `to percent!` correctly throws errors. The branch for the specific float type splits and uses `load-single-value` where the float branch uses `tokenizer/scan-float`. The value is assigned, and not cleared, if there's an error. May ultimately be `dtoa` not returning an error, but it seems like this would have shown up long ago in that case. It's a big, hairy func so I'll leave it to the experts there. 

