
#755: inconsistency documentation about runing Red/System code
================================================================================
Issue is closed, was reported by WayneCui and has 10 comment(s).
[status.resolved] [type.review] [Red/System]
<https://github.com/red/red/issues/755>

I tried to run some Red/System code with `%rsc.r` as long time ago but failed, while using `%red.r` is fine. As @HostileFork 's reasoning, it may be because that the separate red/system compiler entry point was deprecated with the "one binary" interface. In %rsc.r the _Usage_ header says: `{do/args %rsc.r "[-v <integer!>] path/source.reds"}`, so that would be an inconsistency about the documentation. Thank HF for the triage. :-)



Comments:
--------------------------------------------------------------------------------

On 2014-04-02T17:51:03Z, dockimbel, commented:
<https://github.com/red/red/issues/755#issuecomment-39361505>

    Could you be more specific, what is _inconsistent_?

--------------------------------------------------------------------------------

On 2014-04-03T02:24:05Z, WayneCui, commented:
<https://github.com/red/red/issues/755#issuecomment-39406357>

    Hi, Doc. 
    I remember before I can run Red/System code with `do/args %red/system/rsc.r "%scripts/test.reds"` (at least V0.1.0), will get:
    
    ```
    Script: "Red/System compiler wrapper" (none) 
    Script: "Red/System compiler" (none) 
    ** Script Error: do-cache has no value 
    ** Near: do-cache %system/utils/profiler.r 
    profiler/active?: no
    ```
    
    but if compile a Red script first with `%red.r`, the Red/System script can be compiled successfully, in the same Rebol console. So, It seems that Red compliler sets up contexts for Red/System compiler. 
    Right now I found I could run Red/System code with `do/args %red/red.r "%scripts/test.reds"`. But the document does not metion that change. That is what I mean _inconsistent_ .
    I have not follow the development of Red much closely, so I may be wrong about that. 

--------------------------------------------------------------------------------

On 2014-04-03T16:25:29Z, dockimbel, commented:
<https://github.com/red/red/issues/755#issuecomment-39472581>

    You missed the changes in 0.4.0 [release](http://www.red-lang.org/2013/09/040-red-goes-binary.html). The %rsc.r wrapper script has been deprecated in favor of the unique %red.r front-end that since then compiles both Red and/or Red/System scripts.

--------------------------------------------------------------------------------

On 2014-04-03T16:30:33Z, dockimbel, commented:
<https://github.com/red/red/issues/755#issuecomment-39473196>

    The header description has been changed to reflect the fact that it is deprecated now.

--------------------------------------------------------------------------------

On 2014-04-03T17:50:24Z, hostilefork, commented:
<https://github.com/red/red/issues/755#issuecomment-39482623>

    That's what I said.  ;-)

