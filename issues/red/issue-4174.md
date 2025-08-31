
#4174: `replace/all/deep` hangs up
================================================================================
Issue is closed, was reported by hiiamboris and has 18 comment(s).
[status.built] [status.tested] [test.written] [type.design]
<https://github.com/red/red/issues/4174>

Looks like not the first time: https://github.com/red/red/issues/2808 https://github.com/red/red/issues/3132, so the algorithm should probably be revisited to prevent further failures like this.

**Describe the bug**
```
>> b: [a: 123]
== [a: 123]
>> replace/deep copy b quote a: quote x:
== [x: a: 123]      ;) this is wrong really
>> replace/all copy b quote a: quote x:
== [x: 123]
>> replace/all/deep copy b quote a: quote x:
***HANGS***
```

What likely happens:
- `/deep` switches `replace` into parse mode
- `quote a:` becomes just `a:` in parse expression and does not advance the input
- it just inserts `x:` indefinitely into the same point then

**To reproduce**
```
b: [a: 123]
replace/deep copy b quote a: quote x:
replace/all copy b quote a: quote x:
; replace/all/deep copy b quote a: quote x:
```

**Expected behavior**
```
>> replace/deep copy b quote a: quote x:
== [x: 123]
>> replace/all/deep copy b quote a: quote x:
== [x: 123]
>> replace/all/deep [a: [a: 123]] quote a: quote x:
== [x: [x: 123]]
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Nov-2019/10:17:45+03:00 commit #b2aafe6
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-23T20:08:08Z, 9214, commented:
<https://github.com/red/red/issues/4174#issuecomment-602828262>

    If rewrite is in order, then we need to come up with desideratum and discuss subtle design points (e.g. lax/strict comparison and usage of Parse patterns).

--------------------------------------------------------------------------------

On 2020-03-23T21:15:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4174#issuecomment-602860173>

    My initial thoughts:
    
    1) I propose decoupling /deep from parse. I imagine it's there as a quick way to provide recursion, which `parse` implements already. Doesn't make any sense to me any other way. Both are useful: `/parse` without `/deep` (less boilerplate code) and `/deep` without `/parse` (where one doesn't want to shoot one's feet off completely, esp. in generic mezzanines).
    
    2) In `/parse` mode, both *pattern* and *value* should be patterns. I have found multiple times that final value is very limiting and practically discarding the usefulness of parse. E.g. I want to support cases like `replace/all [1 2 3] [set x integer!] [(form x)]`.
    - Relation of `replace/parse` with [`mapparse`](https://github.com/greggirwin/red-hof/tree/master/code-analysis#forparsemap-parse) should be considered, as they share similarity in their function.
    - Biggest issue of `replace/all [1 2 3] [set x integer!] [(form x)]` example is that it makes `value` argument obsolete: a single expression `[change set x integer! (form x)]` is more natural/readable. So maybe it should be better served as separate `replace-parse` mezz or incorporated into `mapparse` by implementing a `/deep` refinement in it.
    
    3) The original example deadlocks because the source grows on par with the input advancement. Obviously, declaring a refinement as eloquent as `/parse` should make one aware that one may deadlock it and should tread with care. But we could probably smarten it with some sanity checks, e.g. what if every 1000 or so iterations it evaluated if tail became any closer?
    
    See also https://github.com/red/REP/issues/18 on more radical changes ideas, like `/all` by default.
    
    Another thought is, `replace/parse/deep` becomes quite potent, which is not necessarily a good thing. E.g. I may make a recursive visitor with it: `replace/parse/deep input [copy x pattern] [(analyze the match and return :x)]` which is outside of the design scope of `replace`, but still can be shorter than manual `parse` expression.

--------------------------------------------------------------------------------

On 2020-03-23T23:10:19Z, 9214, commented:
<https://github.com/red/red/issues/4174#issuecomment-602906508>

    So there's a split here:
    * A humble `replace` that does only boring things expected from it — finding a match and replacing it;
    * A beefed-up term-rewriting dialect that permits context-sensitive matching and pre/post processing.

--------------------------------------------------------------------------------

On 2020-03-24T03:47:19Z, greggirwin, commented:
<https://github.com/red/red/issues/4174#issuecomment-602997406>

    Start humble.

--------------------------------------------------------------------------------

On 2020-08-27T17:21:06Z, 9214, commented:
<https://github.com/red/red/issues/4174#issuecomment-682083820>

    For the record, both R2's and R3's `replace` rely on `find` only. `/deep` implies `parse` because otherwise `replace` would need to maintain its own stack and handle recursion, which I think is a bit of an overkill.
    
    So, we can have a simple `replace` like R2 and R3, and then we can have a more advanced `replace` (`rewrite`?) which wraps Parse and perhaps implements its own dialect on top of it; personally I imagine something among the lines of context-sensitive [L-systems](https://en.wikipedia.org/wiki/L-system).

--------------------------------------------------------------------------------

On 2020-08-28T20:14:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/4174#issuecomment-683127661>

    I'd make replace/deep a recursive dumb predictable operation based on `find/only`. But I'd make `apply` native first. I think that was always the intent behind `replace` by the way.

--------------------------------------------------------------------------------

On 2020-08-29T19:48:07Z, 9214, commented:
<https://github.com/red/red/issues/4174#issuecomment-683334568>

    @hiiamboris that would limit the recursion level by the size of the Red's stack. Might be not that important for the common `replace/deep` cases.

--------------------------------------------------------------------------------

On 2020-08-30T18:10:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/4174#issuecomment-683452017>

    It's about ~2000 calls long. Parse has this limit too IIRC.

--------------------------------------------------------------------------------

On 2020-08-30T18:13:33Z, 9214, commented:
<https://github.com/red/red/issues/4174#issuecomment-683452320>

    https://github.com/red/red/blob/586f267016d162a35747443d1571153b1a1111cd/runtime/parse.reds#L19

