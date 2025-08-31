
#1649: WRITE/APPEND doesn't work
================================================================================
Issue is closed, was reported by JenniferLee520 and has 10 comment(s).
<https://github.com/red/red/issues/1649>

It should append the file, instead of overwriting it.

``` Red
write %file.txt "123"
write/append %file.txt "456"
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-19T09:03:10Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1649#issuecomment-186122863>

    Which version are you using Jennifer?
    
    It worked when I tried it using the latest master to compile a console under OS/X
    
    ``` Red
    red>> write %file.txt "123"
    red>> read %file.txt
    == "123"
    red>> write/append %file.txt "456"
    red>> read %file.txt
    == "123456"
    ```

--------------------------------------------------------------------------------

On 2016-02-19T09:05:19Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1649#issuecomment-186123280>

    It also worked as expected using the gui-console on Windows 7 compiled from the latest source.

--------------------------------------------------------------------------------

On 2016-02-19T09:08:28Z, dockimbel, commented:
<https://github.com/red/red/issues/1649#issuecomment-186123980>

    It works fine here too.

--------------------------------------------------------------------------------

On 2016-02-19T09:22:04Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1649#issuecomment-186127450>

    OK, then. I will download the latest and try. I am using MacOS.

--------------------------------------------------------------------------------

On 2016-02-19T09:29:23Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1649#issuecomment-186133369>

    OK. The latest version of Red doesn't have this problem. So, I close this ticket. Sorry for the false alarm and waste your time. I will be more cautious next time.

