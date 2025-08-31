
#3264: Radio widget turned off does not generate any event
================================================================================
Issue is closed, was reported by DVL333 and has 6 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/3264>

### Expected behavior
There are two radio button - one checked and another unchecked. For the first button `on-change` event is determined. If click on the second button, the status of the first button will change (become unchecked) and `on-change` event will occur.
### Actual behavior
`On-change` event doesn't occur. But if click on the first button, the event will occur, so it's not `on-change` event - it is `on-click` event!
### Steps to reproduce the problem
Example:
```
show-label: func [f e] [txt/text: "Hello world!"]
act: make object! [on-change: :show-label]
rb1: make face! [type: 'radio size: 60x20 offset: 10x10 text: "Radio1"
    data: true actors: act]
rb2: make face! [type: 'radio size: 60x20 offset: 10x30 text: "Radio2"]
txt: make face! [type: 'text size: 60x20 offset: 10x60]
repend p: [] [rb1 rb2 txt]
view make face! [type: 'window size: 100x80 pane: p]
```
1) Click on "Radio2" - text label doesn't appear. It's wrong!
2) Click on "Radio1" - text label appears.
### Red version and build date, operating system with version.
Windows7 Ultimate 64bit, Red - version 0.6.3 built 3-Mar-2018/2:02:48+03:00


Comments:
--------------------------------------------------------------------------------

On 2018-03-18T05:32:19Z, dockimbel, commented:
<https://github.com/red/red/issues/3264#issuecomment-373974221>

    Good catch! That feature was not implemented yet, it's time to add it now.

--------------------------------------------------------------------------------

On 2018-03-24T09:35:45Z, 9214, commented:
<https://github.com/red/red/issues/3264#issuecomment-375860627>

    Possible regression? https://github.com/red/red/issues/3279

--------------------------------------------------------------------------------

On 2018-03-24T09:38:26Z, toomasv, commented:
<https://github.com/red/red/issues/3264#issuecomment-375860924>

    May be connected: Now clicking alternately on `radio`-buttons generates strange events (build March 23):
    ```
    >> view [style r: radio [probe reduce [face/text face/data]] r "r1" r "r2"]
    ["r1" true]
    ["r1" true]
    ["r1" true]
    ["r1" false]
    ["r2" true]
    ["r2" true]
    ["r2" true]
    ```
    Earlier (March 17):
    ```
    >> view [style r: radio [probe reduce [face/text face/data]] r "r1" r "r2"]
    ["r1" true]
    ["r2" true]
    ["r1" true]
    ["r2" true]
    ["r1" true]
    ```

