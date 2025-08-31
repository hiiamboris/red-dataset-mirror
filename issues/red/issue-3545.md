
#3545: GUI displays the word "Button" after a checkbox on macOS
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3545>

### Expected behavior

<img width="407" alt="widnows check box" src="https://user-images.githubusercontent.com/697434/46077522-c2748600-c1c3-11e8-9e9e-f9cda9fbfdaa.png">

### Actual behavior

<img width="512" alt="macos check box" src="https://user-images.githubusercontent.com/697434/46077531-c99b9400-c1c3-11e8-9c9d-3dba169a2d39.png">

### Steps to reproduce the problem
Enter this expression in a GUI console on macOS
```
view [size 400x200 check true check false]
```
### Red and platform version
```
commit 51240a02fecf996a35cc79c398c95bf7764493e0 (HEAD -> master, upstream/master, origin/master, origin/HEAD)
Date:   Mon Sep 24 17:34:26 2018 -0600

macOS 10.12.6
```


Comments:
--------------------------------------------------------------------------------

On 2018-09-28T22:07:53Z, greggirwin, commented:
<https://github.com/red/red/issues/3545#issuecomment-425579471>

    Is it true for any other styles, and does it happen if you provide an empty string as a caption?

--------------------------------------------------------------------------------

On 2018-09-29T08:08:03Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3545#issuecomment-425626094>

    It doesn't happen if you provide an empty string as a caption or reduce the size of the checkbox to 15.

