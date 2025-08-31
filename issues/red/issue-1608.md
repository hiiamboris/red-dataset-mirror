
#1608: Regression: parse-trace errors
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
<https://github.com/red/red/issues/1608>

With the latest source on Windows XP and Windows 7, `parse-trace` seems to error on everything:

```
red>> parse "1" ["1" | "2"]
== true
red>> parse-trace "1" ["1" | "2"]
*** Script error: parse does not allow block for its callback argument
*** Where: parse
```

With the Red 0.5.4 release, it didn't:

```
red>> parse "1" ["1" | "2"]
== true
red>> parse-trace "1" ["1" | "2"]
 match: ["1" | "2"]
input: "1"
 ==> matched
 match: [| "2"]
input: ""
return: true
== true
red>>
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-08T14:45:38Z, WiseGenius, commented:
<https://github.com/red/red/issues/1608#issuecomment-181402477>

    Closing as a pre-duplicate of #1609 since the issue was first reported by @xqlab.

