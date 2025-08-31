![Red](https://static.red-lang.org/red-logo.svg)

# [Red Programming Language](https://www.red-lang.org/)

## Pages

- [Home](http://www.red-lang.org/)
- [About](http://www.red-lang.org/p/about.html)
- [Getting Started](http://www.red-lang.org/p/getting-started.html)
- [Download](http://www.red-lang.org/p/download.html)
- [Documentation](http://www.red-lang.org/p/documentation.html)
- [Contributions](http://www.red-lang.org/p/contributions.html)
- [Roadmap](http://www.red-lang.org/p/roadmap_2.html)
- [Privacy Policy](https://www.red-lang.org/p/privacy-policy.html)

## June 11, 2024

[]()

### Text-UI View backend

Last year, [qtxie](https://github.com/qtxie) worked on a toy text backend project and submitted a PR for that. After some extra additions and testing recently, it has now been merged even if it is still incomplete, it is usable enough. So, in addition to the shiny GUI backends in Red/View, now we have an old-school [text-based user interfaces (TUI)](https://en.wikipedia.org/wiki/Text-based_user_interface) backend for the View engine!

The new TUI backend has currently a subset of the GUI backends features. Here is an overview:

- [View](https://github.com/red/docs/blob/master/en/view.adoc) [styles](https://github.com/red/docs/blob/master/en/vid.adoc): base, panel, button, check, radio, field, text, progress, rich-text, image and text-list.
- [Draw](https://github.com/red/docs/blob/master/en/draw.adoc) commands: text, line, box, triangle, circle, ellipse (block-based for now).
- [Rich-text](https://github.com/red/docs/blob/master/en/rtd.adoc) supported in Draw.
- Keyboard handling: key-down and key events (which are the same event).
- Mouse handling: disabled by default. Use system/view/platform/mouse-event?: yes to enable it.
- Images support [Truecolor](https://en.wikipedia.org/wiki/Color_depth#True_color_.2824-bit.29) (24-bit RGB) for image rendering if the terminal supports it, otherwise it falls back to 256 colors.
- Timers supported through /rate facet.
- [Facets](https://github.com/red/docs/blob/master/en/view.adoc#face-object) supported: /offset, /size, /text, /image, /color, /data, /enabled?, /visible?, /selected, /flags, /options, /pane, /rate, /para and /draw.
- Flags supported: password and all-over.
- Frames drawing using squared or rounded corners (
- Limited ANSI escape codes support in /text facet, only [Colors / Graphics Mode](https://gist.github.com/qtxie/a5f31ccba82320ac964c311d768149d4#colors--graphics-mode) codes.
- Uses 256 colors for text. It should works fine on most of the terminals.
- Works on the big-3 platforms (Linux, macOS and Windows10/11).

The pre-built CLI console binaries on our [Download page](https://www.red-lang.org/p/download.html) now have View/VID included by default along with the TUI backend. You can use them to test and play with the TUI code examples here and in the [TUI folder](https://github.com/red/red/tree/master/tests/TUI).

To use the TUI backend in your own compiled code, you need to add the two following options in the Red header block:

```
    Needs:  'View
    Config: [GUI-engine: 'terminal]
```

Here are a few examples, starting with a HelloWorld!:

```
    view [text "Hello TUI World!"]

    Hello TUI World!
```

When view is invoked, an event loop is launched. In order to return back to the console prompt, press the Escape key.

Here is an animated example using a progress bar:

```
    view [
        bar: progress 30% rate 10 on-time [
            face/data: remainder (face/data + 10%) 100%
            info/text: form face/data
            info/font/color: random white
        ]
        info: text 4 font-color white "30%"
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgUgbU5jcDJE1KVpNg8tnZpohKEMnuFrFgUC-r2v0RJ8nnSlBrGtzD8jnmmfrHWGN94LmctC5XvhmnLN91lgpMK6k_2-EDLjtAtdvHfYMTnXdVFKpY0lxlR6VV5HyCq1gOf_g1G1QXindkhtcRC3X7PrTOLK-EAU0JeduDkvoMLZebcDOgklWSUFzN63KG8/s1600/tui1.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgUgbU5jcDJE1KVpNg8tnZpohKEMnuFrFgUC-r2v0RJ8nnSlBrGtzD8jnmmfrHWGN94LmctC5XvhmnLN91lgpMK6k_2-EDLjtAtdvHfYMTnXdVFKpY0lxlR6VV5HyCq1gOf_g1G1QXindkhtcRC3X7PrTOLK-EAU0JeduDkvoMLZebcDOgklWSUFzN63KG8/s270/tui1.gif)

[Spinners](https://github.com/red/red/blob/master/tests/TUI/spinners.red) are also fun to watch:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhFiNoUfLNtVp-n8L6l9pRkrK0hxRhGIA_wPnNv3-arJn2JRb6qG8FIVxXpQBVRV4wME8BNFiz6l3eIrDturOY7WYhWUpAADVdrXUtM2cUvPDaTGIlhTn3CBvrODG_D99_GaSQNXOwZ7mGi3tSiUyqWFac1ye6la24CK9xRA-mlsNJ5mRjmKpx8Kyt0iMU1/w400-h127/tui-spinners.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhFiNoUfLNtVp-n8L6l9pRkrK0hxRhGIA_wPnNv3-arJn2JRb6qG8FIVxXpQBVRV4wME8BNFiz6l3eIrDturOY7WYhWUpAADVdrXUtM2cUvPDaTGIlhTn3CBvrODG_D99_GaSQNXOwZ7mGi3tSiUyqWFac1ye6la24CK9xRA-mlsNJ5mRjmKpx8Kyt0iMU1/s701/tui-spinners.gif)

Here is a rich-text example. Press TAB key to switch focus between the buttons. Press Enter key to push the button.

```
    btn-quit: rtd-layout [i/red ["Q"] "uit"]

    view compose/deep [
        rich-text 40x3 transparent data [
            yellow "Hello"  white red " Red "  green "World!^/"
            u "Underline" /u " " s "Strike" /s i " Italic" /i
        ] return
        button "button 1"
        button 4x2 draw [text 0x0 (btn-quit)] [unview]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhN2XitG-JoUoHl2Lvx_jZ_5gDEIEPnx95erunRpu3TuPU1HNgCey6-uStgXBqiNLROj3BaYbk9SxWN-T_93wClZG7E1JnSRmM0dOgsVvvRgN8cue3q29h013kIKFTvRWU0WMFDozWtks9-Lh1qdgpTbpqetG-c4QFjleahzFw0TsFj4N9ZPt7h-HEVbE5E/s1600/tui2.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhN2XitG-JoUoHl2Lvx_jZ_5gDEIEPnx95erunRpu3TuPU1HNgCey6-uStgXBqiNLROj3BaYbk9SxWN-T_93wClZG7E1JnSRmM0dOgsVvvRgN8cue3q29h013kIKFTvRWU0WMFDozWtks9-Lh1qdgpTbpqetG-c4QFjleahzFw0TsFj4N9ZPt7h-HEVbE5E/s242/tui2.png)

An example of mouse support (not all the terminals have mouse support):

```
    system/view/platform/mouse-event?: yes

    view [panel 80x20 [base 11x1 center "drag me😀" loose]]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhDejT9x38LP4nlnK5-L59LH9xFMjWHBG3a9iszAEPDDbrfCNrZ-ePfEGljfU7sDQkq3UEBlAl5Eu_8EhGrse4AtBGF4eC5IQyFBaQHtBayXF-JeLy2Te2JFjJehtU9SbCJ3D-YAsGberXlaYK6T5oPO5YLbEchjmBu7Hh_eHDDdJYxTHF0rFJ4bkdU3aw_/s320/tui3.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhDejT9x38LP4nlnK5-L59LH9xFMjWHBG3a9iszAEPDDbrfCNrZ-ePfEGljfU7sDQkq3UEBlAl5Eu_8EhGrse4AtBGF4eC5IQyFBaQHtBayXF-JeLy2Te2JFjJehtU9SbCJ3D-YAsGberXlaYK6T5oPO5YLbEchjmBu7Hh_eHDDdJYxTHF0rFJ4bkdU3aw_/s438/tui3.gif)

Simulating old-style text interfaces:

```
    view [
        panel navy 40x15 draw [
            pen off fill-pen black box 5x4 36x10
            fill-pen pewter pen black box 4x3 35x9
            pen red text 15x3 "Hello Red"
        ][
            origin 5x5
            rich-text 30x1 pewter data [
                green "Welcome" yellow " to" red " Red "
                u "TUI" /u blue " World!"
            ]
            return
            pad 12x1 button 4 "<OK>" [print "Hi!"]
        ]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgjItH03xNe3ehw2DiUBdsfIe_Y7hRBiHIh2vP8HRA7LTSAkvLJuXPE8v8Ke5SiS658wTUlgMCI4UxXvDkMQ2iHaxA1B0rcYpOlMa4LJL_GGHQ3rMkkFbDrISJa0bs1gdVf-q5tbT8C8wYT43LOKc9FOk0u3QeDZI6vQUezcD4_RziGSeFj3AVTbgPY59hs/s320/tui4.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgjItH03xNe3ehw2DiUBdsfIe_Y7hRBiHIh2vP8HRA7LTSAkvLJuXPE8v8Ke5SiS658wTUlgMCI4UxXvDkMQ2iHaxA1B0rcYpOlMa4LJL_GGHQ3rMkkFbDrISJa0bs1gdVf-q5tbT8C8wYT43LOKc9FOk0u3QeDZI6vQUezcD4_RziGSeFj3AVTbgPY59hs/s359/tui4.png)

File and folder requesters are also available in TUI, navigation is done using TAB and arrow keys, selection using Enter key:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgi42l0nlw4VcSP9VMcKdsdtafnXpFnYSqjuj2PFqGIuNsqSwRr4B8uSmGoEeZVkflndaByNKbpaABbBEZOkCaDoAxVLXtUuoPv18y-FgEdGpAzykbwDqQwoPi5Y0hE8xCeNVd8GpIuBiVuA3THmEp7xF_PI754Nc4oG57Cm_D1Q19pCO57dbL6A8EKcxnu/w496-h640/tui-req.gif)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgi42l0nlw4VcSP9VMcKdsdtafnXpFnYSqjuj2PFqGIuNsqSwRr4B8uSmGoEeZVkflndaByNKbpaABbBEZOkCaDoAxVLXtUuoPv18y-FgEdGpAzykbwDqQwoPi5Y0hE8xCeNVd8GpIuBiVuA3THmEp7xF_PI754Nc4oG57Cm_D1Q19pCO57dbL6A8EKcxnu/s1069/tui-req.gif)

Images support:

```
    url: https://upload.wikimedia.org/wikipedia/en/e/e9/Red_Language_Tower_Logo.png
    view [image url 32x15]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiNwguyQ2_lj_vlaAwW3AoEuBmSEdP-wIYtRmwo4stSUyYV6VTFa0rQ7U7fFPMrC-JgUXQxkAMbxvkMO_n5AoYO3GZt70JWCUe1BeQBQuIKX6ji6acY2wFGKt56Lrke0dOl9mSp1RIB9Uc_pKkhyr0p7AglCP3x1QU2_nP2-QyIjjaIqkVD_vxud30AJVsX/w200-h196/logo.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiNwguyQ2_lj_vlaAwW3AoEuBmSEdP-wIYtRmwo4stSUyYV6VTFa0rQ7U7fFPMrC-JgUXQxkAMbxvkMO_n5AoYO3GZt70JWCUe1BeQBQuIKX6ji6acY2wFGKt56Lrke0dOl9mSp1RIB9Uc_pKkhyr0p7AglCP3x1QU2_nP2-QyIjjaIqkVD_vxud30AJVsX/s421/logo.png)

Here is the same image displayed in TUI next to the GUI version:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgRimdUEn7uvGEBs6MQNLc_vQx57cj1ch7XTDW3zx26SPI_S8hDdgBMJN_Z4NEQV9w485LKi1zMX92Aereqi_sXcuz696UJ7mAdLoyr8AiFHAZ4YaiPW9U6JW2pyeUZ_La9w1YWH6OUOwz0KzWLu151DDoPcS8doKDHw7eoJvWT5RZk7Pxzr9j3Nu17g7T5/w640-h339/dogs.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgRimdUEn7uvGEBs6MQNLc_vQx57cj1ch7XTDW3zx26SPI_S8hDdgBMJN_Z4NEQV9w485LKi1zMX92Aereqi_sXcuz696UJ7mAdLoyr8AiFHAZ4YaiPW9U6JW2pyeUZ_La9w1YWH6OUOwz0KzWLu151DDoPcS8doKDHw7eoJvWT5RZk7Pxzr9j3Nu17g7T5/s1729/dogs.png)

Some examples of 2D vector graphics using the Draw dialect (currently using only *block* graphics, *braille*-based graphics in the future):

```
    view [
        base 80x40 transparent draw [
            pen orange
            triangle 3x2 18x5 5x15
            fill-pen blue
            circle 30x8 5
            pen off
            fill-pen green
            ellipse 50x2 15x15
            pen brick fill-pen brick
            box 3x20 15x30
            pen gold
            line 20x30 28x20 40x28 44x24
        ]
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjiM0aCiz6p6S3vwy-HnrP1rJufE2HtMDPKkX1TLMY3dxmwtyoOgY0SOYdiSYXdbXBL4-a_CRtKSexwPI_hK15DbtTzRxCuouLCyK6PGx1MveWxlpk0zefF5R442CPZ2Ip8E_xWSMhBdhERvW1KVqNLyFax4vi2sSL66BZc5Rh_vhu18szV1L_mB9U2Wr4X/w379-h400/draw.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjiM0aCiz6p6S3vwy-HnrP1rJufE2HtMDPKkX1TLMY3dxmwtyoOgY0SOYdiSYXdbXBL4-a_CRtKSexwPI_hK15DbtTzRxCuouLCyK6PGx1MveWxlpk0zefF5R442CPZ2Ip8E_xWSMhBdhERvW1KVqNLyFax4vi2sSL66BZc5Rh_vhu18szV1L_mB9U2Wr4X/s904/draw.png)

A special mention to group-box widget. It has a couple of new options for the frame style:

```
    border-corners: round | #(none)
    border-color: #(tuple!)
```

Here is a usage example:

```
    view [
        group-box font-color green " Folders " 26x8 options [
            border-corners: round
            border-color: 255.0.0
        ]
        group-box " Files " 26x8
    ]
```

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhYC8K6AOj1SHSamgWcz3f3Oqlw87dRJgv40Nar6PTnAsFtF5AV_bpyvuAOwIl4j1fjp9kqPw972TA4OeiHtdn2Kwh0I-UQ8-GU9pGtnYcIYY1PkWJb_epl7g1-r7pPccZF7LLgcEfGfgZcN2X0-HJupbvoEfCi9663QF3XlWmVn81bDgyNgSEhWFf87OuS/w640-h218/tui-borders.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhYC8K6AOj1SHSamgWcz3f3Oqlw87dRJgv40Nar6PTnAsFtF5AV_bpyvuAOwIl4j1fjp9kqPw972TA4OeiHtdn2Kwh0I-UQ8-GU9pGtnYcIYY1PkWJb_epl7g1-r7pPccZF7LLgcEfGfgZcN2X0-HJupbvoEfCi9663QF3XlWmVn81bDgyNgSEhWFf87OuS/s726/tui-borders.png)

This TUI implementation is still not on par with our GUI backends. If some of you are motivated to extend and improve it, contributions are welcome! For example, we did not yet implement menus support. If someone is up to the task, please follow the GUI View menu dialect.

What's next?

We are finishing the work on some significant improvements to the Red and R/S memory management sub-systems and garbage collector that will bring them to the level required for a Red v1.0. Those changes will be released in a bumped 0.6.6 version. Those memory improvements are also needed for completing the work on the async IO branch.

Another version bump will follow with the deprecation of the high-level Red compiler and the addition of a new powerful layer to our Red tower of languages. All those changes are pre-requirements to start our work on 64-bit support.

In the meantime, enjoy this new toy!

Posted by [Nenad Rakocevic](https://www.blogger.com/profile/06600325626233743055 "author profile") at [4:02 PM](https://www.red-lang.org/2024/06/text-ui-view-backend.html "permanent link") [![](https://resources.blogblog.com/img/icon18_edit_allbkg.gif)](https://www.blogger.com/post-edit.g?blogID=5936111837781935054&postID=2496820446235831275&from=pencil "Edit Post")

[]()

#### 8 comments:

1. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[June 11, 2024 at 5:03 PM](https://www.red-lang.org/2024/06/text-ui-view-backend.html?showComment=1718118205216#c4063051850775095016)
   
   Funny :)
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/4063051850775095016)
   
   [Replies]()
   
   1. [Reply]()
2. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[June 11, 2024 at 6:33 PM](https://www.red-lang.org/2024/06/text-ui-view-backend.html?showComment=1718123622649#c1034467012232062236)
   
   This is exactly what sets the Rebol and Red languages apart - make complicated things easier. Great work, guys!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1034467012232062236)
   
   [Replies]()
   
   1. [Reply]()
3. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[June 11, 2024 at 11:08 PM](https://www.red-lang.org/2024/06/text-ui-view-backend.html?showComment=1718140092319#c3504288619948422577)
   
   Python has Textualize, and Red pulled along - awesome!
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/3504288619948422577)
   
   [Replies]()
   
   1. [Reply]()
4. ![](//resources.blogblog.com/img/blank.gif)
   
   Christian Ensel[June 12, 2024 at 9:12 PM](https://www.red-lang.org/2024/06/text-ui-view-backend.html?showComment=1718219570906#c1170242353209869450)
   
   Congrats guys, I'm in awe over the ingenuity of using the VID dialect for describing a TUI.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/1170242353209869450)
   
   [Replies]()
   
   1. [Reply]()
5. ![](//resources.blogblog.com/img/blank.gif)
   
   Anonymous[June 19, 2024 at 2:41 AM](https://www.red-lang.org/2024/06/text-ui-view-backend.html?showComment=1718757700637#c7010318152848853732)
   
   Great! Don't stop! Thanks for such a charm. Even though the mouse doesn't respond in Windows 10 (red-16jun24-08d41eeae), it's a great idea. Also a built-in editor, like in rebol, but with syntax highlighting :)
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7010318152848853732)
   
   [Replies]()
   
   1. [Reply]()
6. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Sergey Shishkin](https://www.blogger.com/profile/12359328794026744049)[November 4, 2024 at 9:33 AM](https://www.red-lang.org/2024/06/text-ui-view-backend.html?showComment=1730709221151#c8319484861221750768)
   
   I decided to try and download it on Win11 and this is what I get... red-view.exe virus detected
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/8319484861221750768)
   
   [Replies]()
   
   1. [Reply]()
7. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Sergey Shishkin](https://www.blogger.com/profile/12359328794026744049)[November 4, 2024 at 9:34 AM](https://www.red-lang.org/2024/06/text-ui-view-backend.html?showComment=1730709287428#c527986550048896687)
   
   I decided to try and download it on Win11 and this is what I get... red-view.exe virus detected
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/527986550048896687)
   
   [Replies]()
   
   1. [Reply]()
8. ![](//www.blogger.com/img/blogger_logo_round_35.png)
   
   [Josh1](https://www.blogger.com/profile/04686704397228432928)[February 20, 2025 at 9:34 AM](https://www.red-lang.org/2024/06/text-ui-view-backend.html?showComment=1740040496632#c7093546866560265031)
   
   There is not much news eight months after this blog. Is the languge development stalled?  
   This language was conceptualized in 2011 as can be seen here. After 14 years, it is still not able to complete 0.7 version. I am not a professional software developer. I liked Rebol for its fast learning curve for developing applications and developed an application within six months of starting to learn Rebol. However, I find Red a bit complicated to learn and translate the same application into Red. I started three years ago, got stuck at 'request-date' and left it there.  
   There after, I am just watching the progress of Red language. I honestly feel that it is too slow.  
   Last year, I wanted to develop an application useful for stock trading. That required Microsoft COM, Websocket support and concurrency. Many of the fellow traders are learning Python to that. Though Python has all of that, it is too slow. I had to switch to C# and Visual Studio for that. I could develop the application with the help of Visual Studio and AI.  
   I still feel that Red is good and should reach its objective. Red View download is just 1.6mb. However, the world has gone ahead. I think 10mb download also will be much smaller than other languages space requirement. My point here is that the language should be developed faster and made useful for development of real world applications. There is no need of compressing the whole environment in 2 mb. Also, the guide should be made comprehensive. Otherwise, some other language may take over and like Rebol, Red will remain development language of very few people.  
   Anyway, my best wishes to Red Team.
   
   [Reply]()[Delete](https://www.blogger.com/comment/delete/5936111837781935054/7093546866560265031)
   
   [Replies]()
   
   1. [Reply]()

[Add comment]()

[Load more...]()

[]()

[](https://www.blogger.com/comment/frame/5936111837781935054?po=2496820446235831275&hl=en&saa=85391&origin=https%3A%2F%2Fwww.red-lang.org)

[Newer Post](https://www.red-lang.org/2025/03/066-memory-management-improvements.html "Newer Post") [Older Post](https://www.red-lang.org/2024/05/red-in-real-world.html "Older Post") [Home](https://www.red-lang.org/)

Subscribe to: [Post Comments (Atom)](https://www.red-lang.org/feeds/2496820446235831275/comments/default)

[Star](https://github.com/red/red)   [Follow @red\_lang](https://twitter.com/red_lang)

    

Follow [@red\_lang](https://twitter.com/red_lang) on Twitter or on [/r/redlang](https://www.reddit.com/r/redlang/) subreddit.

Chat with us in our [Gitter](https://gitter.im/red/red) room.

## Search This Blog

## Total Pageviews

[Loading...](http://github.com/red/red/commits/master.atom)

## Blog Archive

- [►](javascript:void%280%29)  [2025](https://www.red-lang.org/2025/) (2)
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2025/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2025/03/) (1)

<!--THE END-->

- [▼](javascript:void%280%29)  [2024](https://www.red-lang.org/2024/) (4)
  
  - [▼](javascript:void%280%29)  [June](https://www.red-lang.org/2024/06/) (1)
    
    - [Text-UI View backend](https://www.red-lang.org/2024/06/text-ui-view-backend.html)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2024/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2024/02/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2023](https://www.red-lang.org/2023/) (3)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2023/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2023/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2023/06/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2022](https://www.red-lang.org/2022/) (2)
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2022/07/) (2)

<!--THE END-->

- [►](javascript:void%280%29)  [2021](https://www.red-lang.org/2021/) (2)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2021/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2021/08/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2020](https://www.red-lang.org/2020/) (4)
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2020/08/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2020/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2020/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2019](https://www.red-lang.org/2019/) (10)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2019/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2019/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2019/10/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2019/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2019/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2019/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2019/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2019/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2018](https://www.red-lang.org/2018/) (20)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2018/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2018/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2018/10/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2018/09/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2018/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2018/05/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2018/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2018/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2018/01/) (5)

<!--THE END-->

- [►](javascript:void%280%29)  [2017](https://www.red-lang.org/2017/) (3)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2017/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2017/07/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2017/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2016](https://www.red-lang.org/2016/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2016/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2016/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2016/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2016/03/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2015](https://www.red-lang.org/2015/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2015/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [June](https://www.red-lang.org/2015/06/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2015/04/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2015/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2015/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2014](https://www.red-lang.org/2014/) (6)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2014/12/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2014/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2014/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2014/02/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2014/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2013](https://www.red-lang.org/2013/) (5)
  
  - [►](javascript:void%280%29)  [November](https://www.red-lang.org/2013/11/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2013/09/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2013/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2013/03/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [January](https://www.red-lang.org/2013/01/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2012](https://www.red-lang.org/2012/) (8)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2012/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [October](https://www.red-lang.org/2012/10/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2012/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2012/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2012/03/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2012/02/) (1)

<!--THE END-->

- [►](javascript:void%280%29)  [2011](https://www.red-lang.org/2011/) (15)
  
  - [►](javascript:void%280%29)  [December](https://www.red-lang.org/2011/12/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [September](https://www.red-lang.org/2011/09/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [August](https://www.red-lang.org/2011/08/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [July](https://www.red-lang.org/2011/07/) (2)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [May](https://www.red-lang.org/2011/05/) (3)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [April](https://www.red-lang.org/2011/04/) (1)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [March](https://www.red-lang.org/2011/03/) (4)
  
  <!--THE END-->
  
  - [►](javascript:void%280%29)  [February](https://www.red-lang.org/2011/02/) (1)

## Tags cloud

[2D](https://www.red-lang.org/search/label/2D) (1) [alias](https://www.red-lang.org/search/label/alias) (1) [alpha](https://www.red-lang.org/search/label/alpha) (1) [Android](https://www.red-lang.org/search/label/Android) (3) [announce](https://www.red-lang.org/search/label/announce) (7) [apply](https://www.red-lang.org/search/label/apply) (1) [ARM](https://www.red-lang.org/search/label/ARM) (4) [armhf](https://www.red-lang.org/search/label/armhf) (1) [arrays](https://www.red-lang.org/search/label/arrays) (2) [AST](https://www.red-lang.org/search/label/AST) (1) [beta](https://www.red-lang.org/search/label/beta) (1) [binaries](https://www.red-lang.org/search/label/binaries) (1) [binary form](https://www.red-lang.org/search/label/binary%20form) (1) [bitset](https://www.red-lang.org/search/label/bitset) (1) [blog](https://www.red-lang.org/search/label/blog) (1) [booleans](https://www.red-lang.org/search/label/booleans) (1) [bridge](https://www.red-lang.org/search/label/bridge) (2) [bugfixes](https://www.red-lang.org/search/label/bugfixes) (4) [callback](https://www.red-lang.org/search/label/callback) (2) [casing](https://www.red-lang.org/search/label/casing) (1) [changelog](https://www.red-lang.org/search/label/changelog) (1) [China](https://www.red-lang.org/search/label/China) (2) [codecs](https://www.red-lang.org/search/label/codecs) (1) [collation](https://www.red-lang.org/search/label/collation) (1) [community](https://www.red-lang.org/search/label/community) (1) [compilation](https://www.red-lang.org/search/label/compilation) (6) [compiler](https://www.red-lang.org/search/label/compiler) (2) [conference](https://www.red-lang.org/search/label/conference) (2) [console](https://www.red-lang.org/search/label/console) (8) [context](https://www.red-lang.org/search/label/context) (2) [contribution](https://www.red-lang.org/search/label/contribution) (1) [CSDN](https://www.red-lang.org/search/label/CSDN) (1) [date](https://www.red-lang.org/search/label/date) (1) [Debian](https://www.red-lang.org/search/label/Debian) (1) [demos](https://www.red-lang.org/search/label/demos) (3) [development](https://www.red-lang.org/search/label/development) (1) [dialect](https://www.red-lang.org/search/label/dialect) (1) [dll](https://www.red-lang.org/search/label/dll) (1) [donations](https://www.red-lang.org/search/label/donations) (1) [download](https://www.red-lang.org/search/label/download) (1) [Draw](https://www.red-lang.org/search/label/Draw) (1) [DSL](https://www.red-lang.org/search/label/DSL) (1) [dynamic calls](https://www.red-lang.org/search/label/dynamic%20calls) (1) [ELF](https://www.red-lang.org/search/label/ELF) (1) [encap](https://www.red-lang.org/search/label/encap) (1) [enum](https://www.red-lang.org/search/label/enum) (1) [exceptions](https://www.red-lang.org/search/label/exceptions) (3) [explorable explanations.](https://www.red-lang.org/search/label/explorable%20explanations.) (1) [features](https://www.red-lang.org/search/label/features) (2) [floating point](https://www.red-lang.org/search/label/floating%20point) (3) [floats](https://www.red-lang.org/search/label/floats) (2) [FPU](https://www.red-lang.org/search/label/FPU) (4) [freebsd](https://www.red-lang.org/search/label/freebsd) (1) [functions](https://www.red-lang.org/search/label/functions) (1) [GC](https://www.red-lang.org/search/label/GC) (1) [gpio](https://www.red-lang.org/search/label/gpio) (1) [GTK+](https://www.red-lang.org/search/label/GTK%2B) (1) [GUI](https://www.red-lang.org/search/label/GUI) (9) [hash](https://www.red-lang.org/search/label/hash) (1) [HOF](https://www.red-lang.org/search/label/HOF) (1) [I/O](https://www.red-lang.org/search/label/I%2FO) (1) [IA-32](https://www.red-lang.org/search/label/IA-32) (2) [IEEE-754](https://www.red-lang.org/search/label/IEEE-754) (1) [implementation](https://www.red-lang.org/search/label/implementation) (2) [interpreter](https://www.red-lang.org/search/label/interpreter) (1) [iOS](https://www.red-lang.org/search/label/iOS) (1) [IW](https://www.red-lang.org/search/label/IW) (1) [java](https://www.red-lang.org/search/label/java) (2) [jni](https://www.red-lang.org/search/label/jni) (1) [lexer](https://www.red-lang.org/search/label/lexer) (2) [libc](https://www.red-lang.org/search/label/libc) (1) [libRed](https://www.red-lang.org/search/label/libRed) (2) [libRedRT](https://www.red-lang.org/search/label/libRedRT) (1) [linker](https://www.red-lang.org/search/label/linker) (1) [linux](https://www.red-lang.org/search/label/linux) (2) [literal arrays](https://www.red-lang.org/search/label/literal%20arrays) (2) [livecoding](https://www.red-lang.org/search/label/livecoding) (1) [load](https://www.red-lang.org/search/label/load) (2) [loader](https://www.red-lang.org/search/label/loader) (1) [macOS](https://www.red-lang.org/search/label/macOS) (1) [MacOSX](https://www.red-lang.org/search/label/MacOSX) (2) [macros](https://www.red-lang.org/search/label/macros) (2) [major](https://www.red-lang.org/search/label/major) (1) [map](https://www.red-lang.org/search/label/map) (2) [math](https://www.red-lang.org/search/label/math) (2) [meeting](https://www.red-lang.org/search/label/meeting) (1) [memory](https://www.red-lang.org/search/label/memory) (1) [migration](https://www.red-lang.org/search/label/migration) (1) [monitors](https://www.red-lang.org/search/label/monitors) (1) [namespaces](https://www.red-lang.org/search/label/namespaces) (1) [native](https://www.red-lang.org/search/label/native) (1) [navigation](https://www.red-lang.org/search/label/navigation) (1) [objective-c](https://www.red-lang.org/search/label/objective-c) (1) [objects](https://www.red-lang.org/search/label/objects) (3) [ownership](https://www.red-lang.org/search/label/ownership) (1) [pair](https://www.red-lang.org/search/label/pair) (1) [pairs](https://www.red-lang.org/search/label/pairs) (1) [parse](https://www.red-lang.org/search/label/parse) (5) [path notation](https://www.red-lang.org/search/label/path%20notation) (1) [paths](https://www.red-lang.org/search/label/paths) (1) [percent](https://www.red-lang.org/search/label/percent) (1) [pointers](https://www.red-lang.org/search/label/pointers) (2) [points](https://www.red-lang.org/search/label/points) (1) [port](https://www.red-lang.org/search/label/port) (2) [preprocessor](https://www.red-lang.org/search/label/preprocessor) (2) [presentation](https://www.red-lang.org/search/label/presentation) (2) [QEMU](https://www.red-lang.org/search/label/QEMU) (1) [questions](https://www.red-lang.org/search/label/questions) (1) [RaspberryPi](https://www.red-lang.org/search/label/RaspberryPi) (3) [react](https://www.red-lang.org/search/label/react) (1) [reactive](https://www.red-lang.org/search/label/reactive) (5) [Red](https://www.red-lang.org/search/label/Red) (2) [red/system](https://www.red-lang.org/search/label/red%2Fsystem) (4) [redbin](https://www.red-lang.org/search/label/redbin) (1) [release](https://www.red-lang.org/search/label/release) (13) [REPL](https://www.red-lang.org/search/label/REPL) (2) [routine](https://www.red-lang.org/search/label/routine) (1) [rules engine](https://www.red-lang.org/search/label/rules%20engine) (1) [runtime errors](https://www.red-lang.org/search/label/runtime%20errors) (3) [screen](https://www.red-lang.org/search/label/screen) (1) [sets](https://www.red-lang.org/search/label/sets) (1) [SFD](https://www.red-lang.org/search/label/SFD) (1) [shared libraries](https://www.red-lang.org/search/label/shared%20libraries) (2) [sorting](https://www.red-lang.org/search/label/sorting) (1) [sources](https://www.red-lang.org/search/label/sources) (1) [specs](https://www.red-lang.org/search/label/specs) (2) [stack](https://www.red-lang.org/search/label/stack) (1) [startups](https://www.red-lang.org/search/label/startups) (1) [stats](https://www.red-lang.org/search/label/stats) (1) [strings](https://www.red-lang.org/search/label/strings) (1) [subpixel](https://www.red-lang.org/search/label/subpixel) (1) [sum up](https://www.red-lang.org/search/label/sum%20up) (1) [SVG](https://www.red-lang.org/search/label/SVG) (1) [syntax](https://www.red-lang.org/search/label/syntax) (1) [tabbing](https://www.red-lang.org/search/label/tabbing) (1) [tests](https://www.red-lang.org/search/label/tests) (4) [time](https://www.red-lang.org/search/label/time) (1) [toolchain](https://www.red-lang.org/search/label/toolchain) (1) [tuple](https://www.red-lang.org/search/label/tuple) (1) [tutorial](https://www.red-lang.org/search/label/tutorial) (1) [type-checking](https://www.red-lang.org/search/label/type-checking) (1) [typeset](https://www.red-lang.org/search/label/typeset) (1) [Unicode](https://www.red-lang.org/search/label/Unicode) (4) [update](https://www.red-lang.org/search/label/update) (1) [user group](https://www.red-lang.org/search/label/user%20group) (1) [vector](https://www.red-lang.org/search/label/vector) (2) [VFP](https://www.red-lang.org/search/label/VFP) (2) [VID](https://www.red-lang.org/search/label/VID) (2) [View](https://www.red-lang.org/search/label/View) (3) [widgets](https://www.red-lang.org/search/label/widgets) (1) [x87](https://www.red-lang.org/search/label/x87) (1)

Copyright 2011-2020 Nenad Rakocevic &amp; Red Foundation. Powered by [Blogger](https://www.blogger.com).

[![Fork me on GitHub](https://camo.githubusercontent.com/82b228a3648bf44fc1163ef44c62fcc60081495e/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f7265645f6161303030302e706e67)](https://github.com/red/red)
