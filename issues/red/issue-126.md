
#126: QUIT should use exit()
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.reviewed]
<https://github.com/red/red/issues/126>

QUIT is currently implemented as a syscall. Due to that, the C library doesn't get the chance to shut down. For example, C file buffers aren't flushed, so written data can be lost, which can be surprising to the programmer.

I think when Red uses the C library, it should use exit() to quit. Here's a binding:

```
quit: "exit" [  ; Exit program, returning status code.
    status      [integer!]
]
```



