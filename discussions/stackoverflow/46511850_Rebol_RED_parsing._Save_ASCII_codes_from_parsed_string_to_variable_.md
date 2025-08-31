# Rebol/RED parsing. Save ASCII codes from parsed string to variable?

**Link:**
<https://stackoverflow.com/questions/46511850/rebol-red-parsing-save-ascii-codes-from-parsed-string-to-variable>

**Asked:** 2017-10-01 11:17:33 UTC

------------------------------------------------------------------------

I stumbled into RED language the other day and spend (more or less
literally) the last 24h \"learning\" it. I exhausted my googling skills
trying to find solution for a simple problem that just evades my skills
and logic, so hopefully somebody here can lead me to path to
righteousness.

As the title suggest, I tried to parse a simple string (any string of
random text, really), get the individual char(acter)s and then tried to
save them into a variable. (Another string/array/any type really)

The best I could do was with code using:

    alpha: charset [#"a" - #"z"]
    testString: "this is just random rambling to test parsing!"

as prerequisites and something like this when (trying to) parse:

    probe parse teststring [copy text to alpha (append text2 to-integer(to-char text)) to end]

Saves the (first letter) ascii code to text2 and running the script
several times properly adds the (same first letter) ASCII code several
times in a row:

**CONSOLE OUTPUT**

    >> probe parse teststring [copy text to alpha (append text2 to-integer(to-char text)) to end]
    true
    == true
    >> probe text2
    "34"
    == "34"
    >> probe parse teststring [copy text to alpha (append text2 to-integer(to-char text)) to end]
    true
    == true
    >> probe text2
    "3434"
    == "3434"

Obviously my parsing is not really \"looping\" the individual characters
of the string or not saving them properly while doing it. Maybe my
parsing really takes the whole string from TO till END and I try to then
convert that to ASCII code or something else is happening here?

ANY help will be greatly appreciated, as I cannot possibly advance with
my RED learning before solving this dilemma and understanding how the
parsing really works in RED.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by sqlab

I am not sure, if I understand your question and what you want to
achieve, but if you are looking for all the ascii representation of the
chars you can get that with

    asciis: []
    parse teststring [some [set a  alpha (append asciis to-integer a )| skip]]
    == true
    >> asciis
    == [116 104 105 115 105 115 106 117 115 116 114 97 110 100 111 109 114 97 109 98 108 105 110 103 116 111 116 101 115 116 112 97 114 115 105 110 103]

**some** is one of the available words responsible for the looping

There are some issues in your trial. It would give some errors before
doing any conversion. **text2** is probably declared before. **to
alpha** would give an empty string **\"\"** as you try to copy up to the
first alpha character. Remember **to** goes up to and not including the
target. You can not convert an empty string to a character. If we assume
until now no error occurred, then you are still in front of your string
and you go straight to the end of your string.

Some [documentation about Red
parse](http://www.red-lang.org/2013/11/041-introducing-parse.html){rel="nofollow noreferrer"}.
see Iteration about looping

You can debug your parsing either with **parse-trace** or just put a
simple **(probe text)** after the part of your rule you want to
investigate:

*Comment by Stacking For Heap:* Thank you, that was EXACTLY what I was
trying to achieve. Can you explain what happens in my code and why it
only gave the first character (\'s ASCII code)? Did it return the whole
string between my parse conditions and then \"to-char and to-integer\"
converted it to single character and its ascii code?

*Comment by rgchris:* No love for COLLECT?
`collect [parse [... (keep to integer! a) ...]]` (or if Red-only
`parse [collect [some [... keep (to integer! a) ...]]]`)

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* Use `parse-trace` to debug

*Comment by Geeky I:* I think you\'re missing some stuff in your
prerequisites test code to reproduce, like `text2: ""`

*Comment by Stacking For Heap:* Very true, text2 was not declared
indeed. Was a sloppy paste it seems, sorry for that.

*Comment by rnso:* Welcome to Red language! I faced similar problem a
few days back:
[stackoverflow.com/questions/46260181/...](https://stackoverflow.com/questions/46260181/variable-value-in-foreach-of-red-language "variable value in foreach of red language")
