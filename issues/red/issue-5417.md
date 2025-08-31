
#5417: Fishy new-line behavior in `keys-of`/`values-of`
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5417>

**Describe the bug**

If there's a system here I don't see it:
```
>> keys-of make object! [k1: 'v1 k2: 'v2 k3: 'v3]
== [k1 k2 k3]
>> values-of make object! [k1: 'v1 k2: 'v2 k3: 'v3]
== [v1 v2 v3]

>> to [] o: object new-line/all [k1: 'v1 k2: 'v2 k3: 'v3] on
== [
    k1: 'v1 
    k2: 'v2 
    k3: 'v3
]
>> to [] o: object new-line/all [k1: 1 k2: 2 k3: 3] on
== [
    k1: 
    1 
    k2: 
    2 
    k3: 
    3
]
>> keys-of o: object new-line/all [k1: 'v1 k2: 'v2 k3: 'v3] on
== [k1 k2 k3]
>> values-of o: object new-line/all [k1: 'v1 k2: 'v2 k3: 'v3] on
== [v1 v2 v3]
>> keys-of o: object new-line/all [k1: 1 k2: 2 k3: 3] on
== [k1 k2 k3]
>> values-of o: object new-line/all [k1: 1 k2: 2 k3: 3] on
== [
    1 
    2 
    3
]

>> keys-of make map! [1 2 3 4 5 6]
== [1 3 5]
>> values-of make map! [1 2 3 4 5 6]
== [2 4 6]
>> keys-of make map! new-line/all [1 2 3 4 5 6] on
== [
    1 
    3 
    5
]
>> values-of make map! new-line/all [1 2 3 4 5 6] on
== [
    2 
    4 
    6
]
>> keys-of make map! new-line/all [k1 v1 k2 v2 k3 v3] on
== [k1 k2 k3]
>> values-of make map! new-line/all [k1 v1 k2 v2 k3 v3] on
== [
    v1 
    v2 
    v3
]
```

**To reproduce**

In console:
```
keys-of make object! [k1: 'v1 k2: 'v2 k3: 'v3]
values-of make object! [k1: 'v1 k2: 'v2 k3: 'v3]

to [] o: object new-line/all [k1: 'v1 k2: 'v2 k3: 'v3] on
to [] o: object new-line/all [k1: 1 k2: 2 k3: 3] on
keys-of o: object new-line/all [k1: 'v1 k2: 'v2 k3: 'v3] on
values-of o: object new-line/all [k1: 'v1 k2: 'v2 k3: 'v3] on
keys-of o: object new-line/all [k1: 1 k2: 2 k3: 3] on
values-of o: object new-line/all [k1: 1 k2: 2 k3: 3] on

keys-of make map! [1 2 3 4 5 6]
values-of make map! [1 2 3 4 5 6]
keys-of make map! new-line/all [1 2 3 4 5 6] on
values-of make map! new-line/all [1 2 3 4 5 6] on
keys-of make map! new-line/all [k1 v1 k2 v2 k3 v3] on
values-of make map! new-line/all [k1 v1 k2 v2 k3 v3] on
```

**Expected behavior**

Consistent primarily, easy to understand.

**Platform version**
```
Red 0.6.4 for Windows built 18-Oct-2023/1:48:48+03:00  commit #c9f4194
```


Comments:
--------------------------------------------------------------------------------

On 2023-10-31T10:58:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/5417#issuecomment-1786982130>

    It seems that `object` removes newlines from values that have been replaced by their evaluation result, while leaving newlines for the passive rest, e.g. `1`, `#2`, `/3` etc.

--------------------------------------------------------------------------------

On 2023-10-31T10:59:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/5417#issuecomment-1786983554>

    somewhat related https://github.com/red/red/issues/5140

--------------------------------------------------------------------------------

On 2023-10-31T11:16:04Z, dockimbel, commented:
<https://github.com/red/red/issues/5417#issuecomment-1787011108>

    `make` on `object!` and `map!` should remove all new-line flags for both keys and values.

