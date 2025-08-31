
#3100: `find` implicitly casts char to integer
================================================================================
Issue is closed, was reported by toomasv and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3100>

### Expected behavior
```
>> find [103 23 #"g" 56 11 #"8"] #"g"
== [#"g" 56 11 #"8"]
```
### Actual behavior
```
>> find [103 23 #"g" 56 11 #"8"] #"g"
== [103 23 #"g" 56 11 #"8"]
```
### Steps to reproduce the problem
Try to find `char` value in a block containing its integer value before it.
### Red version and build date, operating system with version.
```
>> system/version
== 0.6.3
>> system/build
== make object! [
    date: 7-Nov-2017/23:05:16+02:00
```
Win10Pro



Comments:
--------------------------------------------------------------------------------

On 2017-11-09T09:56:10Z, dockimbel, commented:
<https://github.com/red/red/issues/3100#issuecomment-343104217>

    @qtxie I think we need a `COMP_FIND` mode.

--------------------------------------------------------------------------------

On 2017-11-11T09:41:23Z, qtxie, commented:
<https://github.com/red/red/issues/3100#issuecomment-343652805>

    @dockimbel Yes. I'll implement it.

--------------------------------------------------------------------------------

On 2017-11-13T06:53:42Z, qtxie, commented:
<https://github.com/red/red/issues/3100#issuecomment-343829630>

    @Yes. I'll implement it.

