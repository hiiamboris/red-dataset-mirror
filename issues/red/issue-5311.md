
#5311: [VID] `rate` facet doesn't accept zero/none value
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[GUI]
<https://github.com/red/red/issues/5311>

**Describe the bug**

This is useful sometimes to override `rate` of a style with nonzero default, but it doesn't work:
```
>> view [base rate 0 on-time [print 1]]
*** Script Error: VIEW - invalid rate value: 0
*** Where: make-view
*** Near : exit
*** Stack: view show show  

>> view [base rate 0:0 on-time [print 1]]
*** Script Error: VIEW - invalid rate value: 0:00:00
*** Where: make-view
*** Near : exit
*** Stack: view show show  

>> view [base rate none on-time [print 1]]
*** Script Error: VID - invalid syntax at: [none on-time [print 1]]
*** Where: do
*** Near : (opts/rate: fetch-argument rate! spec)
*** Stack: view layout fetch-options fetch-argument cause-error  

>> view [base rate #[none] on-time [print 1]]
*** Script Error: VID - invalid syntax at: [none on-time [print 1]]
*** Where: do
*** Near : (opts/rate: fetch-argument rate! spec)
*** Stack: view layout fetch-options fetch-argument cause-error  
```
Only `with [rate: none]` is working.

**Expected behavior**

`rate` should accept zero and none values

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-04-28T18:17:17Z, dockimbel, commented:
<https://github.com/red/red/issues/5311#issuecomment-1527927365>

    Given how rare this use-case is, `with [rate: none]` looks fine to me. 
    @greggirwin What do you think?

--------------------------------------------------------------------------------

On 2023-04-28T21:08:17Z, greggirwin, commented:
<https://github.com/red/red/issues/5311#issuecomment-1528097366>

    I can see both sides. `change-rate` supports `none`, and we just need to add `none!` to the rate type spec in VID at a glance. Quick and easy for that part.
    
    `with [rate: 0]` and `with [rate: 0:0]` also fail, due to internal checks in `change-rate`. If we don't support zero there, no need in VID. The logic is different by OS, but looks like we could support `<= 0` values and treat them as "remove timer" if desired. But is that better, or just different? Does a rate of zero mean to *remove* the timer object, or just "pause" it, for those who think about internals? Yes, we can doc it either way, but `none` makes that clearer IMO. So I would leave the numeric checks as is.

--------------------------------------------------------------------------------

On 2023-04-28T21:37:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/5311#issuecomment-1528120196>

    To clarify, this ticket is not about adding `0` support if it's not there (I thought it is), just about letting VID accept what `with` does.
    In Spaces I treat `0` and `none` equivalently, but it's unimportant.
    
    P.S. `rate: 0` should mean "infinitely slow", while `rate: 0:0` should mean "infinitely fast", so maybe it's a bad idea to support `0:0` at all.

