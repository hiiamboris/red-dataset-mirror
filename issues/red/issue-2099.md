
#2099: write/binary and read/binary does'nt work as expected
================================================================================
Issue is closed, was reported by Rebol2Red and has 0 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2099>

```
write/binary %button.gif read/binary http://www.rebol.com/how-to/graphics/button.gif
downloaded: %button.gif
loaded: load http://www.rebol.com/how-to/graphics/button.gif
view [image downloaded return image loaded]
```

There is a black line beneath the downloaded %button.gif and not on the loaded button.gif



