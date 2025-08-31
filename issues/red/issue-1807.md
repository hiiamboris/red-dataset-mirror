
#1807: ?? confused by compiled words set to values of same name map keys 
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1807>

Code **A**:

```
Red []

m: #(
    a: 1
)
b: m/a
probe b
print type? b
?? b
```

Result (_as expected_) of Code **A** when both interpreted and compiled:

```
1
integer
b: 1
```

Code **B**:

```
Red []

m: #(
    a: 1
)
a: m/a
probe a
print type? a
?? a
```

Result (_as expected_) of interpreted Code **B**:

```
1
integer
a: 1
```

**Surprising** run-time result of compiled Code **B**:

```
1
integer
*** Script error: ?? does not allow set-word! for its 'value argument
*** Where: ??
*** Stack: ??
```

Code **C**:

```
Red []

m: #(
    a: 1
    b: 2
)
a: m/b
probe a
print type? a
?? a
```

Result (_as expected_) of Code **C** when both interpreted and compiled:

```
2
integer
a: 2
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-12T21:42:27Z, dockimbel, commented:
<https://github.com/red/red/issues/1807#issuecomment-209115256>

    Issue is caused by the hashtable lookup in map corrupting a word slot.

