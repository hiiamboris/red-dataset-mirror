
#3167: submenus not appearing on MacOS
================================================================================
Issue is open, was reported by 9214 and has 14 comment(s).
[status.reviewed] [GUI]
<https://github.com/red/red/issues/3167>

### Expected behavior
Menu bar is fully functional
### Actual behavior
Submenus are not showing up
### Steps to reproduce the problem
One of the GUI examples from [Red programming website](http://redprogramming.com/Short%20Red%20Code%20Examples.html)
```Red
Red [title: "Menus" needs: 'view]

g: layout [area 400x400]
g/menu: [
    "No Submenus" [
        "Print" prnt
        ---
        "Quit" kwit
    ]
    "Sub-menus" [
        "Sub-menus" [
            "Submenu1" s1
            "Submenu2" s2
            "Submenu3" [
                "Submenu4" s4
            ]
        ]
    ]
]

g/actors: make object! [
    on-menu: func [face [object!] event [event!]][
        if event/picked = 'kwit [unview/all]
        if event/picked = 'prnt [print "print menu selected"]
        if event/picked = 's4 [print "submenu4 selected"]
    ]
]

view g
```
### Red version and build date, operating system with version.
I don't have Mac, but snippet above works on Win7 and Wine with latest versions as of this writing.



Comments:
--------------------------------------------------------------------------------

On 2017-12-26T15:25:23Z, adamdecaf, commented:
<https://github.com/red/red/issues/3167#issuecomment-353979981>

    I ran into this also during the weekend. OSX 10.11.6 

--------------------------------------------------------------------------------

On 2017-12-26T17:31:09Z, onetom, commented:
<https://github.com/red/red/issues/3167#issuecomment-353992708>

    I just tried it on macOS High Sierra `10.13.2 (17C88)` with Red `23dec17-8af8bb8` and the submenus DO appear and they DO report in the console when they are clicked, however I got some extra error messages as demonstrated below:
    
    ```
    $ ~/Downloads/red-23dec17-8af8bb8
    --== Red 0.6.3 ==--
    Type HELP for starting information.
    
    >> do %submenus.red
    submenu4 selected
    /BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Common/ChunkCompression.cpp:50: Error: unsupported compressor 8
    /BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/Frameworks/AppKit.framework/Resources/Base.lproj/NSTextTouchBarItems.nib'
    >> do %submenus.red
    submenu4 selected
    >>
    ```

--------------------------------------------------------------------------------

On 2017-12-26T18:44:48Z, 9214, commented:
<https://github.com/red/red/issues/3167#issuecomment-354000005>

    thanks @onetom 

--------------------------------------------------------------------------------

On 2017-12-26T18:57:47Z, adamdecaf, commented:
<https://github.com/red/red/issues/3167#issuecomment-354001122>

    I tried again but didn't see any console output (via binary from `red -c` and repl `do %file.red`). 
    
    The submenues appear at the top, but clicking them does nothing. Is there some sort of debug/trace flag I can give? 

--------------------------------------------------------------------------------

On 2017-12-26T20:20:50Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/3167#issuecomment-354009149>

    I tested on macOS 10.12.6 and red-23dec17-8af8bb8
    On REPL no problem, the menu and the submenus appear and the message are displayed when clicked.
    But if I compile the program, when I launch it the menu and submenus  appear but they are not clickable,  I have to give the focus to another application and then give the focus back to the application so that the menus are usable. 

--------------------------------------------------------------------------------

On 2018-03-21T01:01:11Z, qtxie, commented:
<https://github.com/red/red/issues/3167#issuecomment-374807411>

    As a workaround, you can compile the code with `-t macOS`, it will generate a `.app` file. 

--------------------------------------------------------------------------------

On 2018-09-07T12:43:58Z, ericguedespinto, commented:
<https://github.com/red/red/issues/3167#issuecomment-419427599>

    I have tried to compile with -t macOS and also in REPL but I get no menu what-so-ever using red-04sep18-6115b001. I am using macOS 10.14 beta 10

