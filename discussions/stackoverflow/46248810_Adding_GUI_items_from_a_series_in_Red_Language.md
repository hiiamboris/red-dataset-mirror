# Adding GUI items from a series in Red Language

**Link:**
<https://stackoverflow.com/questions/46248810/adding-gui-items-from-a-series-in-red-language>

**Asked:** 2017-09-16 00:00:08 UTC

------------------------------------------------------------------------

I want to add GUI items from a series. I am trying following code but it
does not work:

    mylist: ["first" "second" "third" "fourth" ]

    view[
        foreach i mylist [
            text i  ]]

The error is:

    *** Script Error: VID - invalid syntax at: [foreach ll mylist]
    *** Where: do
    *** Stack: view layout cause-error 

Where is the problem and how can it be solved? Thanks for your answers.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by rgchris

Remember that\...

    view [... what goes in here...]

\...is a dialect, it is not regular code. It\'s a special dialect that
has some evaluative qualities, but the normal rules don\'t always apply.

Don\'t forget that a dialect is just a block of values like anything
else in Red. You can pre-build it as such:

    view collect [
        foreach i mylist [
            keep 'text keep i
        ]
    ]

You can stick a `PROBE` between `VIEW` and `COLLECT` there to see what
you\'re generating and `COLLECT/KEEP` gives you a lot of scope for
tuning the values that end up in your view spec.

------------------------------------------------------------------------

### Answer (score: 1) --- by Graham Chiu

Your problem is you are mixing dialects. You have a VID dialect inside
the View block, but you\'re also using the DO dialect there as well
which is not understood by View.

At least in Rebol you would add a `do` block as an initialization
sequence inside the VID dialect eg.

    view [
       VID dialect goes here ...
       do [ do dialect stuff that could initialize gui elements go here ]
    ]

*Comment by rnso:* Enclosing `foreach` part in `do[foreach ...]` does
not help. A window appears but it has not visible text in it.

------------------------------------------------------------------------

## Comments on question
