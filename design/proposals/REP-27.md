
#27: WISH: Red's IO should work with different libc implementations
================================================================================
Issue is open, was reported by rebolek and has 0 comment(s).
<https://github.com/red/REP/issues/27>

Current Red is requires `libc.so.6` library. However, there are different `libc` implementations, for example `musl`, used especially on embedded systems, like OpenWRT or TurrisOS. While it's possible to link musl to libc and Red runs, IO doesn't.
So when full IO is developed for 0.7.0, it should be done in compatible way, so libc can be replaced with musl or uClibc (musl is more POSIX strict than glibc).


