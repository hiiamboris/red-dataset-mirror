
#3146: vector! type unsupported by forall 
================================================================================
Issue is closed, was reported by ldci and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3146>

vectRandom: function [v [vector!] value [number!]
][
	forall v [v/1: random value]
]
*** Script Error: forall does not allow vector! for its 'word argument
*** Where: forall
*** Stack: vectRandom


Comments:
--------------------------------------------------------------------------------

On 2017-12-18T17:19:21Z, meijeru, commented:
<https://github.com/red/red/issues/3146#issuecomment-352493877>

    This is because the macro `ANY_SERIES?` does not include `vector!` by oversight.

--------------------------------------------------------------------------------

On 2017-12-18T17:22:10Z, ldci, commented:
<https://github.com/red/red/issues/3146#issuecomment-352494848>

    Thanks Rudolf

--------------------------------------------------------------------------------

On 2017-12-19T11:48:34Z, ldci, commented:
<https://github.com/red/red/issues/3146#issuecomment-352727083>

    Thanks a lot
    
    Envoyé de mon iPhone
    
    Le 19 déc. 2017 à 12:30, Qingtian <notifications@github.com<mailto:notifications@github.com>> a écrit :
    
    
    Closed #3146<https://github.com/red/red/issues/3146>.
    
    —
    You are receiving this because you authored the thread.
    Reply to this email directly, view it on GitHub<https://github.com/red/red/issues/3146#event-1393942836>, or mute the thread<https://github.com/notifications/unsubscribe-auth/AC6NoZbq0T4pnHuqg2efAeRPqHCDkLtaks5tB55ZgaJpZM4RFwJL>.

