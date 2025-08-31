# Rebol / Red Parse html rules returns true but nothing is inserted

**Link:**
<https://stackoverflow.com/questions/46987905/rebol-red-parse-html-rules-returns-true-but-nothing-is-inserted>

**Asked:** 2017-10-28 08:49:27 UTC

------------------------------------------------------------------------

I have a parse rules that returns true but it doesn\'t insert my text as
expected : the html is unchanged whereas it should have inserted at the
end of the main closing div. I tried to use a counter like [How to parse
inside HTML tags with
REBOL?](https://stackoverflow.com/questions/6388286/how-to-parse-inside-html-tags-with-rebol)

Update: I also don\'t know how to break out of the parsing as soon as
counter = 0 so as not to insert text before last closing div after main.

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
        }

        rules: [
          thru <div class="main">
          (div-count: 1)
          some [
            to "<div" (++ div-count) thru "<div" thru ">"
            |
            to </div> mark: (-- div-count if div-count = 0 [insert mark "closing main div"]) thru </div>
          ]
          to end 
        ]
        parse content rules

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

Here a solution with **probe** to debug

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

The problems with your rules are, that the div-count is never or seldom
subtracted. The parse pointer goes straight to the next opening **div**
as **to** is always the first fulfilled condition.

You can break out or better return from parse if you add a **to end**
after a successful condition. If you are unsure use brackets for
grouping **\[ sucessful sub-rules \... to end \]**

An example with an end-rule

    end-rule: [] ; or none
    rules: [
        thru <div class="main">
        (div-count: 1)
        some [
            ["<div" (++ div-count) skip]
        |
            ["</div>"mark:  (-- div-count   if div-count = 0 [insert mark "closing main div"  end-rule: [to end]]) end-rule ]
        |  skip
    ]

\]

*Comment by user310291:* hi works better than mine :) but I failed to
understand why skip works and not thru: skip only skips one character.
Also I forgot to ask how to insert only at first div count = 0 ? since I
want to insert only for div main class.

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* The answer you cite turns
the input string into a structured block. If you are trying string
parsing with HTML on your own\...it\'s the *danger zooone*! PARSE is
clearer than RegEx and [strictly more
powerful](https://github.com/gchiu/rebol.net/blob/master/wikipedia/Parse%20Project.wiki#Theory_of_PARSE){rel="nofollow noreferrer"},
yet most every [warning about trying to process HTML directly with
RegEx](https://stackoverflow.com/a/1732454/211160) applies to PARSE as
well. See \@rgchris\'s [markup
work](https://github.com/rgchris/Scripts/blob/master/experimental/markup.reb){rel="nofollow noreferrer"}
(he is on chat here and on Red gitter)

*Comment by user310291:* \@HostileFork I don\'t need and I don\'t want a
full blown html parser, I just need to parse very specific html so rules
are normally very simple. In the case above that seems trivial idea
except it returns true but still doesn\'t insert, I failed to see why.

*Comment by HostileFork says dont trust SE:* I understand the desire to
keep it simple, but one also needs to realize (as the linked post
regarding RegEx points out) that there are limits. If it\'s just quick
and dirty, ok, but that\'s for one-off scripts\...
