
#622: Add a complement? function
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 16 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/622>

I would like to be able to easily detect whether a bitset! is complemented or not. Now I have to FORM it and scan for the "not" qualifier.



Comments:
--------------------------------------------------------------------------------

On 2013-12-18T17:04:23Z, dockimbel, commented:
<https://github.com/red/red/issues/622#issuecomment-30859777>

    We have several options:
    1. a **complemented?** native
    2. a **/not?** path for bitsets that would return a logic! value: `a: charset "abc" probe a/not?`
    3. a _mode_ for **get/set-modes**: `get-modes a 'not?`
    
    I was initially going to implement option 2, but 1 might be good or better, I'm not sure. For 3, it seems R3 dropped support for get/set-modes, but they might still be useful in some cases in Red.
    
    Let me hear your opinions.

--------------------------------------------------------------------------------

On 2013-12-18T23:56:25Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/622#issuecomment-30893579>

    I think complement? is clear enough and shorter than complemented?.
    
    A generic attributes method is intriguing, though; I've often thought about that.

--------------------------------------------------------------------------------

On 2013-12-18T23:57:47Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/622#issuecomment-30893671>

    By the way, GitHub is misinterpreting your issue notation.

--------------------------------------------------------------------------------

On 2013-12-19T14:37:53Z, dockimbel, commented:
<https://github.com/red/red/issues/622#issuecomment-30932962>

    Thanks, removed the hash characters from my comment above.

--------------------------------------------------------------------------------

On 2014-03-25T11:08:15Z, dockimbel, commented:
<https://github.com/red/red/issues/622#issuecomment-38552159>

    We will implement a **complement?** native for now to cover that need.

--------------------------------------------------------------------------------

On 2014-03-25T18:38:32Z, BrianHawley, commented:
<https://github.com/red/red/issues/622#issuecomment-38603588>

    R3 dropped support for get-modes/set-modes, but only because we wanted to add a replacement for them with a better API, and which worked with the new port model better. Hasn't happened yet. The equivalent for this kind of thing (not applying specifically to ports or files) would be `reflect`, but since it would only apply to one datatype there's no reason not to just make it a native.
    
    The `/not?` method looks cool, but if it's not resolved by the compiler then it would probably slow down path access to the values, just by being an extra branch to be processed. A separate function would be faster. The names `complement?` and `complemented?` both look good, though the latter looks better to a native English speaker; is there a problem with having both names?

--------------------------------------------------------------------------------

On 2014-03-25T18:51:05Z, dockimbel, commented:
<https://github.com/red/red/issues/622#issuecomment-38605153>

    @BrianHawley Thanks for the feedback!
    
    We could have both names but it might create a precedent that someone could invoke to duplicate other functions name, so it is a bit risky IMO. Also, it artificially extends the list of functions someone has to remember when coding in Red. What do you think?
    
    About get/set-modes, I'm glad they are not completly gone, we need to discuss it, but somewhere else (a specific CC ticket or in SO chat).

--------------------------------------------------------------------------------

On 2014-03-25T19:03:45Z, BrianHawley, commented:
<https://github.com/red/red/issues/622#issuecomment-38606635>

    Well, having different names for the same function allows you to make it easier to find the function in the help and easier to understand what you're reading - all you need is English. It's not really a bad precedent, and for Rebol the precedent is already set with `bind?` being an alternate to the default of `bound?` - `bound?` is better grammatically, but `bind?` shows up in help when you search for "bind". The only downside is if you displace a more useful meaning for the same word, which doesn't seem to be the case here. Though in this case, the alternate spelling that needs justifying would be `complement?`, since the `complemented?` spelling is better grammatically, and would already show up in a help search for "complement".
    
    The get/set-modes functionality (with likely different function names and API) was waiting for a discussion about what the appropriate API should be. All we knew was that we didn't want to use the old API - beyond that we haven't talked it through. Any start to that discussion is welcome.

