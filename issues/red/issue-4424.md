
#4424: Incorrect output of to-csv
================================================================================
Issue is closed, was reported by endo64 and has 6 comment(s).
<https://github.com/red/red/issues/4424>


**Describe the bug**
See below

**To reproduce**
```
>> o: context [a: "x x"]
== make object! [
    a: "x x"
]
>> to-csv values-of o
== {"x x"^/}
>> to-csv values-of o
== {"""x x"""^/}
>> to-csv values-of o
== {"""""""x x"""""""^/}
>> b: ["x x"]
== ["x x"]
>> to-csv b
== {"x x"^/}
>> to-csv b
== {"""x x"""^/}
>> to-csv b
== {"""""""x x"""""""^/}
```

**Expected behavior**
A clear and concise description of what you expected to happen.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 29-Apr-2020/15:24:35+03:00 commit #db7f36a
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-03T23:26:13Z, dockimbel, commented:
<https://github.com/red/red/issues/4424#issuecomment-623200851>

    @rebolek This one is for you. I'm putting Gregg as the proxy in "Assignees".

--------------------------------------------------------------------------------

On 2020-05-04T03:24:38Z, greggirwin, commented:
<https://github.com/red/red/issues/4424#issuecomment-623239872>

    Objects and maps share the same encoder, so affects those too. What we need to do is vet the input, to make sure it's what `to-csv` expects, and also put that in the wiki (and eventually docs and articles).
    ```
    >> mm: load-csv/as-columns s
    == #(
        "A" ["a" "1" "11"]
        "B" ["b" "2" "22"]
        "C" ["c" "3" "33"]
    )
    >> to-csv mm
    == {A,B,C^/a,b,c^/1,2,3^/11,22,33^/}
    >> to-csv mm
    == {A,B,C^/a,b,c^/1,2,3^/11,22,33^/}
    >> to-csv mm
    == {A,B,C^/a,b,c^/1,2,3^/11,22,33^/}
    ```
    I thought at first it was `/skip` related, that you needed to include it in the call, but it seems like it may be a special case where there's only one string in the block.

--------------------------------------------------------------------------------

On 2020-05-05T07:47:45Z, rebolek, commented:
<https://github.com/red/red/issues/4424#issuecomment-623907933>

    Merge request with fix created https://github.com/red/red/pull/4425

