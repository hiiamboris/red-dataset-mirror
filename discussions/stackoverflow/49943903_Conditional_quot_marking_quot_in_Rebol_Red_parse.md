# Conditional &quot;marking&quot; in Rebol / Red parse

**Link:**
<https://stackoverflow.com/questions/49943903/conditional-marking-in-rebol-red-parse>

**Asked:** 2018-04-20 14:23:25 UTC

------------------------------------------------------------------------

Subsequent to [Rebol / Red Parse html rules returns true but nothing is
inserted](https://stackoverflow.com/questions/46987905/rebol-red-parse-html-rules-returns-true-but-nothing-is-inserted)

How to mark the end of the fist main div only (when div-count is 0 first
time), not the second one, or is there a way to break out of parse
conditionally to a variable value ?

            content: {<div class="main">
              <h1>
                Big TITLE
              </h1>
              <div>
                <section>
                  <p>a paragraph</p>
                </section>
                 <section>
                  <p>a paragraph</p>
                </section>
                  <section>
                  <p>a paragraph</p>
                </section>
               </div>
               <div>
                  <p>Blah Blah</p>
               </div>
            </div>
            <div>
              Another Div
            </div>

        <div class="main">
              <h1>
                Big TITLE
              </h1>
              <div>
                <section>
                  <p>a paragraph</p>
                </section>
                 <section>
                  <p>a paragraph</p>
                </section>
                  <section>
                  <p>a paragraph</p>
                </section>
               </div>
               <div>
                  <p>Blah Blah</p>
               </div>

            </div>
            <div>
              Another Div
            </div>    
            }

            rules: [
                 thru <div class="main">
                 (div-count: 1)
                  some [
                    "<div" (probe ++ div-count) skip
                  |
                    "</div>" mark:  ( probe -- div-count   if div-count = 0 [insert mark "closing main div"]) skip 
                  |  skip
                 ]
              ]
            parse/all content rules 

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by 9214

It seems that you need a mix of `opt` and `if` keywords. Consider a
simplified example:

    count: 0
    div: ['div some integer! /div]

    probe parse [
        div 1 2 3 /div 
        div 4 5 6 /div
        div 7 8 9 /div
    ][
        some [
            div (count: count + 1) opt [if (count = 1) mark:]
        ] 
    ]

    probe mark

Here, after each `div` rule match, increment of a counter happens. After
that there\'s an optional match \-- if counter is at `1`, then current
input position is marked, otherwise parsing continues as-is. Because
this rule is optional, parsing will continue despite its success or
failure.

Additionally, if you want to break out of a parsing loop (that is,
`some`, `any` or `while`), you can use `break` (returns success) or
`reject` (returns failure), again in combination with `opt`, `if` and
conditional `paren!` expression.

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

Here a solution working in Red and Rebol using your approach plus adding
some selfmodification to the rules

    rules: [
        thru <div class="main">
        (div-count: 1 clear rules/5/8 )
        some [
            "<div" (probe div-count: div-count + 1) skip
            |
            "</div>" mark:  ( 
                 probe div-count: div-count - 1   
                 if div-count = 0 [
                     insert mark "closing main div"  append rules/5/8 [to end]  
                 ]
             ) [] skip 
             |  skip
         ]
     ]

*Comment by user310291:* hi thanks but I don\'t understand what clear
rules/5/8 is supposed to do ?

*Comment by sqlab:* Clearing this part of the rule (the emtpty block in
the original rule) makes the rule reuseable by generating the initial
rule again, if you want to use the rule more than once in a program or
function.

------------------------------------------------------------------------

## Comments on question
