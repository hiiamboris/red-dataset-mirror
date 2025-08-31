
#2695: DOC: Not entirely correct HELP text
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/2695>

The text printed in response to `>> help` contains the phrase
```
??     - Display a variable and its value
```
The word `variable` is better replaced by `word` because that is what the spec of `??` says.


Comments:
--------------------------------------------------------------------------------

On 2017-05-27T03:33:32Z, greggirwin, commented:
<https://github.com/red/red/issues/2695#issuecomment-304424271>

    I just put in a PR for this, but also realized that the help uses Display, Print, and Show in the "Other" section. There is no difference between them, so it's a question of whether the different words imply that they work differently, or if they just make the help more interesting to read. 
    
    Fixed comment here, since `what` *can* show words, if you use `/with`.

--------------------------------------------------------------------------------

On 2017-06-05T23:02:35Z, greggirwin, commented:
<https://github.com/red/red/issues/2695#issuecomment-306334655>

    This is complete @meijeru. Can we close it?

