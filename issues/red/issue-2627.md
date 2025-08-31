
#2627: `wait` in GUI console freezes output from iteration until it's ended
================================================================================
Issue is open, was reported by 9214 and has 8 comment(s).
[status.waiting] [type.review] [GUI]
<https://github.com/red/red/issues/2627>

```
>> repeat i 5 [print i wait 1]
; ... after 5 seconds
1
2
3
4
5
```
This is unexpected, I think it should be something like this (as in R2):
```
>> repeat i 5 [print i wait 1]
1
; sleep 1 sec
2
; sleep 1 sec
3
; sleep 1 sec
; etc
```

UPD: @rcqls reported that Red version works as expected on OSX and Linux (and I'm on Win7 with latest Red build). Also, it works just like R2 version in `red --cli`, so, it has something to do with GUI console on Win.


Comments:
--------------------------------------------------------------------------------

On 2017-04-25T12:34:16Z, qtxie, commented:
<https://github.com/red/red/issues/2627#issuecomment-297015672>

    Same issue #1840 , will be fixed in 0.6.4.

--------------------------------------------------------------------------------

On 2018-03-27T08:42:55Z, dockimbel, commented:
<https://github.com/red/red/issues/2627#issuecomment-376444474>

    It works fine in 0.6.4 branch using the new console.

--------------------------------------------------------------------------------

On 2019-03-20T08:26:56Z, endo64, commented:
<https://github.com/red/red/issues/2627#issuecomment-474733103>

    We should re-open this issue as it still doesn't work in GUI console. And probably we can close the other issue #1840 as it is duplicate of this one, @greggirwin 
    And label this one as GUI @PeterWAWood 

--------------------------------------------------------------------------------

On 2019-03-20T13:58:03Z, qtxie, commented:
<https://github.com/red/red/issues/2627#issuecomment-474840746>

    It was fixed in an old version of the gui-console using some tricks. I removed it later as we prefer to do it properly in 0.7 with Full I/O support.

