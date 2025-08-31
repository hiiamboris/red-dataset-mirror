
#5196: `help` should be more friendly when displaying typesets in function spec
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.review] [status.contribution]
<https://github.com/red/red/issues/5196>

:point_up: [September 3, 2022 3:16 PM](https://gitter.im/red/bugs?at=631345813a42316d33d2128d)

**Describe the bug**
```
>> f: func compose/deep [n [(number!) (any-string!)]] [? n]
== func [n [make typeset! [integer! float! percent!] make typeset! [string! file! url!...
>> ?? f 
f: func [n [make typeset! [integer! float! percent!] make typeset! [string! file! url! tag! email! ref!]]][? n]
>> ? f
USAGE:
     F n

DESCRIPTION: 
     F is a function! value.

ARGUMENTS:
     n            [make typeset! [integer! float! percent!] make typeset! [string! file! url! tag! email! ref!]] 

>> f "abc" 
N is a string! value: "abc"
```
`help`/`?`/`??` don't take typesets in the spec into account, displaying an unreadable spec.

**Expected behavior**

It should unify all typesets, types and words (type names) in the spec and display the resulting typeset.

**Platform version**
```
Red 0.6.4 for Windows built 3-Sep-2022/17:53:01+03:00  commit #cb83eca
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-03T15:57:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/5196#issuecomment-1236149391>

    Well, I guess we can't beautify `mold` output here. But at least `??` and `?`

--------------------------------------------------------------------------------

On 2022-09-03T16:00:40Z, dockimbel, commented:
<https://github.com/red/red/issues/5196#issuecomment-1236150194>

    `help` should be smart enough to squash `[make typeset! [integer! float! percent!] make typeset! [string! file! url! tag! email! ref!]]` into just `integer! float! percent! string! file! url! tag! email! ref!`.

--------------------------------------------------------------------------------

On 2022-09-03T16:01:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/5196#issuecomment-1236150297>

    And since spec is not copied, `func` cannot "fix" it internally...

--------------------------------------------------------------------------------

On 2022-09-03T19:24:53Z, greggirwin, commented:
<https://github.com/red/red/issues/5196#issuecomment-1236185981>

    I will counter that squashing the types will be a lossy operation. i.e. the original spec does have 2 typesets, and `help` keeps that information available. That may be an important distinction in some cases. We should also consider that `help` is console oriented, and composing func specs this way is deeper magic. 
    
    The first technical issue is easy enough, because we can `union` the typesets. The second is just a bit of work, because `help` reduces the spec block in order to vet what's in it (`some [datatype! | typeset!]`). And once reduced we can't tell words from typesets.
    ```
    >> foreach val spec2/2 [print [mold val mold type? val]]
    number! word!
    any-string! word!
    >> foreach val reduce spec2/2 [print [mold val mold type? val]]
    make typeset! [integer! float! percent!] typeset!
    make typeset! [string! file! url! tag! email! ref!] typeset!
    ```
    If we do decide that squashing typesets is more useful, I vote that we address this once future spec work is done for func specs, as that may move the spec parsing `help` has now into an official func spec parser.

--------------------------------------------------------------------------------

On 2022-09-03T19:27:27Z, greggirwin, commented:
<https://github.com/red/red/issues/5196#issuecomment-1236186326>

    Depending on how @hiiamboris is using this, an easy workaround is to use lit-words in the composed spec.
    
    `f: func compose/deep [n [('number!) ('any-string!)]] [? n]`

