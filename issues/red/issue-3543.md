
#3543: odd behavior of the layout on macOS
================================================================================
Issue is closed, was reported by ericguedespinto and has 4 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/3543>

### the 'button widget is last on the pane facet of the 'window widget
### On W10 the 'area widget is always behind the 'button widget, but on macOS the 'button is behind the 'area widget
### Red 0.6.3 built 23-Sep-2018/13:24:35+01:00

I am just hitting some unexpected result in my code. This is a cut down version but gets to the point.

```
start: 0x50
win: [
    tools: panel [
    ] 
    return
    at :start area: area 200x200
    at 150x0 h: button "hide" [
        tools/visible?: not tools/visible?
        (either h/text = "hide" [
            area/offset/y: area/offset/y - 50
            tools/parent/size/y: tools/parent/size/y - 50
            h/text: "show"
            probe tools/parent/pane
        ][
            h/text: "hide"
            area/offset/y: area/offset/y + 50
            tools/parent/size/y: tools/parent/size/y + 50
        ])
    ]
]

view win
```

If start: 0x50, than the area widget is placed initially bellow the button and when I click the button, the area gets in front of the button. I am also probing the windows pane block and the button is last, but still behind the area widget.
If, however, start: 0x0, the button is always in front of the area widget. The pane block is always the same, whatever :start value is, and follows the order the widgets were described in the win layout.
Could this be an issue with the layout engine?
I am using MacOS with an up-to-date red

Toomas Vooglaid @toomasv 14:39
@ericguedespinto In W10, after clicking on button, area will move higher, but remains behind the button as expected. If this is not the case on MacOS, this may be an issue.

Eric Guedes Pinto @ericguedespinto 14:42

system/build
== make object! [
date: 23-Sep-2018/13:24:35+01:00
git: make object! [




Comments:
--------------------------------------------------------------------------------

On 2018-09-27T23:49:16Z, qtxie, commented:
<https://github.com/red/red/issues/3543#issuecomment-425277286>

    Seems it's no problem on macOS 10.14.
    ![ps1j4otyv2](https://user-images.githubusercontent.com/1673525/46180431-f4d0d100-c2f2-11e8-9920-ecbcff1876f1.gif)

--------------------------------------------------------------------------------

On 2018-10-06T00:17:24Z, ericguedespinto, commented:
<https://github.com/red/red/issues/3543#issuecomment-427530402>

    @qtxie Thank you. I can confirm that it is working now as well for me, although it was not when I posted the issue. Maybe it has something to do with the beta of macOS I was using then.
    I believe this issue can be closed

