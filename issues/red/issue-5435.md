
#5435: Append binary in func leaks
================================================================================
Issue is closed, was reported by SkySpiral7 and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5435>

**Describe the bug**
Appending to a binary value within a function only works as intended the first time the function is called. After that there's a memory leak that causes wrong behavior.

This could be same issue as https://github.com/red/red/issues/5320 except I'm not using `/part` and my issue only happens in a `func`.

**To reproduce**
```red
Red []

;When not in a func this works as expected
print ["#{00} == " append #{} 0]
print ["#{00} == " append #{} 0]
print ""

;However a func has some kind of memory leak (interpret vs compile doesn't make a difference)
funky: func[][print ["#{01} == " append #{} 1]]
probe :funky
funky
probe :funky
funky
print ""

;This work around ignores the issue. It allows the functionality to work but internally it will still keep building forever
funky: func[][print ["#{02} == " append clear #{} 2]]
probe :funky
funky
probe :funky
funky
```

**Expected behavior**
```
#{00} ==  #{00}
#{00} ==  #{00}

func [][print ["#{01} == " append #{} 1]]
#{01} ==  #{01}
func [][print ["#{01} == " append #{} 1]]
#{01} ==  #{01}

func [][print ["#{02} == " append clear #{} 2]]
#{02} ==  #{02}
func [][print ["#{02} == " append clear #{} 2]]
#{02} ==  #{02}
```

**Actual behavior**
```
#{00} ==  #{00}
#{00} ==  #{00}

func [][print ["#{01} == " append #{} 1]]
#{01} ==  #{01}
func [][print ["#{01} == " append #{01} 1]]
#{01} ==  #{0101}

func [][print ["#{02} == " append clear #{} 2]]
#{02} ==  #{02}
func [][print ["#{02} == " append clear #{02} 2]]
#{02} ==  #{02}
```

**Platform version**
Tested with red-27nov23-1ccc290eb on Ubuntu:
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5065 date: 27-Nov-2023/1:15:18 commit: #1ccc290eb4ca15aea9a20eabbd258719169677e7 ]
PLATFORM: [ name: "Ubuntu 22.04.3 LTS" OS: 'Linux arch: 'x86_64 version: 6.2.0 build: {#38~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Thu Nov  2 18:01:13 UTC 2} ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-29T11:18:16Z, dockimbel, commented:
<https://github.com/red/red/issues/5435#issuecomment-1831701866>

    Thanks for the well-written report! 👍 However, that is part of the core language semantics, so not a bug: https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values

--------------------------------------------------------------------------------

On 2023-12-03T00:46:35Z, SkySpiral7, commented:
<https://github.com/red/red/issues/5435#issuecomment-1837294781>

    That response was polite and educational. Looks like what I expected isn't how red is expected to behave. It's not a bug, it's a performance feature. I like the idea of avoiding unnecessary copies so I like this feature. Thanks.

