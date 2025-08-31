Original URL: <http://helpin.red/Printingspecialcharacters.html>

# Printing special characters

* * *

* * *

### These were taken from Rebol's documentation, but I have tested most of them in Red and they seem to work:

### Control characters:

Character

Definition

#"^(null)" or #"^@"

null (zero)

#"^(line)", or #"^/"

new line

#"^(tab)" or #"^-"

horizontal tab

#"^(page)"

new page (and page eject)

#"^(esc)"

escape

#"^(back)"

backspace

#"^(del)"

delete

#"^^"

caret character

#"^""

quotation mark

#"(0)" to #"(FFFF)"

hex forms of characters

Special characters for within strings:

Character

Function

^"

prints a " (quote)

^}

inserts a } (closing brace)

^^

inserts a ^ (caret)

^/

starts a new line

^(line)

starts a new line

^-

inserts a tab

^(tab)

inserts a tab

^(page)

starts a new page (?)

^(letter)

inserts control-letter (A-Z)

^(back)

erases one character back

^(null)

inserts a null character

^(esc)

inserts an escape character

^(XX)

inserts an ASCII character by hexadecimal (XX) number

[&lt; Previous topic](http://helpin.red/Stringandtextmanipulation.html)                                                                                          [Next topic &gt;](http://helpin.red/Timeandtiming.html)
