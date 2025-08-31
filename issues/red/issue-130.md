
#130: Puzzlement with DECLARE
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built]
<https://github.com/red/red/issues/130>

In the specification, 4.5.2, there is the statement that a DECLARE of a struct! field which is itself of struct! type, does not need to provide a struct with the same field names. However, this leads to the following:

```
s: declare struct! [a [integer!] b [c-string!] c [struct! [d [integer!]]]]
s/c: declare struct! [n [integer!]]
```

compiles OK, but if one adds the assignment

```
s/c/n: 1
```

then: 

```
*** Compilation Error: invalid struct member n in: s/c/n
```

what is the point of relaxing the type equality if afterwards it is caught?



Comments:
--------------------------------------------------------------------------------

On 2011-07-05T08:11:40Z, dockimbel, commented:
<https://github.com/red/red/issues/130#issuecomment-1502187>

    This is a mistake in the specification.

--------------------------------------------------------------------------------

On 2011-07-05T12:37:16Z, dockimbel, commented:
<https://github.com/red/red/issues/130#issuecomment-1503360>

    Statement removed from the specification.

