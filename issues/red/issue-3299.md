
#3299: WISH: read and replace a map value in an atomic action
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[type.wish]
<https://github.com/red/red/issues/3299>

Got a map!:
```
m: #( k: 100 )
```
Need so swap the value of `k` with a new one:
```
oldk: also m/k m/k: 200
```
Both `m/k: 200` and `put m 'k 200` return the new value 200 (which makes sense). But for the task that makes 2 hash calculations and 2 lookups.
For now, using a workaround:
```
m: #( k: [100] )
oldk: swap [200] m/k
```
Since map operations are computationally heavy, I wish there was a way to make `put` return the old value instead, like:
```
m: #( k: 100 )
oldk: put/swap m 'k 200
100 = oldk
200 = m/k
```
That would save extra block navigations...



Comments:
--------------------------------------------------------------------------------

On 2018-04-01T14:21:03Z, 9214, commented:
<https://github.com/red/red/issues/3299#issuecomment-377790087>

    Initially I suggested more general `/after` refinement for `set` and `put`, which sets/puts new value and returns previous one.

--------------------------------------------------------------------------------

On 2018-04-01T19:13:56Z, greggirwin, commented:
<https://github.com/red/red/issues/3299#issuecomment-377809609>

    I was initially resistant to this idea, but I'm warming to it. The change will not be quick, because `object!` and all `series!` types need to support it as well, and their implementations vary. It looks like there are a few tests in %map-test.red, but not a %put-test.red suite that covers other types. @PeterWAWood  may know if I'm missing something there.
    
    @hiiamboris, if this change is made, are you willing to write `put` tests to ensure we catch any regressions?

--------------------------------------------------------------------------------

On 2018-04-02T05:19:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/3299#issuecomment-377857116>

    @greggirwin I could try, with your guidance :)

--------------------------------------------------------------------------------

On 2018-04-25T06:41:57Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3299#issuecomment-384177139>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

