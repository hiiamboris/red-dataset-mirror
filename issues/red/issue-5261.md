
#5261: Junk results from `and` on binary
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5261>

**Describe the bug**
```
>> #{112233} and complement #{FF}
== #{00008F}
>> #{112233} and complement #{FF}
== #{000011}

>> #{112233} and #{FF}
== #{110014}
>> #{112233} and #{FF}
== #{11004C}
```
For some reason no junk in `or` or `xor`

**To reproduce**
```
loop 1e5 [unless #{110000} = x: #{112233} and #{FF} [print x]]
```

**Expected behavior**

No junk bytes

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4612 date: 9-Dec-2022/7:12:47 commit: #ce6e33c1dc44fc32bdaeb7f804ac93d98b9af863 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```



Comments:
--------------------------------------------------------------------------------

On 2022-12-28T19:43:02Z, meijeru, commented:
<https://github.com/red/red/issues/5261#issuecomment-1366878794>

    In `do-math` in `binary.reds@ 1371 sqq.`, a point of difference I see is the use of `fill` vs. `copy-memory`. 

--------------------------------------------------------------------------------

On 2022-12-29T15:20:49Z, dockimbel, commented:
<https://github.com/red/red/issues/5261#issuecomment-1367405961>

    A more direct way to reproduce the `fill`-related issue:
    
    ````
    Red []
    
    #system [
    	show: func [s [c-string!] len [integer!] /local i [integer!]][
    	    i: 1
    	    while [i < len][prin-2hex as-integer s/i i: i + 1]
    	    prin "^/"
    	]
    
    	s: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    	len: length? s
    	p: as byte-ptr! s
    
    	show s len
    	fill p + 1 p + 3 null-byte
    	show s len
    ]
    ```` 
    results in:
    ````
    4142434445464748494A4B4C4D4E4F50515253545556575859
    4100434400000048494A4B4C4D4E4F50515253545556575859
    ````

