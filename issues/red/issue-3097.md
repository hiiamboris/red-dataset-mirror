
#3097: request-font selects incorrect font size
================================================================================
Issue is closed, was reported by endo64 and has 18 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/3097>

### Expected behavior
Font requester should open with selected font size.

### Actual behavior

Font requester window opens with a font bigger than the provided font size.

### Steps to reproduce the problem

Open font requester by providing a font object with size 10. Just click on Ok, it returns a font object with size 12:

>> request-font/font make font! [name: "Consolas" size: 10]
== make object! [
    name: "Consolas"
    size: 12  ; <<<<

### Red version and build date, operating system with version.

Latest Red compiled from source on 2017-11-05
Win10 x64


Comments:
--------------------------------------------------------------------------------

On 2017-11-05T20:41:28Z, greggirwin, commented:
<https://github.com/red/red/issues/3097#issuecomment-342003724>

    Works correctly on Win7, x64, just FYI.

--------------------------------------------------------------------------------

On 2017-11-05T20:57:45Z, meijeru, commented:
<https://github.com/red/red/issues/3097#issuecomment-342004930>

    Works correctly on Win10, x64, build 9-Aug

--------------------------------------------------------------------------------

On 2017-11-06T06:46:12Z, endo64, commented:
<https://github.com/red/red/issues/3097#issuecomment-342060388>

    Interesting, I just tested on Win8 x64 it worked. I realized that issue while trying to change font settings of GUI console, every time I open the font settings window and click Ok, font size is getting bigger.

--------------------------------------------------------------------------------

On 2017-12-09T21:39:59Z, endo64, commented:
<https://github.com/red/red/issues/3097#issuecomment-350507447>

    I confirm that this issue appears on Win10 x64, Red build 2-Dec-2017/10:04:41+03:00 (tested with both CLI & GUI console)
    ![3097](https://user-images.githubusercontent.com/840604/33799730-9180d1c2-dd42-11e7-8dce-e794b73848b8.gif)

--------------------------------------------------------------------------------

On 2018-03-30T22:36:02Z, endo64, commented:
<https://github.com/red/red/issues/3097#issuecomment-377638665>

    On Win10 x64 this issue is still there and affects font settings on GUI console

--------------------------------------------------------------------------------

On 2018-03-31T08:51:30Z, qtxie, commented:
<https://github.com/red/red/issues/3097#issuecomment-377677803>

    Are you using a high DPI screen?

--------------------------------------------------------------------------------

On 2018-03-31T20:11:09Z, endo64, commented:
<https://github.com/red/red/issues/3097#issuecomment-377719958>

    I just checked, correct this happens only if I use high DPI, mine was 125%.

--------------------------------------------------------------------------------

On 2018-12-01T13:57:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/3097#issuecomment-443428134>

    Works fine for me W7x64 with 125% scaling.

--------------------------------------------------------------------------------

On 2018-12-01T19:13:09Z, endo64, commented:
<https://github.com/red/red/issues/3097#issuecomment-443450704>

    I just checked, it works for all DPI settings on Win10, we are good to close this ticket as it looks fixed already.

