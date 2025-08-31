
#4083: `sort` with negative /part is broken on blocks
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/4083>

**Describe the bug**

```
>> sort/part skip s: [4 3 2 1] 2 s
== [3 4 2 1]
>> sort/part skip s: [4 3 2 1] 3 s
== [2 3 4 1]
>> sort/part skip s: [4 3 2 1] 4 s
== []                                  ;) wrong
>> sort/part skip s: "4321" 4 s
== "1234"
>> sort/part skip s: "4321" 2 -2
== "3421"
>> sort/part skip s: [4 3 2 1] 2 -2
== [2 1]                               ;) wrong
```

**Expected behavior**

`[1 2 3 4]` in the 3rd example
`[3 4 2 1]` in the 6th example

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```

Culprits:
- an "early exit" branch 1:
https://github.com/red/red/blob/a4ee537c4b7dd40594db5e5809be8918deef38bd/runtime/datatypes/block.reds#L1242
- an "early exit" branch 2:
https://github.com/red/red/blob/a4ee537c4b7dd40594db5e5809be8918deef38bd/runtime/datatypes/block.reds#L1248



Comments:
--------------------------------------------------------------------------------

On 2019-10-19T17:08:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4083#issuecomment-544173748>

    String sorting is broken as well:
    ```
    >> sort/part skip s: "4321" 2 -2
    == "3421"
    >> sort/part skip s: "4321" 2 -100
    == "4321"                           ;) wrong
    ```

