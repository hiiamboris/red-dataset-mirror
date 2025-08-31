
#3154: WISH: Math ops on pairs with floats should be same as with percent values
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/3154>

Multiply and divide `float!` with `pair!` should be allowed just as with `percent!`:

### Expected behavior

```
>> 12x12 * 0.5
== 6x6
```
### Actual behavior

Float value casts to integer:

```
>> 12x12 * 0.6
== 0x0
```

Should be same as with `percent!`

```
>> 12x12 * 50%
== 6x6
```


### Steps to reproduce the problem


### Red version and build date, operating system with version.

21-Dec-2017/1:59:20+03:00
Win10 x64



Comments:
--------------------------------------------------------------------------------

On 2017-12-21T09:31:40Z, dockimbel, commented:
<https://github.com/red/red/issues/3154#issuecomment-353302857>

    Agreed.

