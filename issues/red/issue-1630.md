
#1630: offset too far negative
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1630>

Consider the following code:

```
prin "screen-size: " print system/view/screens/1/size
print "window:"
foreach len [100 200 300 400 500 600 700 800] [
    txt: copy ""
    loop len [append txt "x"]
    view lyt: layout [area txt]
    prin "  offset: " prin lyt/offset prin "    size: " print lyt/size
]
```

The right-hand edge of each window is set further to the left than the previous one, until the final window is set completely outside of the screen and needs to be closed from the taskbar, as can be imagined from the output below:

```
screen-size: 1280x1024
window:
    offset: 375x427    size: 530x170
    offset: 125x427    size: 1030x170
    offset: -125x427    size: 1286x170
    offset: -375x427    size: 1286x170
    offset: -625x427    size: 1286x170
    offset: -875x427    size: 1286x170
    offset: -1125x427    size: 1286x170
    offset: -1375x427    size: 1286x170
```

Same results when `area` is replaced with `text` or `field`.

This also behaves the same way:

```
prin "screen-size: " print system/view/screens/1/size
print "window:"
foreach len [10 20 30 40 50 60 70 80] [
    blk: copy []
    loop len [append blk [text "Hello, World!"]]
    view lyt: layout blk
    prin "  offset: " prin lyt/offset prin "    size: " print lyt/size
]
```

This time it's the last 4 windows that are completely outside the screen, despite what's claimed in the last 2 lines of the output:

```
screen-size: 1280x1024
window:
    offset: 185x490    size: 910x44
    offset: -265x490    size: 1286x44
    offset: -715x490    size: 1286x44
    offset: -1165x490    size: 1286x44
    offset: -1615x490    size: 1286x44
    offset: -2065x490    size: 1286x44
    offset: -2515x490    size: 6310x44
    offset: -2965x490    size: 7210x44
```

Sometimes, the exact same code gives different sizes in the output, but the last 4 windows are still completely outside the screen:

```
screen-size: 1280x1024
window:
    offset: 185x490    size: 910x44
    offset: -265x490    size: 1286x44
    offset: -715x490    size: 1286x44
    offset: -1165x490    size: 1286x44
    offset: -1615x490    size: 1286x44
    offset: -2065x490    size: 5410x44
    offset: -2515x490    size: 1286x44
    offset: -2965x490    size: 7210x44
```

All of the above behaviours are the same on both Windows XP and Window 7, except that in the last example, Windows 7 gives the same output for the same code each time for the few times it's been tested so far:

```
screen-size: 1280x957
window:
    offset: 185x456    size: 910x44
    offset: -265x456    size: 1294x44
    offset: -715x456    size: 1294x44
    offset: -1165x456    size: 1294x44
    offset: -1615x456    size: 1294x44
    offset: -2065x456    size: 1294x44
    offset: -2515x456    size: 1294x44
    offset: -2965x456    size: 1294x44
```

Which is accurate to what is happening: which is that the windows still drift to the left until the last 4 are completely outside the screen.



Comments:
--------------------------------------------------------------------------------

On 2016-02-16T13:13:04Z, WiseGenius, commented:
<https://github.com/red/red/issues/1630#issuecomment-184677501>

    Without looking at the code, I suspect that the large negative offsets are there to compensate for the intended size of the window so that the close button could still be reached, but that there is an unanticipated window size limit imposed by the OS, and this is causing the offsets to become overkill.
    I also suspect that that the inconsistent sizes in the output on Windows XP are reflecting this in sometimes returning the size that Red unsuccessfully tried to set the window to, and sometimes returning the actual limited size of the window.

