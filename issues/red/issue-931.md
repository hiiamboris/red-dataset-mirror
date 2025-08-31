
#931: Multi-inherited context mix up fields
================================================================================
Issue is closed, was reported by WayneCui and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/931>

Only for interpreter: 

```
p1: context [
    a: 1
    f: does [a]
]

p2: context [
    a: 2
]

ch: make p1 p2
probe ch/f
```

output: 1
In compiler, it's 2.

```
p1: context [
    a: 1
]

p2: context [
    a: 2
    f: does [a]
]

ch: make p1 p2

probe ch/f
```

output: 1
In compiler, it's 2.



Comments:
--------------------------------------------------------------------------------

On 2014-09-14T05:11:17Z, dockimbel, commented:
<https://github.com/red/red/issues/931#issuecomment-55515787>

    Multiple inheritance is not yet implemented in the interpreter, this is shown in the failing unit tests, no need for a ticket when unit tests are already showing the issue.

--------------------------------------------------------------------------------

On 2014-09-14T15:24:45Z, WayneCui, commented:
<https://github.com/red/red/issues/931#issuecomment-55528956>

    Sorry for duplication. Fail to run the unit tests. Please close this issue if you didn't think it should be there. 

--------------------------------------------------------------------------------

On 2014-09-14T15:26:39Z, dockimbel, commented:
<https://github.com/red/red/issues/931#issuecomment-55529021>

    Not a big deal, as it's there already, I'll close it when the issue will be fixed.
    
    Thanks for doing extensive testing anyway. :-)

--------------------------------------------------------------------------------

On 2014-09-14T15:34:37Z, WayneCui, commented:
<https://github.com/red/red/issues/931#issuecomment-55529258>

    My pleasure. :-)

--------------------------------------------------------------------------------

On 2014-09-28T14:35:22Z, dockimbel, commented:
<https://github.com/red/red/issues/931#issuecomment-57087319>

    Switching it to a bug rather, as multi-inheritance was supported actually by the interpreter.

