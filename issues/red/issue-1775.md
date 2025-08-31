
#1775: Regression in cli console: automatic insertion of whitespace
================================================================================
Issue is closed, was reported by ghost and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1775>

![a](https://cloud.githubusercontent.com/assets/16458742/14202096/bf9311da-f813-11e5-832d-ad4649bb7812.gif)

Just type something, then ENTER,  then press UP arrow, you get a SPACE inserted for free, then again type something, then press UP arrow, you get more free SPACE's, YAY!!! (not really YAY!!!)...
The GUI Console works fine.

Regression in the latest master binaries of 01-Apr-2016. CLI console works fine in the binaries of 31-March-2016.

It is probably caused by https://github.com/red/red/commit/4aefa269c04364572b3bc92bd2fd2e8d817cc7c0



Comments:
--------------------------------------------------------------------------------

On 2016-04-01T08:48:12Z, dockimbel, commented:
<https://github.com/red/red/issues/1775#issuecomment-204311571>

    Ah, sorry, I went too quickly with the fix for #1769 I guess.

