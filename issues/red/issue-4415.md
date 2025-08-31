
#4415: unexpected result of conversion from STRING! to PERCENT!
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4415>

**Describe the bug**

`string!` value that represents a literal `percent!` or `integer!` form yields an unexpected result when converted to `percent!`.

**To reproduce**

Master 1dcba29

```red
>> to percent! "100"
== 10000%
>> to percent! "100%"
== 10000%
>> to percent! "1.0"
== 100%
```

Fast lexer c69e1ca

```red
>> to percent! "100"
== 10000%
>> to percent! "100%"
*** Script Error: cannot MAKE/TO percent from: 100%
*** Where: to
*** Stack:  

>> to percent! "1.0"
== 100%
```

**Expected behavior**

```red
>> to percent! "100"
== 100%
>> to percent! "100%"
== 100%
```

**Platform version**

Latest, W10.


Comments:
--------------------------------------------------------------------------------

On 2020-05-14T13:35:25Z, dockimbel, commented:
<https://github.com/red/red/issues/4415#issuecomment-628639491>

    `100% = 1`, so `to percent! "100"` is expected to be `10000%`.

