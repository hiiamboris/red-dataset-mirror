
#3443: setting each bit in initially empty bitset fails at index 128, 256 etc.
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3443>

### Expected behavior
Setting each bit of an initially empty bitset to `true` works for any index.
### Actual behavior
Bit 128 (0-origin indexing!) is not set. In fact every index that is a multiple of 128 fails.
### Steps to reproduce the problem
```
bs: make bitset! #{}
max: 135 idx: 0
until [
	bs/:idx: true
	idx: idx + 1
	idx > max
]
print [bs length? bs]
```
result: `make bitset! #{FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F} 136`
the one before last hex digit should be `F`, the missing bit is at position 128
note that the error does not occur with bitsets that are allocated and filled with `false` to the desired length beforehand, e.g. in the above case: `bs: make bitset! [136]`
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 638 date: 13-Apr-2018/13:41:05 commit: #f61a26f6d38ab4c67cc180d15a7a01b15556795c ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-24T16:40:55Z, meijeru, commented:
<https://github.com/red/red/issues/3443#issuecomment-399769640>

    I note that 128 = 4 * 32. Might it be a problem of allocation of additional space as the index grows beyond the already allocated bytes?

