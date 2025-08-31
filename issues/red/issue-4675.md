
#4675: Lot of READ-THRUs can lead to TIMEOUT error and/or total breakdown of IO
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4675>

Consider this code:
```
repeat i 1000 [link: probe rejoin [http://duckduckgo.com?q= i] read-thru link query path-thru link]
```

On macOS, this ends with timeout error when `i = 249`. On subsequent run, it reads four files from cache and then ends again with `cannot read` error. All IO functions are dead then and it's not even possible to quit Red, as it wants to save console history.

On Linux, this runs fine first time, second time it ends with timeout error when `i = 21` (so it read 1021 files total).  After that, each `read-thru` ends with timeout error, even when cached. Unlike macOS, IO is not totally dead, local file access works and it's possible to quit Red.

Tested on macOS and Linux with latest build, it seems to work fine on Windows.


Comments:
--------------------------------------------------------------------------------

On 2020-10-12T13:46:44Z, 9214, commented:
<https://github.com/red/red/issues/4675#issuecomment-707130283>

    [Gitter log](https://gitter.im/red/bugs?at=5f842fb8cdb04d1ea079a9e1).

--------------------------------------------------------------------------------

On 2020-10-19T13:02:00Z, rebolek, commented:
<https://github.com/red/red/issues/4675#issuecomment-712140527>

    @qtxie I can still reproduce it under different conditions. Unfortunately, I wasn't able to isolate it yet. There's no `query` in the code and it happens *much* later, on macOS it took approximately 100x more tries, it happened after 25149 `read-thru`s. No `query` used this time, only `read-thru`.
    After that, every network related IO operation results in timeout error, but unlike the previous error, file IO is working, so it's possible to quit Red.
    
    I'll open a new bug for it when I have simple way to reproduce it.

