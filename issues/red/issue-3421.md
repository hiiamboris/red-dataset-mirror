
#3421: read-clipboard stops working after view/unview
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3421>

Note that below issue works for some but not for others. 

https://gitter.im/red/bugs?at=5b1f033dc277fb705dc5c9fa
https://gitter.im/red/bugs?at=5b1f5a5b70d89b3a318eeb83

### Expected behavior

`read-clipboard` should return the string in clipboard.
`write-clipboard` should put the given string into clipboard.

### Actual behavior

`read-clipboard` returns `none`
`write-clipboard` returns `false` and doesn't set clipboard text.

### Steps to reproduce the problem

```
>> read-clipboard
== "test"
>> view [button "ok" [unview]]
>> read-clipboard
== none
```

### Red and platform version
```
Win8.1 & Win10 x64
Red 0.6.3 for Windows built 11-Jun-2018/13:34:14+03:00 commit #de47b6c
```


