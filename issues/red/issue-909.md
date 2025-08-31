
#909: Change convention of /LOCAL to use LOCAL: instead
================================================================================
Issue is closed, was reported by hostilefork and has 8 comment(s).
<https://github.com/red/red/issues/909>

The case for this was made in [CC#2108](http://curecode.org/rebol3/ticket.rsp?id=2108).  It has the advantage of putting LOCAL: out of band (along with RETURN:, EXTERN:, WITH:) so that it can't be expected to be used as a refinement, e.g.

```
>> x: func [/local z] [if local [print z]] 
>> x/local "silly..."
silly...
```

(In addition to being silly it could trip up some security scenarios.)

Also, it does not make /LOCAL an illegal name as a refinement.  Existing routines using /LOCAL instead of LOCAL: would have the consequence of allowing the above, as well as showing /LOCAL in the help.

For Red/System supporting both doesn't matter in the near term, as it still doesn't have refinements (right?)  If it did, then presumably the same issue - using /LOCAL would mean you could invoke with the parameters, while local: would not allow it and be actual locals.  Until refinements were implemented there could just be no difference.



Comments:
--------------------------------------------------------------------------------

On 2014-08-26T09:14:18Z, PeterWAWood, commented:
<https://github.com/red/red/issues/909#issuecomment-53394540>

    I have moved this proposal to the Wiki - https://github.com/red/red/wiki/Change-convention-of--LOCAL-to-use-LOCAL:-instead

--------------------------------------------------------------------------------

On 2014-08-26T09:18:54Z, meijeru, commented:
<https://github.com/red/red/issues/909#issuecomment-53394982>

    I noted the move, which occurred while I was writing the below comment. My question remains valid, I think.
    
    An interesting suggestion! I can see the consistency of having RETURN:, LOCAL:, EXTERN: but what about WITH: ? Where does it occur?

--------------------------------------------------------------------------------

On 2014-08-26T13:00:02Z, PeterWAWood, commented:
<https://github.com/red/red/issues/909#issuecomment-53416201>

    Your question appears very valid to me. Whilst the wiki is a good medium for putting together proposals, it really isn't an effective forum for discussions. That said neither is this issues list (maybe because of the way it is used by the project (rather than the technology).
    
    Personally, I feel that the Red Google Group is the better alternative for such discussions as it supports threaded conversations and is accessible via both a web interface and email.
    
    I will summarise this issue in a new thread at Google Groups to start the ball rolling. 

--------------------------------------------------------------------------------

On 2014-08-26T13:18:17Z, dockimbel, commented:
<https://github.com/red/red/issues/909#issuecomment-53418428>

    Agreed with Peter. In addition to that, such core change (if decided that it should be implemented) would need to be adopted in both Red and Rebol, else the divergence would make it a no-go (better keep compatibility between Red and Rebol rather than diverge for a small and questionable gain.

