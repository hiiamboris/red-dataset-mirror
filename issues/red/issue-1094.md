
#1094: UTF-8 output corruption of curses-example.reds with linux console
================================================================================
Issue is closed, was reported by saulery and has 4 comment(s).
<https://github.com/red/red/issues/1094>

Hello,

I have compiled curses-example.reds with red 0.5.2 under Debian 8.0 amd64. With xterm output of example 8 (Display charset) is fine. With a linux console, it's corrupted.

This is not a console font problem, vim displays this kind of character for me.

I paste here the two output files (I don't no how to attach them):

GOOD output:

│┌── Characters set ───────────────────────────────────────────────┐
││         Normal charset                    Alt charset           │
││                                                                 │
││ !"#$%&'()_+,-./0123456789:;<=>?  !"#$%&'()_→←↑↓/▮123456789:;<=>?│
││@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_ @╝╗╔╚╬╠╣╩╦┛┓┏┗╋OP━═S┣┫┻┳┃║Z[]^_│
││`abcdefghijklmnopqrstuvwxyz{|}~  ◆▒bcde°±▒␋┘┐┌└┼⎺⎻─⎼⎽├┤┴┬│≤≥π≠£· │
││                                                                 │
││                                                                 │
││                                                                 │
││                                                                 │
││                                                                 │
││                                                                 │
││                                                                 │
││     Warning  : UTF-8 charset                                    │
││                Only 7 bits chars are displayed                  │
││                                                                 │
││                                                                 │
││                                                                 │
│└─────────────────────────────────────────────────────────────────┘

CORRUPTED output:

│┌── Characters set ───────────────────────────────────────────────┐
││         Normal charset                    Alt charset           │
││                                                                 │
││ !"#$%&'()*+,-./0123456789:;<=>? →←↑↓■│
││@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_ ◈◈◈◈╬◈◈◈◈┘┐┌└┼─◈├┤┴┬│◈│
││`abcdefghijklmnopqrstuvwxyz{|}~  ◈▒°±▒◈┘┐┌└┼◈◈─◈◈├┤┴┬│≤≥π≠£· │
││                                                                 │
││                                                                 │
││                                                                 │
││                                                                 │
││                                                                 │
││                                                                 │
││     Warning  : UTF-8 charset                                    │
││                Only 7 bits chars are displayed                  │
││                                                                 │
││                                                                 │
││                                                                 │
│└─────────────────────────────────────────────────────────────────┘

Regards,



Comments:
--------------------------------------------------------------------------------

On 2015-04-21T08:27:25Z, dockimbel, commented:
<https://github.com/red/red/issues/1094#issuecomment-94700871>

    The author of that library @be-red seems to be gone now, you can try to contact him directly. There is little we can do for libraries written by third-parties. If you are interested, you might try to have a deeper look into the source code and maybe contribute a fix?

--------------------------------------------------------------------------------

On 2015-04-22T12:09:44Z, saulery, commented:
<https://github.com/red/red/issues/1094#issuecomment-95151676>

    Le mardi 21 avril 2015 à 01:27:28, Nenad Rakocevic a écrit :
    
    > The author of that library @be-red seems to be gone now, you can try to
    > contact him directly. There is little we can do for libraries written by
    > third-parties. If you are interested, you might try to have a deeper look
    > into the source code and maybe contribute a fix?
    
    Ok, I put that on my task list.
    
    ## 
    
    Stéphane Aulery

