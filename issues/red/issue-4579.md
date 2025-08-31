
#4579: [Compiler] break from until returns JUNK results
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.deferred] [type.design]
<https://github.com/red/red/issues/4579>

**Describe the bug**

Compile & run this:
```
Red []
probe until [break]
f: does [until [break]]
probe f
```
Result:
```
""                    
func [][until [break]]
```
(actual results may vary on the script contents)

**Expected behavior**

As interpreted:
```
unset
unset
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 17-Jul-2020/15:41:29+03:00 commit #7f2db9b
```



Comments:
--------------------------------------------------------------------------------

On 2021-08-27T13:43:54Z, dockimbel, commented:
<https://github.com/red/red/issues/4579#issuecomment-907213861>

    Return values from iterators whether on normal or premature exit are not yet defined.

--------------------------------------------------------------------------------

On 2021-08-27T16:12:16Z, greggirwin, commented:
<https://github.com/red/red/issues/4579#issuecomment-907314702>

    So...shouldn't we define them? This seems like an important behavior to understand in any language. At the very least we should have a doc or wiki page that lists known, undefined behaviors.

--------------------------------------------------------------------------------

On 2021-08-27T19:22:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/4579#issuecomment-907424775>

    Defined or not, junk is not an option.

