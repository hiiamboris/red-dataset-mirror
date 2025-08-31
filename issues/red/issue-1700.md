
#1700: cd %.. crashes red
================================================================================
Issue is closed, was reported by xqlab and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1700>

cd %.. crashes red under Linux and Wine
and gives
red>> cd %..

**\* Runtime Error 1: access violation
**\* at: 0809664Dh
under Linux



Comments:
--------------------------------------------------------------------------------

On 2016-03-10T15:59:25Z, xqlab, commented:
<https://github.com/red/red/issues/1700#issuecomment-194923003>

    cd crashes always, if the new directory is not an absolute path

--------------------------------------------------------------------------------

On 2016-03-11T10:37:20Z, qtxie, commented:
<https://github.com/red/red/issues/1700#issuecomment-195312138>

    Fixed with the latest version.

