
#1826: Problem with Console
================================================================================
Issue is closed, was reported by Bitsoma and has 8 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1826>

I am not sure whether p is a reserved word in the Red 6.0 console.
When I start the console and type p I get "red>> " as the value of p.
Typing 'what' doesn't show p as defined, but type? gives string.



Comments:
--------------------------------------------------------------------------------

On 2016-04-18T20:43:09Z, meijeru, commented:
<https://github.com/red/red/issues/1826#issuecomment-211567796>

    Are you using the latest version?

--------------------------------------------------------------------------------

On 2016-04-18T21:34:01Z, x8x, commented:
<https://github.com/red/red/issues/1826#issuecomment-211592560>

    @Bitsoma that regression was fixed in commit https://github.com/red/red/commit/110433016f0f6b08e5b454db80ef268fcc046992

--------------------------------------------------------------------------------

On 2016-04-19T04:03:50Z, dockimbel, commented:
<https://github.com/red/red/issues/1826#issuecomment-211720752>

    Closing this ticket as it is fixed already.

--------------------------------------------------------------------------------

On 2016-04-19T06:37:52Z, Bitsoma, commented:
<https://github.com/red/red/issues/1826#issuecomment-211757399>

    I was using 0.6.0 from April 5.
    I can confirm the problem is fixed in 0.6.0 from April 19.
    
    Thanks!
    
    Am 18.04.2016 um 22:43 schrieb Rudolf Meijer notifications@github.com:
    Are you using the latest version?
    —
    You are receiving this because you authored the thread.
    Reply to this email directly or view it on GitHub

