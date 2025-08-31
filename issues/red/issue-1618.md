
#1618: Cursor remains two characters left in Gui console under Wine. Typing becomes difficult
================================================================================
Issue is closed, was reported by Josh1-rtd and has 6 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1618>

red-11feb16-9ff1262.exe started from X terminal in Ubuntu 15.10

In the snapshot below, cursor can be seen between b and e of number.

![redgui](https://cloud.githubusercontent.com/assets/17100026/12977175/3ae95700-d0ef-11e5-8d77-042c79fe2ea7.png)



Comments:
--------------------------------------------------------------------------------

On 2016-02-11T16:25:21Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1618#issuecomment-182942578>

    Cursor became al right after installing Consolas font in Wine.
    So this issue may be closed.

--------------------------------------------------------------------------------

On 2016-02-18T18:35:11Z, x8x, commented:
<https://github.com/red/red/issues/1618#issuecomment-185850989>

    Instructions to install Wine with Consolas font on OSX:
    
    ``` sh
    brew install wine --without-x11 --devel
    brew install winetricks
    # set Wine to default to Windows 7
    winetricks win7
    # install Consolas font
    winetricks consolas
    ```
    
    almost ready to go, download latest Windows automated Red build and launch it with wine:
    
    ``` sh
    curl -o red.exe http://static.red-lang.org/dl/auto/win/red-19feb16-f834e41.exe
    wine red.exe
    ```
    
    [should be similar with apt-get (Debian) and pacman (Arch Linux)]

--------------------------------------------------------------------------------

On 2016-02-21T08:44:24Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1618#issuecomment-186775916>

    I recommend including these instructions in the Red Installation instructions and thereafter close this issue.

