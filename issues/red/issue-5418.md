
#5418: Undefined behavior of `parse-trace` with non-local control flow
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug] [type.compiler]
<https://github.com/red/red/issues/5418>

**Describe the bug**

```
--== Red 0.6.4 ==--
Type HELP for starting information.

>> ? parse-trace
USAGE:
     PARSE-TRACE input rules

DESCRIPTION:
     Wrapper for parse/trace using the default event processor.
     PARSE-TRACE is a function! value.

ARGUMENTS:
     input        [series!]
     rules        [block!]

REFINEMENTS:
     /case        => Uses case-sensitive comparison.
     /part        => Limit to a length or position.
        limit        [integer!]

RETURNS:
     [logic! block!]

>> parse-trace [1] [skip (exit)]
 -->
   match: [skip (exit)]
   input: [1]
   ==> matched
   match: [(exit)]
   input: []
*** Script Error: invalid argument: [1]
*** Where: catch
*** Near : unset
*** Stack:

>> ? parse-trace
PARSE-TRACE is a word! value: console

>> ??????
```
I do not see anything suspicious in `parse-trace` or `on-parse-event`, so this must be some stack craziness.

**To reproduce**

In fresh console type:
```
parse-trace [1] [skip (exit)]
? parse-trace
```

**Expected behavior**

`== unset` as a result of `exit`
`parse-trace` should remain untouched

**Platform version**

`Red 0.6.4 for Windows built 30-Oct-2023/11:45:38+03:00  commit #377b5ed`


Comments:
--------------------------------------------------------------------------------

On 2023-11-03T17:19:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/5418#issuecomment-1792839876>

    Related https://github.com/red/red/issues/5401 https://github.com/red/red/issues/5403 https://github.com/red/red/issues/5405

--------------------------------------------------------------------------------

On 2023-11-03T17:22:06Z, dockimbel, commented:
<https://github.com/red/red/issues/5418#issuecomment-1792843845>

    Most probably `pase/trace` requires the same changes as done for `do/trace` in #5401 and #5403.

--------------------------------------------------------------------------------

On 2023-11-03T22:22:24Z, dockimbel, commented:
<https://github.com/red/red/issues/5418#issuecomment-1793186761>

    It works fine if `parse-trace` is run by the interpreter instead of using the compiled version.

