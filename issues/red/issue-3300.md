
#3300: Regression in VID styles
================================================================================
Issue is closed, was reported by qtxie and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3300>

### Code
```
view [
	title "Settings"
	style bbox: base 20x20 draw [pen gray box 0x0 19x19] on-down [
		probe "on-down event"
	]
	bbox #000000 bbox #002b36 bbox #073642
]
```
### Expected behavior
Click on any bbox will trigger on-down event and print "on-down event".
### Actual behavior
Only the first bbox has response.
### Steps to reproduce the problem
Click the bbox.
### Version (run `about` in the Red Console and paste the result here) also add OS version.
Master branch, latest commit. Red 0.6.3 for Windows 7 64 bit built 1-Apr-2018/8:06:03
### Regression
It's a regression, this commit [052011cf373619808ffff8d8065d89fadf2e9fc6] causes the issue.


Comments:
--------------------------------------------------------------------------------

On 2018-04-02T14:37:51Z, meijeru, commented:
<https://github.com/red/red/issues/3300#issuecomment-377943433>

    Possibly connected to #3306 also.

--------------------------------------------------------------------------------

On 2018-04-03T12:40:28Z, toomasv, commented:
<https://github.com/red/red/issues/3300#issuecomment-378235573>

    When defining a style with actor(s), only first instance of the style will execute the actor(s) (build of April 1st, W10), e.g. in following I alternately click on two faces, but only the first responds:
    ```
    >> view [style btn: button [probe face/text] btn "b1" btn "b2"]
    "b1"
    "b1"
    "b1"
    "b1"
    >> view [style btn: check [probe face/text] btn "b1" btn "b2"]
    "b1"
    "b1"
    "b1"
    >> view [style btn: radio [probe face/text] btn "b1" btn "b2"]
    "b1"
    "b1"
    "b1"
    ```
    Same with `field`; I didn't check other faces.

