
#5176: Lexer events on string! input do not scale
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5176>

**Describe the bug**
Lexer events on `string!` input series have an execution time that grows with O(n² ) complexity. Same code on equivalent `binary!` series does not show such abnormal durations.

**To reproduce**
```
lex: function [e i t l tk][[prescan scan open close] yes]
size: 150'000
s: make string!  size
insert/dup s "hello " size / 6

probe dt [transcode/trace to-binary s :lex]
probe dt [transcode/trace s :lex]
```
results in:
```
>> dt [transcode/trace to-binary s :lex]
== 0:00:00.0291422
>> dt [transcode/trace s :lex]
== 0:00:21.9628
```
**Expected behavior**
Similar execution times.

**Platform version**
All.



Comments:
--------------------------------------------------------------------------------

On 2022-08-13T22:27:29Z, dockimbel, commented:
<https://github.com/red/red/issues/5176#issuecomment-1214239074>

    The O(n² ) algorithm was replaced by a linear one (using memoization of last result), so there is no need for a regression test.

