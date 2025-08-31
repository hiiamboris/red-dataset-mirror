
#587: Fetching function spec crashes when not available
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/587>

```
Red []

probe :zero?
```

**\* Runtime Error 1: access violation
**\* at: 080592D5h

When compiled with

red-store-bodies?: no

Would be nice if it returned an empty spec or an error instead of crashing.



Comments:
--------------------------------------------------------------------------------

On 2013-12-03T12:39:17Z, dockimbel, commented:
<https://github.com/red/red/issues/587#issuecomment-29706204>

    An error would be the best option.

--------------------------------------------------------------------------------

On 2013-12-06T00:00:46Z, dockimbel, commented:
<https://github.com/red/red/issues/587#issuecomment-29951628>

    **none** will be returned as body when the function is MOLD/FORMed. So, the case where the body is not prodived can be tested more easily.

