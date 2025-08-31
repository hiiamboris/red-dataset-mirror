
#3410: rejoin inserts newline in wrong position
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/3410>

### Expected behavior
```
>> line: <test>
== <test>
>> rejoin [line "^/"]
== <test>
{{newline here}}
```

### Actual behavior
```
>> line: <test>
== <test>
>> rejoin [line "^/"]
== <test 
{{newline here}}
>
```

### Steps to reproduce the problem

Execute above code. Only applicable to `tag!` values?
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 669 date: 27-Apr-2018/10:07:23 commit: #4c36108655f3410124f8539543cbd4bc4525fed1 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-09T09:36:12Z, meijeru, commented:
<https://github.com/red/red/issues/3410#issuecomment-395955215>

    On second thoughts, this makes sense since `< >` are brackets like `{  }` or `"   "`. Rebol does the same.
    I close this issue.

--------------------------------------------------------------------------------

On 2018-06-09T21:30:05Z, greggirwin, commented:
<https://github.com/red/red/issues/3410#issuecomment-396000138>

    `Rejoin`ing tags has always been a little confusing. It's consistent, but non-obvious.

