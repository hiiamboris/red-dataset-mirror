
#1990: Flicker in reactive update to view
================================================================================
Issue is open, was reported by asampal and has 16 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/1990>

To reproduce:

Run react-test.red and move the color sliders left and right, relatively quickly. You will note that the text at the bottom which is updated reactively flickers every once in a while. Does view updating not use double-buffering?

Windows 10 64 bit, latest Red built from source



Comments:
--------------------------------------------------------------------------------

On 2016-06-10T23:51:08Z, greggirwin, commented:
<https://github.com/red/red/issues/1990#issuecomment-225321605>

    I don't know if it double buffers, but I can't make it flicker here on Win7.

--------------------------------------------------------------------------------

On 2016-06-11T00:24:40Z, asampal, commented:
<https://github.com/red/red/issues/1990#issuecomment-225324808>

    I tried to capture the flicker in an animated gif, but the result didn't show the flicker. Note, though, that it doesn't flicker for every increment moved, just now and then.

--------------------------------------------------------------------------------

On 2016-06-11T03:51:06Z, ghost, commented:
<https://github.com/red/red/issues/1990#issuecomment-225335013>

    It flickers for me too (sometimes). 
    Windows 8.1

--------------------------------------------------------------------------------

On 2017-02-16T13:11:28Z, dockimbel, commented:
<https://github.com/red/red/issues/1990#issuecomment-280326356>

    Does the flicker still exist using latest version?

--------------------------------------------------------------------------------

On 2017-02-16T13:35:36Z, DideC, commented:
<https://github.com/red/red/issues/1990#issuecomment-280331596>

    I'm still seeing it from time to time (once or two by second) with the last build (at this date).
    Win 7 64bits

--------------------------------------------------------------------------------

On 2020-03-21T19:01:40Z, 9214, commented:
<https://github.com/red/red/issues/1990#issuecomment-602087997>

    Cannot dupe with the latest build on W10.

--------------------------------------------------------------------------------

On 2020-03-21T19:26:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/1990#issuecomment-602091451>

    I can see flicker on W7. It moves smooth for ~30-50 seconds then flickers badly for ~10 seconds, then less and less. And the cycle repeats.

--------------------------------------------------------------------------------

On 2020-03-21T23:40:45Z, asampal, commented:
<https://github.com/red/red/issues/1990#issuecomment-602120018>

    Still flickers for me with the latest updates on Windows 10.
    ![react-test](https://user-images.githubusercontent.com/281639/77239925-8ce10b00-6bb6-11ea-9d58-9c7811e2f946.gif)

