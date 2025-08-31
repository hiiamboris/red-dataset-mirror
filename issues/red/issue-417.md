
#417: Can't load multi-line string with REBOL header
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/417>

#244 seems to be back:

```
Red/System []
{
    REBOL []
}
```

-= Red/System Compiler =- 
**\* Loading Error: syntax error during LOAD phase: make object! [
    code: 200
    type: 'syntax
    id: 'invalid
    arg1: "string"
    arg2: "}"
    arg3: none
    near: "(line 4) }"
    where: none
] 
**\* at line: 5



Comments:
--------------------------------------------------------------------------------

On 2013-02-18T12:13:37Z, dockimbel, commented:
<https://github.com/red/red/issues/417#issuecomment-13719200>

    Applies to master branch too.

--------------------------------------------------------------------------------

On 2013-02-18T12:59:50Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/417#issuecomment-13720816>

    It was fixed at the time in the dyn-lib-emitter branch. Did Git not reapply it when merged with master?

--------------------------------------------------------------------------------

On 2013-02-18T13:01:12Z, dockimbel, commented:
<https://github.com/red/red/issues/417#issuecomment-13720865>

    That's strange...it might have been dropped during one of the merges..

