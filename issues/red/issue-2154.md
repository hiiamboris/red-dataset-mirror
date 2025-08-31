
#2154: Incorrect work of function with get-word! in function's argument block.
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2154>

(Compared with Rebol2) (Rebol3 has the same behavior).
**Rebol2:**

```
test: func [a :red] [probe red a + red]
test 10 red =>
  255.0.0
  255.0.1
```

**Red:**

```
test: func [a :red] [probe red a + red]
test 10 red =>
  red
  *** Script Error: word! type is not allowed here
  *** Where: +
```

**Strange difference between op! and functon! behavior:**

```
test: func [:r :b] [r + b]
+_+: make op! :test
red +_+ blue => 255.0.255
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-09T04:14:46Z, dockimbel, commented:
<https://github.com/red/red/issues/2154#issuecomment-238448919>

    Red follows the Rebol3 behavior there, so it is the correct result.
    
    _Strange difference between op! and functon! behavior_ I don't see a difference at all...

