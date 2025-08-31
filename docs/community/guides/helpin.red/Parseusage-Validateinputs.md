Original URL: <http://helpin.red/Parseusage-Validateinputs.html>

# Parse usage - Validate inputs

* * *

* * *

Validating alphanumeric entries:

Before we proceed, I should warn you that the datatyping of Red may cause some trouble to programming. For example, a single-digit number in Red may be an integer!, a string!, a char!, or something else. So if you have some inexplicable bugs in your script, make sure your debugging checks the datatypes being parsed.

Here is a script that prompts the user to enter 4 single digit numbers and check if the entry is OK until the entry is "q":

Red \[]

entry: ""

while \[entry &lt;&gt; "q"] [

       entry: ask "Enter four digits in the 1-8 range: "

       either (parse entry \[some \["1" | "2" | "3" | "4" | "5" | "6" | "7" | "8"]]) and ((length? entry) = 4) [

               print "OK"]

               [

               print "Not OK!"

               ]

]

That works, but \["1" | "2" | "3" | "4" | "5" | "6" | "7" | "8"] may be substituted for charset \["12345678"]:

Red \[]

entry: ""

validchar: charset \["12345678"]

while \[entry &lt;&gt; "q"] [

       entry: ask "Enter four digits in the 1-8 range: "

       either (parse entry \[some validchar]) and ((length? entry) = 4) [

               print "OK"]

               [

               print "Not OK!"

               ]

]

Since parse checks character by character, charset \["12345678"] may also be written as charset \[#"1" - #"8"] ! Red understands that that is a sequence of characters. So, for example, your program may be made to accept any numeric and lower case ASCII characters by using        charset \[#"0" - #"9" #"a" - #"z"].

Crude phone number validator  (from Rebol/Core manual) - Rules referring to rules:

Red \[]

digits: charset "0123456789"

area-code: \["(" 3 digits ")"]

phone-num: \[3 digits "-" 4 digits]

print parse "(707)467-8000" \[\[area-code | none] phone-num]

true

Crude email validator (from Red blog):

Red \[]

digit:   charset "0123456789"

letters: charset \[#"a" - #"z" #"A" - #"Z"]

special: charset "-"

chars:   union union letters special digit

word:    \[some chars]

host:    \[word]

domain:  \[word some \[dot word]]

email:   \[host "@" domain]

print parse "john@doe.com" email

print parse "n00b@lost.island.org" email

print parse "h4x0r-l33t@domain.net" email

true

true

true

Validating math expressions in string form (from Rebol/Core manual):

Notice that this example uses recursing rules (a rule that refer to itself).

Red \[]

expr:    \[term \["+" | "-"] expr | term]

term:    \[factor \["\*" | "/"] term | factor]

factor:  \[primary "\*\*" factor | primary]

primary: \[some digit | "(" expr ")"]

digit:   charset "0123456789"

print parse "1+2\*(3-2)/4" expr        ; will return true

print parse "1-(3/)+2" expr           ; will return false

true

false

[&lt; Previous topic](http://helpin.red/Controlflow.html)                                                                                          [Next topic &gt;](http://helpin.red/Parseusage-Extractdata.html)
