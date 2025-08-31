
#427: Local REPEAT variable broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/427>

This may be a regression; it probably worked after #405.

```
Red []

f: func [
    /local count
][
    repeat count 5 [
        print count
    ]
]
f
```

none
none
none
none
none



Comments:
--------------------------------------------------------------------------------

On 2013-03-11T13:41:51Z, PeterWAWood, commented:
<https://github.com/red/red/issues/427#issuecomment-14713543>

    I've added a couple of tests to loop-test.red that show that count has the correct value inside the loop. I also added a test to print-test.r which falls. I assume that print is being passed the function local count rather than the loop local count.
    
    One of the tests fails in seemingly unrelated way. The local variable does not seem to be returned from the function give the following code:
    
    ``` rebol
    -test-- "issue #427-1"
        issue427-acc: 0
        issue427-f: func [
          /local count
        ][
          count: #"a"
          repeat count 5 [
            issue427-acc: issue427-acc + count
          ]
          count
        ]
      --assert #"a"= issue427-f    ;; fails
      --assert 15 = issue427-acc
    ```

--------------------------------------------------------------------------------

On 2013-03-12T15:30:23Z, dockimbel, commented:
<https://github.com/red/red/issues/427#issuecomment-14781962>

    It should return 5 in the failing test above as `count` local variable is used by REPEAT.

