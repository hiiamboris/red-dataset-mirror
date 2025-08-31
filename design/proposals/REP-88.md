
#88: Wish: allow set-words after `set` and `copy` commands in PARSE rules
================================================================================
Issue is closed, was reported by Oldes and has 4 comment(s).
<https://github.com/red/REP/issues/88>

Currently one can (must) write:
```
>> parse ["abc"] [set s string!] s
== "abc"
```
but it's not allowed to use `set-word!` for the `set` and `copy` parse commands. 
```
>> parse ["abc"] [set s: string!] s
*** Script Error: PARSE - unexpected end of rule after: set
*** Where: parse
```
That is common source of variable leaks when used in `function` definition, which is not able to find these words in parse rules... like:
```
>> s: 1 f: function[][parse ["abc"][set s string!]]  f 
== true
>> s
== "abc" ;<--- s was redefined!
```
One must manually define `s` as `local` in function definition:
```
>> s: 1 f: function[/local s][parse ["abc"][set s string!]]  f 
== true
>> s
== 1
```
Would it be a big problem to allow `set-word!` after `set` and `copy` (so it would be collected by `function` scanner)?
```
parse ["abc"][set s: string!]
```
PS: I know that set-words are used in parse for getting current position, but I think that should not be a problem.


Comments:
--------------------------------------------------------------------------------

On 2020-11-30T16:56:22Z, hiiamboris, commented:
<https://github.com/red/REP/issues/88#issuecomment-735910114>

    dupe of https://github.com/red/REP/issues/60

--------------------------------------------------------------------------------

On 2020-11-30T23:13:26Z, greggirwin, commented:
<https://github.com/red/REP/issues/88#issuecomment-736111627>

    Closing as duplicate.

