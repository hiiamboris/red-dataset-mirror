
#78: WISH: ability to prematurely stop foreach-face
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
<https://github.com/red/REP/issues/78>

it does not react to `break/return` or `return` and continues to process the whole tree


Comments:
--------------------------------------------------------------------------------

On 2020-06-04T18:39:08Z, greggirwin, commented:
<https://github.com/red/REP/issues/78#issuecomment-639040251>

    This seems to work for me:
    ```
    view [
    	text "A"
    	text "B"
    	button "C1" [foreach-face face/parent [print face/text break]]
    	button "C2" [foreach-face face/parent [print face/text break/return "break/return"]]
    	button "C3" [foreach-face face/parent [print face/text return "return"]]
    ]
    ```

--------------------------------------------------------------------------------

On 2020-06-04T19:14:37Z, hiiamboris, commented:
<https://github.com/red/REP/issues/78#issuecomment-639062696>

    Try this:
    ```
    v: view/no-wait [
    	text "A"
    	panel [text "B"] "X"
    	panel [text "C"] "Y"
    ]
    
    foreach-face v [
    	print face/text
    	if face/text = "B" [print "STOPPING..." break]
    ]
    ```

--------------------------------------------------------------------------------

On 2020-06-04T19:46:02Z, greggirwin, commented:
<https://github.com/red/REP/issues/78#issuecomment-639077333>

    ```
    v: view/no-wait [
    	text "A"
    	text "B"
    	button "C1" [foreach-face face/parent [print face/text break]]
    	button "C2" [foreach-face face/parent [print face/text break/return "break/return"]]
    	button "C3" [foreach-face face/parent [print face/text return "return"]]
    ]
    foreach-face v [
    	print face/text
    	if face/text = "B" [print "STOPPING..." break]
    ]
    ```
    Results in
    ```
    A
    B
    STOPPING...
    == [make object! [
        type: 'button
        offset: 190x9
        size: 62x27
        text: "C1"
        image: none
        color: none
        m...
    ```
    But
    ```
    v: view/no-wait [
    	text "A"
    	panel [text "B"] "X"
    	button "C1" [foreach-face face/parent [print face/text break]]
    	button "C2" [foreach-face face/parent [print face/text break/return "break/return"]]
    	button "C3" [foreach-face face/parent [print face/text return "return"]]
    ]
    foreach-face v [
    	print face/text
    	if face/text = "B" [print "STOPPING..." break]
    ]
    ```
    Results in
    ```
    A
    X
    B
    STOPPING...
    C1
    C2
    C3
    == []
    ```
    
    `Panel` handling (`/sub`) appears to be the culprit.

--------------------------------------------------------------------------------

On 2020-06-04T19:54:07Z, hiiamboris, commented:
<https://github.com/red/REP/issues/78#issuecomment-639081299>

    Should I repost this to https://github.com/red/red/issues/ ?

--------------------------------------------------------------------------------

On 2020-06-04T20:58:11Z, greggirwin, commented:
<https://github.com/red/REP/issues/78#issuecomment-639112720>

    I think so. It's a good subject for an article, as well as figuring out how best to design things (including HOF-esque stuff like this), without making it an advanced topic that only a non-local-flow-control continuation-passing mother could love.

--------------------------------------------------------------------------------

On 2020-06-04T21:01:20Z, hiiamboris, commented:
<https://github.com/red/REP/issues/78#issuecomment-639114120>

    There's a [solution](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/b80079352e24b54aa57b30af90264dfe305e2186/selective-catch.red#L37)

