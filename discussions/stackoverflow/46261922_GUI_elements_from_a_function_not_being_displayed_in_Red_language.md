# GUI elements from a function not being displayed in Red language

**Link:**
<https://stackoverflow.com/questions/46261922/gui-elements-from-a-function-not-being-displayed-in-red-language>

**Asked:** 2017-09-17 08:03:26 UTC

------------------------------------------------------------------------

I am using following code to try to get GUI elements from a function:

      mypanelfn: func[] [
        collect[
          repeat i 10 [ 
            print append copy "i in loop: " i
            keep [t: text]  keep append copy "message: " i
            keep [field "entry"    
                  button "Click" [t/text: "clicked"] return]]]]

      view [ 
        do [mypanelfn]]

There are no error messages and loop go on all right and a windows is
also displayed. But this is only a small empty windows without any text,
fields or buttons.

What is wrong with this code?

Edit: putting `probe` before `collect` shows (I have added line breaks
for clarity):

    [t: text "message: 1" field "entry" button "Click" [t/text: "clicked"] return 
    t: text "message: 2" field "entry" button "Click" [t/text: "clicked"] return 
    t: text "message: 3" field "entry" button "Click" [t/text: "clicked"] return 
    t: text "message: 4" field "entry" button "Click" [t/text: "clicked"] return 
    t: text "message: 5" field "entry" button "Click" [t/text: "clicked"] return

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by rgchris

This method does not require setting any variables---it works by
containing each iteration of faces within a common parent (`panel`):

    view collect [
        keep [below space 0x0]
        repeat i 10 [
            keep compose/deep [
                panel [
                    origin 0x0
                    text (rejoin ["Message Number: " i])
                    field "entry"
                    button "Click" [face/parent/pane/1/text: "clicked"]
                ]
            ]
        ]
    ]

`face/parent` is the `panel` face whose first child (`pane/1`) is the
text box (`origin` does not create a face).

*Comment by rgchris:* \@rnso My code segments adhere to the Rebol/Red
coding style guide---please refer to that before modifying.

------------------------------------------------------------------------

### Answer (score: 2) --- by Geeky I

You don\'t necessarily need the function there, however:

    view mypanelfn

Works.

Note: the equivalent code in Rebol requires `layout`:
`view layout mypanelfn`

The reason this happens is because `view` processes `blocks!` (anything
inside `[]`). So you don\'t have to `do` it.

In general, it\'s better to think of Red as a functional, message
passing language. Everything is an expression, in contrast to imperative
languages with procedures and statements.

------------------------------------------------------------------------

### Answer (score: 1) --- by Graham Chiu

this works for me in rebol/view:

    lay: mypanelfn
    insert head lay 'across
    view layout lay

[![enter image description
here](https://i.sstatic.net/MTECh.png)](https://i.sstatic.net/MTECh.png){rel="nofollow noreferrer"}

I think while you\'re learning this stuff you need to look at the
generated VID code to check that there are no problems before trying to
View it.

*Comment by rnso:* Output being returned from function seems all right
(see edit in my question above). Then why my code is not working in Red?

*Comment by rnso:* Your code does not work for me in Red. The error is:
`*** Script Error: lay has no value; *** Where: head; *** Stack: mypanelfn `
(I have added semicolons instead of line breaks).

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

once again; you need unique names for elements you want to address. Here
a solution with reduce instead of compose

    mypanelfn: func[] [
      collect[
        repeat i 10 [ 
          tname: to-word rejoin ['t i]
          print append copy "i in loop: " i
          keep  reduce [to-set-word tname 'text]  keep append copy "message: " i
          keep reduce [
           'field "entry" 'button "Click"  reduce  [ 
              to-set-path  reduce [
                 tname 'text ]
                "clicked" ]
          'return ] ] ] ] 

I recommend that you use the commands in the console to see what they
do. E.g.

`rejoin ['t i]` creates a string `"t1"`with t and the
(reduced/get-)value of i.

`to-word` changes that to a Red(bol) word `t1`

`to-setword tname` creates a set-word `t1:`

`to-set-path reduce [tname 'text ]`creates a set-path `t1/text:`

*Comment by rnso:* Yes, it works very well. The text elements get
labelled as `t1, t2` etc and clicking buttons affect corresponding text
element only. It will be useful if you can explain how this labeling is
working, i.e. use of `to-word, rejoin, to-set-word, to-set-path` etc.

*Comment by rnso:* What is `to-set-path` for?

------------------------------------------------------------------------

## Comments on question

*Comment by rnso:* Actually, `view mypanelfn` works perfectly. All GUI
elements are being displayed. But clicking any button changes only last
text label, and not corresponding text label. How can this be corrected?

*Comment by Geeky I:* Use `self/text`

*Comment by rnso:* Which `text` entry? I am not able to add `self`
anywhere with success.

*Comment by Geeky I:* Btw,
[stackoverflow.com/a/46253902/5798459](https://stackoverflow.com/a/46253902/5798459)
solves this problem

*Comment by Geeky I:*
[github.com/red/red/blob/master/tests/view-test.red](https://github.com/red/red/blob/master/tests/view-test.red){rel="nofollow noreferrer"}
has better examples of dynamically constructing view objects

*Comment by Geeky I:*
[doc.red-lang.org/en/vid.html#\_do](https://doc.red-lang.org/en/vid.html#_do){rel="nofollow noreferrer"}
for `self`, but it\'s possibly better to ask that in another question :)

*Comment by Geeky I:* Also, do check with our communities here rebol:
[chat.stackoverflow.com/rooms/291/rebol](https://chat.stackoverflow.com/rooms/291/rebol)
red:
[gitter.im/red/red/welcome](https://gitter.im/red/red/welcome){rel="nofollow noreferrer"}
