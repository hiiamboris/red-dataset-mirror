# Processing block parameter with word types in red / rebol

**Link:**
<https://stackoverflow.com/questions/46998249/processing-block-parameter-with-word-types-in-red-rebol>

**Asked:** 2017-10-29 08:31:22 UTC

------------------------------------------------------------------------

When calling:

    f [(h test) (h test2)]

I want to get:

    "<p><h1>test</h1><h1>test2</h1></p>"

Instead I get:

    "<h1>test2</h1></p>"

I can\'t see why my code below doesn\'t work. Note that I want to use g
function below because I have several h like functions, g is called by
each of them to factorize them. So don\'t get rid off g, it\'s on
purpose.

    html: copy ""
    emit: func [code] [repend html code] 

    f: func [param [block!]] [
        html: copy ""
        emit: func [code] [repend html code]  
        emit <p>
        foreach p param [
            emit p
        ]
        emit </p>
        return html
    ]

    g: func ['arg [string! word!] /local html] [  
        return h :arg
    ]

    h: func ['arg [string! word!]] [
        either word? arg [
            text: to-string arg
        ][
            text: arg
        ]

        html: copy ""
        emit: func [code] [repend html code]  

        print text
        emit <h1>
        emit text
        emit </h1>
        return html
    ]

    f [(h test) (h test2)]

Update:

Now I get error in red: Script Error: html is not in the specified
context

      f: func[param [block!] /local html][
          html: copy ""
          emit: func [code] [repend html code]  
          emit <p>
          foreach p param [
              emit p
          ]
          emit </p>
          return html
      ]

      g: func['arg [string! word!] /local html][  
        return h :arg
      ]


      h: func['arg [string! word!] /local html][

          either word? arg [text: to-string arg][
            text: arg
          ]


          html: copy ""
          emit: func [code] [repend html code]  

          print text
          emit <h1>
          emit text
          emit </h1>

          return html

      ]

      f [(h test) (h test2)]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

Your problem is the usage of a global `html: copy ""` everywhere and new
initailzing the already emitted html. If you make it local with **/local
html** in the spec blocks either manually or by replacing **func** with
**funct** in Rebol2 or **function** in Red, it should work

    >>f [ [h test] [h test2]]
    test
    test2
    == "<p><h1>test</h1><h1>test2</h1></p>"
    >> 

*Comment by user310291:* I have updated code to make html local see
above but in red I got Script Error: html is not in the specified
context

*Comment by sqlab:* It works in Red if you use function. You have to
define **html**, **emit** a.s.o. in the same context

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

Ok, here a slightly optimized version for Red and Rebol without
**funct** or **function**

    emit: func [code html] [repend html code]  

    f: func[param [block!] /local html][
        html: copy ""
        emit <p> html
        foreach p param [
            emit p html
        ]
        emit </p> html
        return html
    ]

    g: func['arg [string! word!] l][  
        return h :arg
    ]


    h: func['arg [string! word!] /local html text][
        either word? arg [text: to-string arg][
           text: arg
        ]
        html: copy ""
        print text
        emit <h1> html
        emit text html
        emit </h1> html
        return html
    ]

    >>f [ [h test]   [h test2]]
    test
    test2
    == "<p><h1>test</h1><h1>test2</h1></p>"

------------------------------------------------------------------------

## Comments on question
