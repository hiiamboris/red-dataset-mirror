
#5263: `copy/part pair` overshoot
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/5263>

**Describe the bug**

```
>> copy/part "abcde" 2x4
== "bc"
>> copy/part "abcde" 1x4
== "abc"
>> copy/part "abcde" 0x4
== "abcd"
>> copy/part "abcde" -1x4
== "abcde"
```

**Expected behavior**

I find the range treatment completely unintuitive, since both pair component are indices, it's hard to imagine what is being copied. I would prefer both be offsets rather than indices. 

But anyway, inside the current model it should produce:
```
>> copy/part "abcde" 2x4
== "bc"
>> copy/part "abcde" 1x4
== "abc"
>> copy/part "abcde" 0x4
== "abc"
>> copy/part "abcde" -1x4
== "abc"
```

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4612 date: 9-Dec-2022/7:12:47 commit: #ce6e33c1dc44fc32bdaeb7f804ac93d98b9af863 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-01-03T14:38:32Z, Oldes, commented:
<https://github.com/red/red/issues/5263#issuecomment-1369842233>

    I wonder if there is any use case for this already? I think that it would be more intuitive, if the `y` pair's value was interpreted as a length and so `copy/part str 2x3` would be same like `copy/part at str 2 3`.

--------------------------------------------------------------------------------

On 2023-01-03T15:18:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/5263#issuecomment-1369889349>

    My personal view illustrated on a simple example. Let's say I have a text selected: `_xxxx__` (`x` is selected, `_` not selected).
    
    It can be encoded as `1x5` (start-offset x end-offset), which I find easiest to work with since that maps directly to the picture in my brain. It's easy to reverse, translate, obtain length and skip.
    
    `2x6` is how copy currently sees it, which is problematic to imagine, since there's nothing of length `2` in the image, and nothing of length `6`. I have to subtract 1 in my mind to from both values to map it onto the image. Index trickery emulation is a pure waste of brain power, because brains are not good at doing PC jobs, else we would never have invented them. 
    
    `index x length` model I find most problematic of all, as again there's nothing of length `2`, so it is confusing. `4` seems okay until you need to modify it. For the previous two models `reverse AxB` as well as `AxB + offset` work fine, but for `index x length` you need `as-pair value/1 + value/2 negate value/2` and `AxB + (1x0 * offset)` respectively, and it's a mess.
    
    And I also see this feature as a poor man's substitute for the `range!` datatype, so I'd prefer it to stay within segment thinking (until such datatype is implemented).
    
    P.S. There's also `copy/part series N` <=> `copy/part series 0xN` equivalence (versus `N` <=> `1x(N+1)`)

--------------------------------------------------------------------------------

On 2023-01-10T17:56:20Z, greggirwin, commented:
<https://github.com/red/red/issues/5263#issuecomment-1377641034>

    Why should pair `/part` args even work with linear series? I understand the
    desire to leverage it, but everywhere we seem to do this today is hard to
    understand. We need `range!` for this, but even that isn't a *great* fit
    with `/part`. It needs its own interface.
    
    On Tue, Jan 3, 2023 at 8:18 AM hiiamboris ***@***.***> wrote:
    
    > My personal view illustrated on a simple example. Let's say I have a text
    > selected: _xxxx__ (x is selected, _ not selected).
    >
    > It can be encoded as 1x5 (start-offset x end-offset), which I find
    > easiest to work with since that maps directly to the picture in my brain.
    > It's easy to reverse, translate, obtain length and skip.
    >
    > 2x6 is how copy currently sees it, which is problematic to imagine, since
    > there's nothing of length 2 in the image, and nothing of length 6. I have
    > to subtract 1 in my mind to from both values to map it onto the image.
    > Index trickery emulation is a pure waste of brain power, because brains are
    > not good at doing PC jobs, else we would never have invented them.
    >
    > index x length model I find most problematic of all, as again there's
    > nothing of length 2, so it is confusing. 4 seems okay until you need to
    > modify it. For the previous two models reverse AxB as well as AxB + offset
    > work fine, but for index x length you need as-pair value/1 + value/2
    > negate value/2 and AxB + (1x0 * offset) respectively, and it's a mess.
    >
    > And I also see this feature as a poor man's substitute for the range!
    > datatype, so I'd prefer it to stay within segment thinking.
    >
    > —
    > Reply to this email directly, view it on GitHub
    > <https://github.com/red/red/issues/5263#issuecomment-1369889349>, or
    > unsubscribe
    > <https://github.com/notifications/unsubscribe-auth/AADQKL5RD2ZKK5OE7RGCNJLWQQ7M7ANCNFSM6AAAAAATOHSRYU>
    > .
    > You are receiving this because you are subscribed to this thread.Message
    > ID: ***@***.***>
    >

