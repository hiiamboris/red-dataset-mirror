
#3192: Changing FALSE value changes also literal #[FALSE]
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/3192>

### Expected behavior

```
>> false: "bad stuff"
== "bad stuff"
>> #[false]
== false
```

### Actual behavior

```
>> false: "bad stuff"
== "bad stuff"
>> #[false]
== "bad stuff"
```

### Steps to reproduce the problem

See above code. In Rebol it works as expected. 

The same error happens also with `true` and `none`.

### Red version and build date, operating system with version.

Linux Ubuntu 17.10

```
>> system/build
== make object! [
    date: 4-Jan-2018/9:25:48+01:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-01-09T05:32:44Z, dockimbel, commented:
<https://github.com/red/red/issues/3192#issuecomment-356185073>

    This looks like console-related, if you change core words, the console may not function properly anymore. In Rebol, the console is written in C, so it won't get affected by such redefinitions.

--------------------------------------------------------------------------------

On 2018-03-14T12:40:23Z, dockimbel, commented:
<https://github.com/red/red/issues/3192#issuecomment-373006617>

    There is no fix we can provide for that for now, it needs to wait for modules support, where core words will be by default protected from redefinition.

