
#5198: Curious bitwise operations with typesets
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5198>

**Describe the bug**
```
>> number! or 0
== make typeset! [block! char! integer! float! set-word! lit-word! get-word! refinemen...
>> number! xor 0
== make typeset! [block! char! set-word! lit-word! get-word! refinement! native! bitse...
>> number! and 0
== make typeset! [integer! float!]
>> number! and 1
== make typeset! [integer! float!]
>> number! and 2
== make typeset! [integer! float! percent!]
>> number! or 1.#nan
== make typeset! [block! char! integer! float! set-word! lit-word! get-word! refinemen...
>> number! or [abracadabr]
== make typeset! [integer! float! typeset! percent! map! binary! series! email! money!...
>> number! or func []["hello"]
== make typeset! [datatype! none! block! file! url! integer! float! lit-word! refineme...
```
No idea what these are even doing...

**Expected behavior**

An error.

**Platform version**
```
Red 0.6.4 for Windows built 3-Sep-2022/17:53:01+03:00  commit #cb83eca
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-04T17:33:04Z, greggirwin, commented:
<https://github.com/red/red/issues/5198#issuecomment-1236384921>

    This leads to a good design question for the new work and specs. How do we catch things that fall through cracks. This should be something we can analyze statically for many cases, without going deeply down the formal path as some other langs do.

--------------------------------------------------------------------------------

On 2022-09-04T17:36:02Z, greggirwin, commented:
<https://github.com/red/red/issues/5198#issuecomment-1236385326>

    Also a balance of effort. What problems are more likely to occur, and what is really out there. I haven't sketched out designs for a Red analyzer (linter) but maybe there's a way to leverage that alongside the goal @dockimbel mentioned for using specs to verify compliance in the actual code against it. 

--------------------------------------------------------------------------------

On 2022-09-04T23:01:29Z, dockimbel, commented:
<https://github.com/red/red/issues/5198#issuecomment-1236431023>

    That is the kind of erroneous case that shall be caught by unit tests generated from the spec's knowledge base.

