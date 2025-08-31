
#1678: Size change problem, square value results in rectangular shape
================================================================================
Issue is closed, was reported by iArnold and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1678>

Similar source https://gist.github.com/iArnold/601546d4109f90d16841

Odd behaviour, changing the size of a 'base (to 4x4) result looks more rectangular than square.



Comments:
--------------------------------------------------------------------------------

On 2016-03-07T15:35:11Z, iArnold, commented:
<https://github.com/red/red/issues/1678#issuecomment-193302204>

    I added some display and a different size assignment
    change-move-indication: func [
        to-color [integer!]
    ][ 
        either 1 = to-color [
            print "black to move"
            red-to-move/size: 4x4
            black-to-move/size: move-indicator-size
            player-color-to-move/color: purple
        ][
            print "Red to move"
            red-to-move/size: move-indicator-size
            black-to-move/size/1: 4
            black-to-move/size/2: 4
            player-color-to-move/color: green
        ]
    
    ```
    show player-color-to-move
    
    print black-to-move/size/1
    print black-to-move/size/2
    ;show win/pane
    ```
    
    ]
    Now value size/1 is even equal to -1 !

--------------------------------------------------------------------------------

On 2016-03-08T00:44:53Z, qtxie, commented:
<https://github.com/red/red/issues/1678#issuecomment-193529948>

    It's should be fixed in the latest commit.

