# Issue #5649: Set does not complain on wrong path
<https://github.com/red/red/issues/5649>

**Describe the bug**
If you use `set` on non existing path you have no error

**To reproduce**


```
>> x: make object! [a: 22]
== make object! [
    a: 22
]
>> set 'x/aaaa 33
<no message here>
```

**Platform version**
```
RED: [ branch: "master" tag: #v0.6.6 ahead: 75 date: 13-Jul-2025/13:27:17 commit: #31205e5c6189648cfa852e73c71be1afc18445d0 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 26100 ]
```



## greggirwin on 2025-09-22T15:51:11Z
Somewhat related: https://github.com/red/red/issues/4550


## greggirwin on 2025-09-22T15:52:54Z
Also: https://github.com/red/red/issues/5300


## dockimbel on 2025-09-30T09:27:07Z
Fix pushed, but there's still an issue. `set/any 'x/aaaa 33` does not error out. I could have fixed that too but that would make it inconsistent with how it works for get-paths... There are clearly semantic issues that need to be addresses with the behavior of access paths both with and without `/any` option.


