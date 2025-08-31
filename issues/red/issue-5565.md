
#5565: React/link triggers on objects other than reactors
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 4 comment(s).
[status.built] [status.tested] [test.written] [type.design]
<https://github.com/red/red/issues/5565>

**Describe the bug**
Creating a queue of `react/link`, including a reactor and then 2 objects, the last object is also updated with the value while it should't as the item before it is an object and not a reactor. Also it is written the old value and not the new.

**To reproduce**

```
ctx1: make reactor! [
    a: 22
    b: 33
] 
ctx2: make object! [  ;<-------------- This should not react IMHO
    a: 44
    b: 66
]
ctx3: make object! [
    a: 77
    b: 99
]

f: func [
	s
	n
] [
	n/a: s/a
]

react/link :f reduce [ctx1 ctx2]
react/link :f reduce [ctx2 ctx3]

ctx1/a: "55"
probe ctx3
```

Result:

```
make object! [
    a: 22
    b: 99
]
```

**Expected behavior**

It shouldn't be updated, and also, it should receive the new value `"55"` and not old value of the `a` field in `ctx1`

@hiiamboris say it is an undefined design. Our discussion is [here](https://matrix.to/#/!mjbZGzLqlsqlDLaQVP:gitter.im/$mcaTYHg7XYidEphoD8dNyv-yVbumN51Z4gyA3E-HNvQ?via=gitter.im&via=matrix.org&via=tchncs.de)

**Platform version**
RED: [ branch: "master" tag: #v0.6.5 ahead: 211 date: 8-Nov-2024/21:54:12 commit: #fc80690c2fcc855ccbb960b4c42465a29cef44b9 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]



Comments:
--------------------------------------------------------------------------------

On 2024-11-26T15:01:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5565#issuecomment-2501049689>

    Minimal code:
    ```
    > react/link func [a b] [b/x: a/x] reduce [o1: object [x: 1] o2: object [x: 2]] ?? o2
    o2: make object! [
        x: 1        ;) changed, despite o1 not being a reactor
    ]
    ```

--------------------------------------------------------------------------------

On 2024-11-26T22:58:22Z, dockimbel, commented:
<https://github.com/red/red/issues/5565#issuecomment-2502124270>

    The reactivity framework now uses a more accurate check for object events presence using a new object reflective property `events?`.
    
    ```
    
    >> o: object [x: 1 on-change*: func [w o n][?? w]]
    == make object! [
        x: 1
    ]
    >> reflect o 'events?
    == true
    >> reflect o: object [x: 1] 'events?
    == false
    ```

