# Red parse with break

**Link:**
<https://stackoverflow.com/questions/50097970/red-parse-with-break>

**Asked:** 2018-04-30 09:48:45 UTC

------------------------------------------------------------------------

my parse code with break doesn\'t work, I shouldn\'t get last div block
in text:

    src: {
    <div class="main">
        <div>
            test
        </div>

        <div>
            test2
        </div>
        <div>
            test3
        </div>
    </div>

    <div class="test">
    </div>
    }

    rules: [
        (div-count: 0)
        some [
            to "<div"
            (div-count: div-count + 1) [if (div-count = 1) mark1:] 
            |
            thru "</div>"
            (div-count: div-count - 1) [if (div-count = 0) mark2: break]
        ]

        text: copy/part mark1 mark2

    ]

    parse src rules
    print text

Expected result I want is:

        {
        <div class="main">
            <div>
                test
            </div>

            <div>
                test2
            </div>
            <div>
                test3
            </div>
        </div>
        }

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

An answer for Red and Rebol could look like this

    rules: [
        (div-count: 0   clear rules/3/8 )
        some [
            mark:  "<div"  
            (if  equal? 1  div-count: div-count + 1  [
                mark1:  mark  
            ] )   | 
             "</div>"  mark2:
            ( 
            if equal? 0  div-count: div-count - 1  [
                text: copy/part mark1 mark2    
                insert rules/3/8 [to end]  
            ]  )  
            [] | skip
        ]
    ]

One of the problems with your rules are that you use *`to`* and `|`
(meaning or) *`thru`*, so that most closing `</div>` s would be skipped.
The first match `<div` is satisfied and on to the next opening`<div`
without comparing the following sub rules. But the cursor is not
advancing, the next `<div` is still the same. Probably Red discovers the
endless loop (no advancing) and interrupts it.

I use dynamically modified rules instead of `break`, as `break` breaks
out of (sub) rules in Rebol, but does not stop the whole parsing process
as you can see here.

     >> parse "aaa" [(n: 0)some ["a" [break] (ask form n: n + 1) ]]
     1
     2
     3
     == true

That\'s different to Red, where it interupts parse.

    >> parse "aaa" [(n: 0)some ["a" [break] (ask form n: n + 1) ]]
    1
    == false

So a simple solution suitable for Red, not for Rebol can look like that

    rules: [
        (div-count: 0)
        some [
            mark: "<div"
            (if  equal? 1  div-count: div-count + 1  [mark1:  mark]) 
            |
            "</div>" mark2:
            if (equal? 0  div-count: div-count - 1 )  
              [(print text: copy/part mark1 mark2 )  break]
            |
            skip
        ]
    ]

*Comment by user310291:* Could you explain why you do need clear
rules/3/8 : do you change rules dynamically ?

*Comment by user310291:* I don\'t understand \[\] \| skip either

*Comment by user310291:* still why conditional break doesn\'t work: is
my program buggy or red buggy ?

*Comment by user310291:* tested program it works though I don\'t
understand ;)

*Comment by sqlab:* Yes, I change the rules dynamically. \[\] does
nothing. It is just a place holder, that gets filled. Your program seems
to be a endless loop that gets discovered by Red and stopped as the
cursor is not advancing

*Comment by user310291:* changing rules dynamically is weird for a use
case which is rather simple: is it really mandatory aren\'t there any
other solutions ?

*Comment by sqlab:* Ok, I added a pure Red solution without self
modification but with conditional break

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

Here is an alternative parametrized way to parse it:

    div: ["<div" 4 skip some ["</div>" break | div | skip] | skip]
    div-rule: [to "<div" div]

    n: 1
    parse src compose [(n - 1) div-rule copy text div-rule to end]

With `n: 1`, it will extract the first root `<div>`, with `n: 2`, the
second one, and so one. It should be possible to also parametrize the
nested rules to extract arbitrary `<div>` sections.

------------------------------------------------------------------------

## Comments on question
