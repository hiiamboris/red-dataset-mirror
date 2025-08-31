
#1092: Binary recompiles console after every reboot on Linux
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/1092>

This was reported by Matt Gushee on the Red Mailing List:

I'm coming back for another look at Red (and the recent progress is impressive), and am noticing again something that bothered me before: that when the console is compiled on Linux, the executable is placed in /tmp/red. That means in practice (at least on every Linux distro I'm familiar with) that it needs to be recompiled after every reboot. And the Linux Filesystem Hierarchy Standard (FHS) says that:

"Programs must not assume that any files or directories in /tmp are preserved between invocations of the program."

Anyway, on my not-very-fast laptop, compiling the console takes about 20 seconds; on my rather-slow desktop, more than 30s. Admittedly, it's just an annoyance, but I would think that a new language that will surely face many barriers to acceptance should try to eliminate any annoyances that are easily eliminated.

I think the right place would be /var/cache/red. Regarding /var/cache, the FHS says:

"/var/cache is intended for cached data from applications. Such data is locally generated as a result of time-consuming I/O or calculation. The application must be able to regenerate or restore the data. Unlike /var/spool, the cached files can be deleted without data loss. The data must remain valid between invocations of the application and rebooting the system.

Files located under /var/cache may be expired in an application specific manner, by the system administrator, or both. The application must always be able to recover from manual deletion of these files (generally because of a disk space shortage). No other requirements are made on the data format of the cache directories."

If there is concern about the user lacking permission to create directories under /var/cache, then maybe the location could be overridden with an environment variable? Or perhaps allow the option of a system-wide install, where the console is placed in /var/cache, or a single-user install, where it is placed in $HOME/.cache.

Anyway, it's a minor issue (and will not stop me from learning/using Red at this stage), but I think it should be taken care of at some point.



Comments:
--------------------------------------------------------------------------------

On 2015-04-09T08:17:38Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1092#issuecomment-91146791>

    Stéphane Aulery made the following comment on Matt's email:
    
    "/var/cache/<package> is for data computed by the package, not executable.
    The right directory is /opt/<package>. If red is packaged, instead
    /usr/bin is the right. (where <package> is red)."

--------------------------------------------------------------------------------

On 2015-04-21T08:33:28Z, dockimbel, commented:
<https://github.com/red/red/issues/1092#issuecomment-94701939>

    The main issue with all the propositons is that we want Red to be zero-install by default, so only folders that the current user can access are an option. I think that $HOME/.red/ is the place that we'll choose until a better solution is found (at least, it will avoid the volatility of /tmp/ content).

--------------------------------------------------------------------------------

On 2015-04-21T08:59:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1092#issuecomment-94711267>

    It now uses `$HOME/.red/` since commit [2fecf725](https://github.com/red/red/commit/d67f43e04155e1a8bf82d7cf71b9a8dd2fecf725).

