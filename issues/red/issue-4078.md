
#4078: `take/part` with negative `part` argument is broken
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/4078>

**Describe the bug**

Magic comes. Watch closely ☺:
```
>> s: "123"  take/part      s    -1
== ""
>> s: "123"  take/part skip s 1  -1
== "1"
>> s: "123"  take/part skip s 2  -1
== "2"
>> s: "123"  take/part skip s 3  -1
== none					;) wrong
>> s: "123"  take/part skip s 1  -2
== "1"
>> s: "123"  take/part skip s 2  -2
== "12"
>> s: "123"  take/part skip s 3  -2
== none					;) wrong
>> s: "123"  take/part skip s 1  -3
== "1"
>> s: "123"  take/part skip s 2  -3
== "12"
>> s: "123"  take/part skip s 3  -3
== none					;) wrong
>> s: "123"  take/part      s    skip s 1
== "1"
>> s: "123"  take/part skip s 1       s
== "1"
>> s: "123"  take/part skip s 1  skip s 2
== "2"
>> s: "123"  take/part skip s 2  skip s 1
== "2"
>> s: "123"  take/part skip s 2  skip s 3
== "3"
>> s: "123"  take/part skip s 3  skip s 2
== none					;) wrong
>> s: "123"  take/part      s    skip s 2
== "12"
>> s: "123"  take/part skip s 2       s
== "2"					;) wrong
>> s: "123"  take/part skip s 1  skip s 3
== "23"
>> s: "123"  take/part skip s 3  skip s 1
== none					;) wrong
>> s: "123"  take/part      s    skip s 3
== "123"
>> s: "123"  take/part skip s 3       s
== none					;) wrong
```

**To reproduce**

The test goes:
```
s: "123"  take/part      s    -1
s: "123"  take/part skip s 1  -1
s: "123"  take/part skip s 2  -1
s: "123"  take/part skip s 3  -1
s: "123"  take/part skip s 1  -2
s: "123"  take/part skip s 2  -2
s: "123"  take/part skip s 3  -2
s: "123"  take/part skip s 1  -3
s: "123"  take/part skip s 2  -3
s: "123"  take/part skip s 3  -3
s: "123"  take/part      s    skip s 1
s: "123"  take/part skip s 1       s
s: "123"  take/part skip s 1  skip s 2
s: "123"  take/part skip s 2  skip s 1
s: "123"  take/part skip s 2  skip s 3
s: "123"  take/part skip s 3  skip s 2
s: "123"  take/part      s    skip s 2
s: "123"  take/part skip s 2       s
s: "123"  take/part skip s 1  skip s 3
s: "123"  take/part skip s 3  skip s 1
s: "123"  take/part      s    skip s 3
s: "123"  take/part skip s 3       s
```

**Expected behavior**

Using R2 as reference:
```
>> s: "123"  take/part      s    -1
== ""
>> s: "123"  take/part skip s 1  -1
== "1"
>> s: "123"  take/part skip s 2  -1
== "2"
>> s: "123"  take/part skip s 3  -1
== "3"
>> s: "123"  take/part skip s 1  -2
== "1"
>> s: "123"  take/part skip s 2  -2
== "12"
>> s: "123"  take/part skip s 3  -2
== "23"
>> s: "123"  take/part skip s 1  -3
== "1"
>> s: "123"  take/part skip s 2  -3
== "12"
>> s: "123"  take/part skip s 3  -3
== "123"
>> s: "123"  take/part      s    skip s 1
== "1"
>> s: "123"  take/part skip s 1       s
== "1"
>> s: "123"  take/part skip s 1  skip s 2
== "2"
>> s: "123"  take/part skip s 2  skip s 1
== "2"
>> s: "123"  take/part skip s 2  skip s 3
== "3"
>> s: "123"  take/part skip s 3  skip s 2
== "3"
>> s: "123"  take/part      s    skip s 2
== "12"
>> s: "123"  take/part skip s 2       s
== "12"
>> s: "123"  take/part skip s 1  skip s 3
== "23"
>> s: "123"  take/part skip s 3  skip s 1
== "23"
>> s: "123"  take/part      s    skip s 3
== "123"
>> s: "123"  take/part skip s 3       s
== "123"
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```



Comments:
--------------------------------------------------------------------------------

On 2019-11-11T17:43:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4078#issuecomment-552542549>

    Don't wanna make another issue for it:
    ```
    >> take/part "" 0
    == none
    >> take/part "" 1
    == none
    ```
    Expected `""` in both cases.

--------------------------------------------------------------------------------

On 2019-11-11T18:53:55Z, greggirwin, commented:
<https://github.com/red/red/issues/4078#issuecomment-552567656>

    `/part` isn't the issue there, it seems, but the choice of compatibility with `take` itself. `take ""` returns `none`, and is the same for both R2 and R3. `Take` returns a `char!` when given a string (without `/part`). It does seem like returning an empty string is more useful, for cases like `while [not empty? p: take/part str n]...`, but `empty?` supports `none` in Red (R2 didn't), so a `none` check can be used consistently with our without `/part`.  You can't use the none approach with blocks though. R2/3 both return `""`, and I'll hazard a guess that Red's current behavior is not by design. If it's not documented, make the change, and we can always revert it given an strong enough argument.

--------------------------------------------------------------------------------

On 2019-11-11T19:12:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/4078#issuecomment-552574337>

    @greggirwin definitely not by design. And fixed in my PR.
    
    `take` is meant to return an element of the series (and like pick it returns `none` when there is no element)
    
    `take/part` is meant to return a slice of the series. It should be of the same type as the series, not `none`.
    
    I'm using `take/part` to fit the string into a fixed-width column by repeatedly chopping parts from it, and have to work around the bug.

