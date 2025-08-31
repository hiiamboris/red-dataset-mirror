
#1600: load into text field crashes Red
================================================================================
Issue is closed, was reported by Josh1-rtd and has 20 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1600>

Red [title: "test" needs: 'view]
view [
    below
    a: area                               ; an area widget labeled 'a
    f: field                              ; a field widget labeled 'f
    across
    button "Show" [print a/text]
    button "Save" [write %somedatafile.txt a/text]
    button "Load" [f/text: read %somedatafile.txt]
]
Click on Load crashed Red. In windows 10 and on in Wine



Comments:
--------------------------------------------------------------------------------

On 2016-02-06T18:28:38Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1600#issuecomment-180830229>

    Commented that line and solved
    Red [    Title: "form-date"  
        Author: "Satish"  
    ;    Date: 26-Apr-2007 
    ]
    
    print "my first Red program"
    red>> do %myfile.red
    my first Red program

--------------------------------------------------------------------------------

On 2016-02-06T18:32:03Z, dockimbel, commented:
<https://github.com/red/red/issues/1600#issuecomment-180830515>

    Yes, it's the same issue as #1599.
    
    When you say "crash", do you mean an application crash or just an error reported (with the program eventually exiting)?

--------------------------------------------------------------------------------

On 2016-02-07T04:12:00Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1600#issuecomment-180943809>

    My bad. I mixed comment on #1599 here.
    
    Application company crashed when I clicked on "load"

--------------------------------------------------------------------------------

On 2016-02-07T08:18:12Z, WiseGenius, commented:
<https://github.com/red/red/issues/1600#issuecomment-180974529>

    If I paste the code in the console, and click `Load` (when `somedatafile.txt` doesn't exist) then it works as expected:
    
    ```
    *** Access error: cannot open: somedatafile.txt
    *** Where: read
    ```
    
    If I click `Save` it saves the data, but then when I click `Load`, the console crashes with:
    
    ```
    *** Runtime Error 1: access violation
    *** at: 00410F3Dh
    ```
    
    If I replace the `Load` button's block with `[f/text: "Hello, World!"]` it works as expected.
    
    Same results in Windows XP and Windows 7.

--------------------------------------------------------------------------------

On 2016-02-07T08:23:28Z, WiseGenius, commented:
<https://github.com/red/red/issues/1600#issuecomment-180974770>

    Also, if I replace the `Show` button's block with `[print read %somedatafile.txt]`, then clicking the `Show` button works as expected too, on both OSes.

--------------------------------------------------------------------------------

On 2016-02-07T12:41:51Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1600#issuecomment-181006309>

    If I replace the Load button's block with  [f/text: read/lines %somedatafile.txt], it does not crash.
     If [f/text: read/lines %somedatafile.txt print f], it works as expected. 
    However, it gives long list of messages in both Wine and Win 10 terminal as below.
     `type:` 'field
    offset: 10x170
    size: 80x24
    text: "Hello World"
    image: none
    color: none
    menu: none
    data: none
    enable?: true
    visible?: true
    selected: none
    flags: none
    options: none
    parent: make object! [
        type: 'window
        offset: 573x244
        size: 220x234
        text: "Red: untitled"
        image: none
        color: none
        menu: none
        data: none
        enable?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: [make object! [
            type: 'area
            offset: 10x10
            size: 150x150
            text: none
            image: none
            color: none
            menu: none
            data: none
            enable?: true
            visible?: true
            selected: none
            flags: none
            options: none
            parent: make object! [...]
            pane: none
            state: [1179698 0 none false]
            edge: none
            para: none
            font: none
            actors: none
            extra: none
            draw: none
                        ] make object! [...] make object! [
            type: 'button
            offset: 10x194
            size: 60x30
            text: "Show"
            image: none
            color: none
            menu: none
            data: none
            enable?: true
            visible?: true
            selected: none
            flags: none
            options: none
            parent: make object! [...]
            pane: none
            state: [852578 0 none false]
            edge: none
            para: none
            font: none
            actors: make object! [
                on-click: func [face [object!] event [event! none!]][print a/text]
            ]
            extra: none
            draw: none
                        ] make object! [
            type: 'button
            offset: 80x194
            size: 60x30
            text: "Save"
            image: none
            color: none
            menu: none
            data: none
            enable?: true
            visible?: true
            selected: none
            flags: none
            options: none
            parent: make object! [...]
            pane: none
            state: [1245272 0 none false]
            edge: none
            para: none
            font: none
            actors: make object! [
                on-click: func [face [object!] event [event! none!]][write %somedatafile.txt a/text]
            ]
            extra: none
            draw: none
                        ] make object! [
            type: 'button
            offset: 150x194
            size: 60x30
            text: "Load"
            image: none
            color: none
            menu: none
            data: none
            enable?: true
            visible?: true
            selected: none
            flags: none
            options: none
            parent: make object! [...]
            pane: none
            state: [590470 0 none false]
            edge: none
            para: none
            font: none
            actors: make object! [
                on-click: func [face [object!] event [event! none!]][f/text: "Hello World" print f]
            ]
            extra: none
            draw: none
                        ]]
        state: [1245762 0 none true]
        edge: none
        para: none
        font: none
        actors: none
        extra: none
        draw: none
            ]
    pane: none
    state: [459400 0 none false]
    edge: none
    para: none
    font: none
    actors: none
    extra: none
    draw: non

--------------------------------------------------------------------------------

On 2016-02-07T12:52:18Z, WiseGenius, commented:
<https://github.com/red/red/issues/1600#issuecomment-181010015>

    @RedJosh That looks correct. Try replacing `print f` with `print f/text` if you didn't want all those objects printed.

--------------------------------------------------------------------------------

On 2016-02-07T13:17:43Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1600#issuecomment-181014486>

    @WiseGenius Yes. 
    [f/text: read/lines %somedatafile.txt print f/text] works. But "print f" should give syntax error instead of printing all objects or should print only "f" object (my opinion)
    somedatafile.txt  contains only this -> aaaa
    It prints correctly into console but does not show it in F field. 
    
    If I replace the load button's block with ][f/text: "Hello World" print f/text]
    It shows "Hello World" in f field also.

--------------------------------------------------------------------------------

On 2016-02-07T13:47:46Z, WiseGenius, commented:
<https://github.com/red/red/issues/1600#issuecomment-181019761>

    @RedJosh `read/lines` returns a `block!` of `string!`s rather than a `string!` so that would explain why `[f/text: read/lines %somedatafile.txt print f/text]` fails to change the visual content of `f` and yet `print f/text` seems to print the contents of `%somedatafile.txt` regardless of what is being shown in `f`, until `f`'s content is changed again.
    
    So the real question is still, “Why does `[f/text: read %somedatafile.txt]` crash?”.

--------------------------------------------------------------------------------

On 2016-02-07T13:57:18Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1600#issuecomment-181020254>

     I pulled this code as is from @Nick's [http://redprogramming.com/Getting%20Started.html](url)
    So was it working earlier?

