
#5228: [Regression] {Curly string} eats the new-line marker
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5228>

**Describe the bug**

Haven't been detected since new-lexer merge.
```
probe [
	what???
	{this is supposed to be on a new line!}
	{this too}
]
```
Outputs:
```
[
    what??? "this is supposed to be on a new line!" "this too"
]
```

**Expected behavior**

```
[
    what???
    "this is supposed to be on a new line!"
    "this too"
]
```

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4532 date: 6-Oct-2022/6:24:41 commit: #0657e2239680d6071a4f22f467031deeb0fd9f2d ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


