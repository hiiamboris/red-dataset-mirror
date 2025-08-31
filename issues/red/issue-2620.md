
#2620: [GUI] [VIEW] Button action goes active only on first ON-CLICK event
================================================================================
Issue is closed, was reported by gerardcote and has 6 comment(s).
[status.resolved]
<https://github.com/red/red/issues/2620>

While doing some testing, modifying some of this blog's scripts (http://jennyk36.blogspot.ca/), I found the following 2 code snippets fail to get the "text" attribute updated for the following faces : AREA and FIELD after they have been changed/edited a first time from the BUTTON's action activated by the ON-CLICK event.  

Just try to delete/alter the content of the text for any of the faces after a first CLICK on the BUTTON and the text remains unaltered when the BUTTON is clicked a second time. Only the first event seems to get the action done.

view [f: field "Another Example"  button "Change" [f/text: "changed"] ]
view [a: area "Another Example"  button "Change" [a/text: "changed"] ]




Comments:
--------------------------------------------------------------------------------

On 2017-04-23T03:19:45Z, qtxie, commented:
<https://github.com/red/red/issues/2620#issuecomment-296416727>

    @gerardcote This one works:
    ```
    view [f: field "Another Example" button "Change" [f/text: copy "changed"] ]
    ```

--------------------------------------------------------------------------------

On 2017-04-23T05:38:14Z, gerardcote, commented:
<https://github.com/red/red/issues/2620#issuecomment-296421115>

    May be this other failing test is related and explains what is going bad in the above test cases...
    ```
    Red [needs: 'view]
    
    view [below t: text  "Hi, I'm Jenny  What's your name ?" f: field 180x25
          button "Say Hi .." [
          	either any [f/text = "" f/text = none] [
          		probe rejoin ["empty " f/text]
          		f/text: "You must enter something-first"   ; this one creates the problem when f/text = ""
          		probe rejoin ["between " f/text]
          		t/text: "Empty "
          		probe rejoin ["after empty " f/text]
          	][
          		probe rejoin ["filled " f/text]
            	t/text: append form "Hello " f/text
            ]
          ]  
    
    ]
    ```
    Here I wanted to update the content of the f field with a prompt when nothing is entered at the keyboard and the button is clicked on.
    
    
    After many trials I deduced that the problem is related with the way f/text is updating its content : when the content is none the updating with f/text: is correctly executed but when the content is empty "" then the content is not updated at all by the same f/text: so I had to retest the content inside the first test to discover this behavior and use an append instead of the original set operation. 
    ```
    Red [needs: 'view]
    
    view [below t: text  "Hi, I'm Jenny  What's your name ?" f: field 180x25
          button "Say Hi .." [
          	either any [f/text = "" f/text = none] [
          		probe rejoin ["empty " f/text]
          		either f/text = none [
          			f/text: "You must enter something-first"
          		][
          			f/text: append f/text "You must enter something-else !" 
                            ; append is required f/text to be really empty "" and doesn't work when = none 
          		]
          		probe rejoin ["between " f/text]
          		t/text: "Empty "
          		probe rejoin ["after empty " f/text]
          		
          	][
          		probe rejoin ["filled " f/text]
            	t/text: append form "Hello " f/text
            ]
          ]  
    ]
    ```

--------------------------------------------------------------------------------

On 2017-07-28T13:07:34Z, dockimbel, commented:
<https://github.com/red/red/issues/2620#issuecomment-318647087>

    All those code snippets seem to be working fine now. Ask for re-opening if I missed something.

