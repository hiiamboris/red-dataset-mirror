
#4803: Redbin a little too tight?
================================================================================
Issue is closed, was reported by hiiamboris and has 18 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/4803>

**Describe the bug**
```
Red []
b: []
repeat i 5000 [append b form i]    ;) 4999 does not trigger the error
save/as #{} b 'redbin
```
Output:
```
*** Internal Error: internal limit reached: 20000
*** Where: encode
*** Stack: save
```

Cause:
https://github.com/red/red/blob/de5c05e715291ee13afec3478416c3c6d52e912b/runtime/redbin.reds#L175


**Expected behavior**

No limit.

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```



Comments:
--------------------------------------------------------------------------------

On 2021-01-27T16:31:26Z, dockimbel, commented:
<https://github.com/red/red/issues/4803#issuecomment-768407579>

    That is a bit of nit-picking. ;-) Handling a dynamic buffer is significantly harder to implement, you are welcome to propose a PR for it.

--------------------------------------------------------------------------------

On 2021-01-27T16:35:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/4803#issuecomment-768410033>

    I just like to be able to save and then load big maps as redbin ;) And maybe not just maps...
    
    I didn't look into the implementation of it though. Why the limitation?

--------------------------------------------------------------------------------

On 2021-01-27T18:57:57Z, greggirwin, commented:
<https://github.com/red/red/issues/4803#issuecomment-768501026>

    @hiiamboris I think your last comment goes with the checksum/WSL ticket.

--------------------------------------------------------------------------------

On 2021-01-27T19:01:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4803#issuecomment-768502881>

    Right. Thanks!
    
    
    

--------------------------------------------------------------------------------

On 2021-01-27T19:23:04Z, greggirwin, commented:
<https://github.com/red/red/issues/4803#issuecomment-768518819>

    We need to define the goal of Redbin, and clearly state limitations that may exist. Right now the docs say
    
    > it can encode binding information for any-word! values, references to shared buffers for series! values, and can handle arbitrary cycles for any-block! values.
    
    The above example encodes to ~80K, which isn't large by any means. Obviously we don't want to allocate a huge amount of memory, not knowing if we're just encoding a single int, but no matter how large we make a fixed buffer someone will hit it eventually. 
    
    1) There is no allocation if `redbin` is never used in an app, correct? So only those using it pay the price.
    2) Dynamically adjusting the output will be a good amount of work, and more low level memory manipulations which means bugs are scarier.
    
    Can we make it an option in system? Right now `list` is allocated once for the context. Is there any reason `reset` couldn't check `system/options/redbin-max-size, ` free `list`, and reallocate `list` at the new size if it's changed, resetting `top/end` too? This way we get documentation of the limit, put the user in control, even allowing recovery by simply changing the limit and encoding again. I don't know if anything else in R/S does it, but we could even dump helpful info when firing the limit error. e.g. "To change the redbin limit, set system/options/redbin-max-size"

--------------------------------------------------------------------------------

On 2021-01-28T15:46:04Z, dockimbel, commented:
<https://github.com/red/red/issues/4803#issuecomment-769176204>

    > I didn't look into the implementation of it though. Why the limitation?
    
    You should ask @9214 who implemented it. ;-)
    
    That said, I overlooked your code and thought it was related to nested series, which is not the case here. So this limitation is definitely an issue to be fixed.

--------------------------------------------------------------------------------

On 2021-01-28T18:48:45Z, greggirwin, commented:
<https://github.com/red/red/issues/4803#issuecomment-769296850>

    @dockimbel is the `system/...` option OK with you? If so, any better name?

--------------------------------------------------------------------------------

On 2021-01-30T00:46:09Z, greggirwin, commented:
<https://github.com/red/red/issues/4803#issuecomment-770122948>

    @hiiamboris if you're up for it, give the system/option change a shot. We can find with @dockimbel later. ;^) Something else to think about is if the user should be able to free the R/S buffer via a call, so if it's large it's not sitting unused once the data is loaded. Kind of like manually calling `recycle`. It's certainly an optimization though, and not required. Food for thought, to be an example to others, as another way people can control memory pressure.

--------------------------------------------------------------------------------

On 2021-02-01T05:32:35Z, greggirwin, commented:
<https://github.com/red/red/issues/4803#issuecomment-770579320>

    The work so far looks nice. I haven't reviewed in detail, but maybe add a couple comments about, e.g., the `+ 2` aspect and how the pieces tie together. 

