Original URL: <http://helpin.red/Notesonsyntax.html>

# Notes on syntax

* * *

* * *

- Red is case insensitive, but there are few exceptions, the most relevant is that a program must begin with Red (not REd or red).
- new-line characters are mostly ignored by Red interpreter. A relevant exception is a new-line inside a string.
- Red is a functional language, meaning that it evaluates results. The evaluation order is not usual and you may be interested in looking at the [Evaluation](http://helpin.red/Evaluation.html) chapter.

(the following topics may prove to be inacurate, but so far they have explained Red behavior pretty well)

- A Red program is a long chain of "words". Basically, these words may be either "data" or "actions".
- "words" are separated by one or more whitespaces .
- Red keeps a dictionary with predefined words (built-in functions) and user-created words.
- "words" may be grouped into "blocks" by enclosing them with brackets. "Blocks" are not necessarily routines, they are just a group of words that may, or may not, be evaluated by an "action".
- all the program data is inside the program itself. If external data is required, it is added to the program's chain of "words".
- every word must have a value while evaluated. This value may come from:
  
  - the word itself, if it is data;
  - evaluation, if the word is an action;
  - another word or block. This is achieved by adding a colon after the word, with no spaces, followed by the data or block we want to associate it with (e.g. myRoom: 33).

<!--THE END-->

- I find that in Red, you may say that the variable is assigned to the data, and not the other way around. In fact, there are no "variables" in Red, just words that get assigned to data.
- Copying words (variables) in Red may be tricky. When you want truly independent copies , you should use the word copy to . See [Copying chapter](http://helpin.red/Copying.html).
- As with copying, clearing a [series](http://helpin.red/BlocksSeries.html) (notice that all strings are series) is also tricky. Simply assigning "" (empty string) or zero to it may not produce the expected results. Red's logic makes it seem to "remember" things in unexpected ways. So to clear a series you should use the built-in function clear.
- every word has a datatype. Red has a remarkably large number of datatypes. They are listed in the [Datatypes](http://helpin.red/Datatypes.html) chapter.

##### Somewhat simplified view of Red's flow:

![](http://helpin.red/lib/syntax1.png)

Note: The function that picks data from before it (the third from right to left) refers to infix operators like "+", "-" , "\*" , "/" etc.

##### Refinements

Many actions in Red allow "refinements". A refinement is declared adding "/&lt;refinement&gt;" to the command (built-in function) and it modifies its behavior.

##### []()Commenting your code:

All text after a semi-colon ( ; ) in a line is ignored by the interpreter. There is also the built-in function comment . A group of words after comment will also be ignored by the interpreter. This group of words must be enclosed by " ", { } or by \[ ] .

I also note that any text written in the source code before the Red "prologue" ( Red \[ ... ] ) at the beginning is also ignored by the interpreter, but I'm not sure this is a safe way to add information to your code.

Examples of comments:

It seems to me that text written here(before the prologue)

is ignored by the interpreter. It may (or may not) be a good

way to add information about your script.

Red [                                        ; Here the prologue begins.

 Author: "Ungaretti"                        ; You may add comments after a ";"

 Date: "september 2018"                ; but one-line only.

 Purpose: "to show how to comment the code"

]

; A good prologue should be informative

comment [ This is a multiline comment

within brackets. Not only it doesn't look good

but it may cause errors - if you add a comma here for example]

print "End of first comment."

comment " This is a comment."        ; if you use quotes, comments are

                                               ; limited to one line.

print "End of second comment."

comment { This is the best way to write

a multi-line comment using "comment" word}

print "End of third comment."

{bizarrely, the interpreter seems to ignore text

written within curly braces even without the use of

the "comment" keyword". This looks elegant to me,

but be careful!}

print "End of the fourth, strange, comment."

End of first comment.

End of second comment.

End of third comment.

End of the fourth, strange, comment.

[&lt; Previous topic](http://helpin.red/Built-inhelp.html)                                                                                          [Next topic &gt;](http://helpin.red/Usingwords.html)
