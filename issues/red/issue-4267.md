
#4267: [GTK] shift + tab not handled properly
================================================================================
Issue is closed, was reported by loziniak and has 0 comment(s).
[status.built] [GUI] [GUI.GTK]
<https://github.com/red/red/issues/4267>

I get wrong results when pressing [SHIFT] + [TAB] on a field. Notice `#"^@"` in on-key-down and in on-key `left-shift` instead of `#"^-"` and `shift?` being `false`:
```
>> view [field on-key-down [probe event/key probe event/shift?]]
left-shift
false
#"^@"
true
```
```
>> view [field on-key [probe event/key probe event/shift?]]
left-shift
false
```

In Windows (Wine) it works as expected:
```
>> view [field on-key-down [probe event/key probe event/shift?]]
left-shift
true
#"^-"
true
```
```
>> view [field on-key [probe event/key probe event/shift?]]
#"^-"
true
```

It could be related to #3168 .

Platform: Red 0.6.4 for Linux built 23-Jan-2020/16:19:08+01:00


