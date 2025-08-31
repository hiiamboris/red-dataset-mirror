
#15: WISH: read and replace a map value in an atomic action #3299
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[Wish]
<https://github.com/red/REP/issues/15>

Previously: https://github.com/red/red/issues/3299

Got a map!:

m: #( k: 100 )

Need so swap the value of k with a new one:

oldk: also m/k m/k: 200

Both m/k: 200 and put m 'k 200 return the new value 200 (which makes sense). But for the task that makes 2 hash calculations and 2 lookups.
For now, using a workaround:

m: #( k: [100] )
oldk: swap [200] m/k

Since map operations are computationally heavy, I wish there was a way to make put return the old value instead, like:

m: #( k: 100 )
oldk: put/swap m 'k 200
100 = oldk
200 = m/k

That would save extra block navigations...


Comments:
--------------------------------------------------------------------------------

On 2021-05-06T11:30:19Z, hiiamboris, commented:
<https://github.com/red/REP/issues/15#issuecomment-833450393>

    I withdraw the "computationally heavy" argument: compared to the time the interpreter takes to evaluate a single token, hash calculation & lookup is negligible unless the key is a long string.
    
    Convenience argument stays, though I didn't encounter this use case any more since.

--------------------------------------------------------------------------------

On 2022-01-15T00:19:35Z, greggirwin, commented:
<https://github.com/red/REP/issues/15#issuecomment-1013556789>

    `Swap` in general could be applied to series positions, map keys, or words, in any combination. If there are no more strong cases for this, where a hard-to-name helper would be enough, should we close this?

