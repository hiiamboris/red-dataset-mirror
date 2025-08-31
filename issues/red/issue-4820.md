
#4820: Redbin can't handle some values (handle, event, routine)
================================================================================
Issue is closed, was reported by greggirwin and has 10 comment(s).
[status.wontfix] [type.design]
<https://github.com/red/red/issues/4820>

It's an interesting question, about how to make it most useful, not knowing yet all the ways we might want to. e.g. can we safely save handles and events as none (maybe zero for handle)? We just say they aren't saved, and why. Or we do save them, but note that they are just data values and not portable across the wire. Maybe still useful for debugging. Need to decide if events go across as just a binary, so they could be decoded and seen elsewhere. That leads to thinking about event streams in logs. 

On routines, there aren't many. Some of those are simply optimizations, but as a general case there could be more and for more reasons. But here's the funny thing about them. We can reflect on them. `Help` shows you their source, so we could, if we wanted, serialize their spec and body just like functions. Have to think about how this plays out in real use cases, where compilation on the decoder's side has to be done to reactivate them as their original, active values.

_Originally posted by @greggirwin in https://github.com/red/red/issues/4816#issuecomment-771215694_

See also: https://github.com/red/docs/blob/master/en/redbin.adoc#unsupported


Comments:
--------------------------------------------------------------------------------

On 2021-02-09T18:45:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4820#issuecomment-776156511>

    I could care less about routines, but I find it useful to save & load handles. Ideally we would have 2 variants: normal Redbin and unsafe Redbin. But I don't see a good interface for such option. Adding a refinement to `load` just for one codec doesn't make sense. Adding an alias of Redbin as Redbin-Unsafe is also weird, if better.

--------------------------------------------------------------------------------

On 2021-02-09T21:37:31Z, greggirwin, commented:
<https://github.com/red/red/issues/4820#issuecomment-776260910>

    Why it's important, IMO, is that it's Red data, which we should be able to send around. That doesn't mean, even if it would be really cool, that we can serialize a system image and distribute continuations and such, but if you have to sanitize your data before serializing, it becomes much lossier. Think about things like automated analysis, or the ability to replay events. We can do this at higher levels, too, but having a complete codec rather than "almost" seems worth a few tradeoffs. 

--------------------------------------------------------------------------------

On 2021-08-19T12:53:56Z, dockimbel, commented:
<https://github.com/red/red/issues/4820#issuecomment-901890228>

    Handles: they are memory pointers or OS-resource value. They are *session-specific*, so by definition, there is no point in saving them for use in a later session.
    
    Routines: we could store in Redbin their source code version and later JIT-compile it on the receiver side. We can consider that once we have a JIT-compiler built in Red runtime.
    
    Events: we plan to redesign events to be able to store more information and be more flexible (can be created by user, can be injected in the event loop,...). So that the next version on `event!` should be serializable, but that requires a pre-study, to see how they could be untied from the OS backend.
    
    > can we safely save handles and events as none (maybe zero for handle)? We just say they aren't saved, and why
    
    We need a mechanism to regenerate them in a new session. We need to research on how that could be achieved. For face handles, they will be regenerated automatically on calling `view` or `show` if the `face/state` field is set to `none`. For other types of handles, they probably require adhoc solutions. We could look into Smalltalk and other live environments to see if they have a general solution.

--------------------------------------------------------------------------------

On 2021-08-19T17:20:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/4820#issuecomment-902098687>

    On routines... That's all cool as long as they're bare R/S code. But how do we handle it when routines use code from the runtime? What if on the receiving side there runs a different version of the runtime? Or fully customized one?
    
    I guess JIT compiler will have to include full source of the runtime.
    
    Same argument to an extent applies to natives & actions, currently saved as just indexes and Red spec. How do we know their indexes, interface (R/S spec, Red spec) and behavior (R/S code) will be compatible between Red runtimes? 
    
    An easy way out is to encode and check runtime versions, failing to load values if version is not compatible. But this is limiting.

--------------------------------------------------------------------------------

On 2022-08-24T15:04:20Z, dockimbel, commented:
<https://github.com/red/red/issues/4820#issuecomment-1225850578>

    Given that there's nothing to fix or implement from this ticket, as the behavior of Redbin conforms to its specification, I'll close this ticket.

