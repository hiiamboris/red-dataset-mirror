Original URL: <http://helpin.red/cs/Konzola-vstupavystup.html>

# Konzola - vstup a výstup

* * *

* * *

### Poznámka: vstup do ~ a výstup z konzoly může být při kompilování  programů problematický, neboť při kompilaci je konzola mimo provoz.

### native! print

print  je funkce, která posílá data do konzoly. Za daty ještě do konzoly posílá znak newline , který je při výstupu respektován.

Red \[]

print "hello"

print 33

print 3 + 5

hello

33

8

### native! prin

prin  také posílá data do konzoly ale bez znaku newline,  takže vytiskne všechna zadaná data na jeden řádek.

Red \[]

prin "Hello"

prin "World"

prin 42

HelloWorld42

### function! probe

probe  vrací svůj argument bez vyhodnocení, na rozdíl od funkce  print, která svůj argument vyhodnotí;  probe může být použit při ladění k zobrazení nezměněného kódu.

&gt;&gt; print \[3 + 2]  
5

&gt;&gt; probe \[3 + 2]  
\[3 + 2]  
\== \[3 + 2]

&gt;&gt; print probe \[3 + 2]  
\[3 + 2]  
5

Popsáno také [zde](http://helpin.red/Formatovanidat.html), za příkazem  mold.

### function! input

Vloží  string (řetězec) z konzoly. Notice that any number typed on console are converted to a string.newline character is removed.

Red \[]

prin "Enter a name: "

name: input              ;-- John --&gt; "John"

print \[name "is" length? name "characters long"]

John

John is 4 characters long

### routine! ask

Totéž jako input ale zobrazí se řetězec.

Red \[]

name: ask "What is your name: "

prin "Your name is "

print name

What is your name: John

Your name is John
