
#5232: [Parse] Collecting broken after `keep pick`
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5232>

**Describe the bug**

Not enough that there's no supported *appending* behavior in Parse's `collect`, even present collecting modes are totally broken by `keep pick`:
```
      parse/case [a b c @ d e f] [collect set   x any [@ keep pick ('-) | keep skip]] ? x
x: [] parse/case [a b c @ d e f] [collect into  x any [@ keep pick ('-) | keep skip]] ? x
x: [] parse/case [a b c @ d e f] [collect after x any [@ keep pick ('-) | keep skip]] ? x
```
Result:
```
X is a block! value.  length: 7  [a b c - d e f]

X is a block! value.  length: 7  [d e f a b c -]

X is a block! value.  length: 4 index: 4 [a b c -]
```

**Expected behavior**
```
X is a block! value.  length: 7  [a b c - d e f]

X is a block! value.  length: 7  [a b c - d e f]

X is a block! value.  length: 7 index: 8 []
```

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4532 date: 6-Oct-2022/6:24:41 commit: #0657e2239680d6071a4f22f467031deeb0fd9f2d ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-10-23T11:23:54Z, dockimbel, commented:
<https://github.com/red/red/issues/5232#issuecomment-1288090153>

    For  `collect into` case, this ticket is a duplicate of #2189.

--------------------------------------------------------------------------------

On 2022-10-23T11:59:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/5232#issuecomment-1288096042>

    How so? I'm not using `collect` *function* here.

--------------------------------------------------------------------------------

On 2022-10-23T12:09:14Z, dockimbel, commented:
<https://github.com/red/red/issues/5232#issuecomment-1288098055>

    I saw that `collect into` was used in the Parse rules in #2189, so I suspected it might be the same issue. But I missed the first comment.

--------------------------------------------------------------------------------

On 2022-10-24T13:26:03Z, dockimbel, commented:
<https://github.com/red/red/issues/5232#issuecomment-1289032929>

    `collect after` behavior has also been fixed in the process. [It now behaves](https://github.com/red/docs/commit/c98c38677f49e52fa5ebce0ab595c98468a88fb8) as it was intended from the beginning. `collect into` now also [preserves](https://github.com/red/docs/commit/d0ccda534cbafec540eb4a2804efa32f5fbe1840) the collecting series index.

