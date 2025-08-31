# Colored text console output in Rebol

**Link:**
<https://stackoverflow.com/questions/46454731/colored-text-console-output-in-rebol>

**Asked:** 2017-09-27 18:21:47 UTC

------------------------------------------------------------------------

In some languages I can put [Esc
codes](https://misc.flogisoft.com/bash/tip_colors_and_formatting){rel="nofollow noreferrer"}
around text to make them colored on Linux console/terminal. However,
this does not seem to work in Rebol:

    NORMAL: "\e[0m"
    RED: "\e[0;31m"

    print rejoin["\e[0;31m" "red text" "\e[0m"]

Above code only produces black (usual colored) text output:

    \e[0;31mred text\e[0m

Can colored text output be printed with Rebol on Linux terminal?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by rgchris

You can similarly use colour codes in Rebol/Red.

    print "This text is ^[[0;31mred^[[0m text."

`#"^["` is the Escape character in Rebol/Red.

You can, for example, change the prompts in Red with the following
codes:

    system/console/prompt: "^[[31m^[[5D>>^[(B^[[m "
    system/console/result: "^[[32m^[[5D==^[(B^[[m"

In the Ren-C branch of Rebol 3 you can change the prompts with the
following (similar) codes:

    system/console/prompt: "^[[31m^[[5D>>^[(B^[[m "
    system/console/result: "^[[32m^[[5D==^[(B^[[m "

*Comment by rnso:* Where do I put text to be colored? Say, I want to
print out \"this is red text\" with only \"red\" being colored red.

------------------------------------------------------------------------

### Answer (score: 1) --- by klausnrooster

       REBOL [
            Title:  "colorebol"
            Date:   14-Jul-2013
            File:   %colorebol.reb
            Version: 1.0.0
            Purpose: "Enable switching of terminal font colors and backgrounds etc"
            Note: "Includes the clr func for clearing the screen"
        ]

        clr: does [prin "^(page)"]

        coloreb: func [
        {Use Fore/Red /Green /Yellow /Blue /Magenta /Cyan /White /Reset and even /Black. Viola! Font-color
         Similarly Background/Blue etc...,  then Style/bright /dim /normal /reset_all and finally Cyclor, which
        randomly picks a font color. It needs some polishing}
        ][cyclor print ["this is all i do. that, and provide a help doc-string"] cyclor]

        Fore: make object! [

            Colors:   ["black" "red" "green" "yellow" "blue" "magenta" "cyan" "white" "reset"]
            BLACK:    does [prin "^[[30m"]
            RED:      does [prin "^[[31m"]
            GREEN:    does [prin "^[[32m"]
            YELLOW:   does [prin "^[[33m"]
            BLUE:     does [prin "^[[34m"]
            MAGENTA:  does [prin "^[[35m"]
            CYAN:     does [prin "^[[36m"]
            WHITE:    does [prin "^[[37m"]
            RESET:    does [prin "^[[39m"]
        ]

        Background: make object! [
            Colors:   ["black" "red" "green" "yellow" "blue" "magenta" "cyan" "white" "reset"]
            BLACK:    does [prin "^[[40m"]
            RED:      does [prin "^[[41m"]
            GREEN:    does [prin "^[[42m"]
            YELLOW:   does [prin "^[[43m"]
           BLUE:     does [prin "^[[44m"]
            MAGENTA:  does [prin "^[[45m"]
            CYAN:     does [prin "^[[46m"]
            WHITE:    does [prin "^[[47m"]
            RESET:    does [prin "^[[49m"]
        ]

        Style: make object! [
            Styles:    ["bright" "dim" "normal" "reset_all"]
            BRIGHT:    does [prin "^[[1m"]
            DIM:       does [prin "^[[2m"]
            NORMAL:    does [prin "^[[22m"]
            RESET_ALL: does [prin "^[[0m"]
        ]

        cyclor: func [] [fore/(to-word fore/colors/(random/only [2 3 4 5 6 7 8]))]

Put this in your other script files:

    do %colorebol.reb

and then use it like so:

            col: has [
            "Wrap the colorebol.reb wrappers to reduce visual clutter"
             color /red /green /blue /yellow /cyan /magenta /black /white][
            if red [color: 'red]
            if green [color: 'green]
            if blue [color: 'blue]
            if yellow [color: 'yellow]
            if cyan [color: 'cyan]
            if magenta [color: 'magenta]
            if black [color: 'black]
            if white [color: 'white]

            if unixy-os? [fore/(color)]
        ]

        ;test it:
        col/magenta print "magenta" ;(it works). Maybe just mod /%colorebol.reb?

I\'m not that fluent in Rebol - I\'m sure there is a more concise way.
But this has worked for me very well on GNU/Linux. To keep scripts
portable I have an OS-detection function and the colorizing code is
dependent on it.

*Comment by klausnrooster:* The answer to your question is the very last
line in code above.

*Comment by rnso:* Great script. You obviously liked my question.

------------------------------------------------------------------------

### Answer (score: 1) --- by Time Series Lord

Why not wrap the fore and background objects in an object and call it a
day

Then one can use it as so:

    .  style/fg/green print 'test
    test

    style: context [

        fg: foreground: context [

            DEFAULT: RESET:    does [prin "^[[39m"]

            BLACK:    does [prin "^[[30m"]
            BLUE:     does [prin "^[[34m"]
            CYAN:     does [prin "^[[36m"]
            GREEN:    does [prin "^[[32m"]
            GREY:    does [prin "^[[90m"]
            MAGENTA:  does [prin "^[[35m"]
            RED:      does [prin "^[[31m"]
            WHITE:    does [prin "^[[37m"]
            YELLOW:   does [prin "^[[33m"]

            B: BOLD: does [prin "^[[1m"]
            UL: UNDERLINE: does [prin "^[[4m"]
            I: INVERT: does [prin "^[[7m"]

            GLOW-BLUE:    does [prin "^[[94m"]
            GLOW-CYAN:    does [prin "^[[96m"]
            GLOW-GREEN:    does [prin "^[[92m"]
            GLOW-MAGENTA:    does [prin "^[[95m"]
            GLOW-RED:    does [prin "^[[91m"]
            GLOW-WHITE:    does [prin "^[[97m"]
            GLOW-YELLOW:    does [prin "^[[93m"]

        ]


        bg: background: make object! [

            DEFAULT: RESET:    does [prin "^[[49m"]

            BLACK:    does [prin "^[[40m"]
            BLUE:     does [prin "^[[44m"]
            CYAN:     does [prin "^[[46m"]
            GREEN:    does [prin "^[[42m"]
            MAGENTA:  does [prin "^[[45m"]
            RED:      does [prin "^[[41m"]
            WHITE:    does [prin "^[[47m"]
            YELLOW:   does [prin "^[[43m"]
        ]
    ]

Alternatively:

    style: context [

        esc: #"^["
        fg-colors: [ 
            reset 39 black 30 
            blue 34 bblue 94 
            cyan 36 bcyan 96
            green 32 bgreen 92
            grey 90 gray 90 
            magenta 35 bmagenta 95
            red 31 bred 91
            white 37 bwhite 97
            yellow 33 byellow 93
            bold 1 underline 4 invert 7
        ]
        bg-colors: [
            reset 49
            
            black 40
            blue 44
            cyan 46
            green 42
            magenta 45
            red 41
            white 47
            yellow 43
        ]
        c: color: function [ 
            color
            /fg /bg
        ][

            prin rejoin [ 
                self/esc {[}
                case [
                    fg [select self/fg-colors color]
                    bg [select self/bg-colors color]
                ]
                "m" 
            ] 

        ]
        
    ]    

    and used as:

    .  style/c/fg 'blue print 'test
    test

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* Assuming this is non-gui console on linux/unix
