
#3306: New console help/about gives invalid path error on clicking links
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[type.bug] [status.duplicate] [GUI]
<https://github.com/red/red/issues/3306>

### Expected behavior

Help about contains two links: `red-lang.org` and `github.com/red/red`. These should both be clickable.
### Actual behavior

The first one is indeed displaying the Red site, the second one is inoperative.
### Steps to reproduce the problem

Run the console, select help/about and click on the second link: nothing happens
### Version (run `about` in the Red Console and paste the result here) also add OS version.

Red 0.6.3 for Windows built 31-Mar-2018/17:00:58 commit #d8e9eaad (on Win10)

The culprit is the [following line in the `link` style](
https://github.com/red/red/blob/master/environment/console/GUI/settings.red#L72) where `face/font` is `none`.



Comments:
--------------------------------------------------------------------------------

On 2018-04-06T12:02:20Z, dockimbel, commented:
<https://github.com/red/red/issues/3306#issuecomment-379232799>

    This issue has the same cause as #3300. Closing this ticket now.

