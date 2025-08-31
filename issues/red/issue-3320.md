
#3320: Form and to string! on image - not enough memory
================================================================================
Issue is closed, was reported by nedzadarek and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3320>

### Expected behavior 
It should return string
### Actual behavior
```
*** Internal Error: not enough memory
*** Where: form
*** Stack:  
```
And Red.exe took 1GB ram.
### Steps to reproduce the problem
```
form make image! [10x10]
to-string make image! [10x10]
```
### Red and platform version
```
Red for Windows version 0.6.3 built 26-Mar-2018/1:14:22+02:00
```
Win 8.1 64b with 4GB ram


Comments:
--------------------------------------------------------------------------------

On 2018-04-06T23:16:02Z, greggirwin, commented:
<https://github.com/red/red/issues/3320#issuecomment-379408303>

    Confirmed on Windows 7.

--------------------------------------------------------------------------------

On 2018-04-06T23:16:11Z, greggirwin, commented:
<https://github.com/red/red/issues/3320#issuecomment-379408326>

    `Mold` is fine.

--------------------------------------------------------------------------------

On 2018-04-07T16:11:22Z, meijeru, commented:
<https://github.com/red/red/issues/3320#issuecomment-379480567>

    1x1 and 2x2, even 2x3 are OK. Trouble starts (on W10) from 3x3 already.

--------------------------------------------------------------------------------

On 2018-04-07T20:22:16Z, nedzadarek, commented:
<https://github.com/red/red/issues/3320#issuecomment-379496648>

    @meijeru It seems that problem starts when you multiply `x` by `y` and it is equal or greater than `8`, e.g. `1x8`, `2x4`, `3x3`.

--------------------------------------------------------------------------------

On 2018-04-07T21:15:18Z, meijeru, commented:
<https://github.com/red/red/issues/3320#issuecomment-379499721>

    Hopefully all of this is enough to put @qtxie on the right track...

--------------------------------------------------------------------------------

On 2018-04-07T23:30:45Z, qtxie, commented:
<https://github.com/red/red/issues/3320#issuecomment-379506573>

    @meijeru @nedzadarek Very useful information. Thanks a lot. :+1: 

