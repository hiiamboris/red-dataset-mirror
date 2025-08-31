
#2155: Red doesn't raise an error on function definition with wrong type annotation.
================================================================================
Issue is closed, was reported by ifgem and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2155>

**Red:**

```
test: func [h [integer!!]] [h]
test 10 => integer!! has no value

test: func [h [10]] [h]
test 10
  *** Script Error: test does not allow integer! for its h argument
  *** Where: test
```

**Rebol2 (interesting approach:) (by the type of expression)):**

```
1: same

test: func [h [10]] [h]
test 100 => ok
test "hello" => not ok
```

**Rebol3 just raises an error:** (I like it the most).
https://s32.postimg.org/3sbw9cxl1/image.jpg



