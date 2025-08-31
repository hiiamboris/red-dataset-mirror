
#3832: [VID] Cannot give multiple flags in VID dialect
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/3832>

**Describe the bug**
When using multiple `flags` for a face, first one takes priority and the rest doesn't work.

**To reproduce**

```
>> view [fld: field all-over no-border do [? fld/flags]]
== FLD/FLAGS is a word! value.  all-over
```


**Expected behavior**
`flags` should be `[all-over no-border]`

**Screenshots**

![image](https://user-images.githubusercontent.com/840604/55290425-f1222200-53db-11e9-8b42-eb8e3bec4113.png)

`no-border` didn't get into account.

**Platform version**
```
RED: [ branch: "master" tag: #v0.6.3 ahead: 1317 date: 14-Mar-2019/17:49:29 commit: #43b26838b4a39cd20e06a9b6c2f5c2b873e058b7 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
```



