
#5387: `mold/all` turns values into words
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/5387>

**Describe the bug**

Breaks loaded code!
```
>> mold/all [#[none] #[true] #[false] #[none!] #[logic!]]
== "[#[none] #[true] #[false] none! logic!]"
```
(all datatypes are affected)

**Expected behavior**

Datatype values round-tripping.

**Platform version**
`Red 0.6.4 for Windows built 11-Sep-2023/10:40:41+03:00  commit #def4b65`


