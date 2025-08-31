Original URL: <http://helpin.red/cs/Matching.html>

# Matching

* * *

* * *

## Klíčová slova:  skip, thru, to, ahead, end, none, not, quote

PARSE skip

Bez argumentu přeskočí pouze jeden element:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"] ; input block

print parse a [   ; here the rules begin:

       "fox"        ; rule 1 matches element 1 =&gt; true

       skip         ; rule 2 skips this element

       "owl"        ; rule 3 matches element 3 =&gt; true

       "rat"        ; rule 4 matches element 4 =&gt; true

       "elk"        ; rule 5 matches element 5 =&gt; true

       "cat"        ; rule 6 matches element 6 =&gt; true          

]

true

S argumentem přeskočí zadaný počet elementů:

print parse "axxb" \["a" 2 skip "b"]

true

PARSE  to a thru

Přeskočí elementy až k označenému místu vstupního bloku. Slovo to nastaví počátek parsování před zadaný element, slovo thru nastaví počátek parsování za zadaný element.

       ![](http://helpin.red/lib/NewItem188190.png)

PARSE  to

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat" "bat"]  ; input block

print parse a [    

       to "elk"                    ; přeskočí všechny elementy před "elk"

       "elk" "cat" "bat"     ; zbytek je konformní s pravidlem                

]

true

PARSE  thru

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat" "bat"] ; input block

print parse a [

       thru "elk"        ; přeskočí všechny elementy včetně "elk"

    "cat" "bat"        ; zbytek je konformí s pravidlem        

    ]

true

Klíčové slovo thru je prospěšné, i když procedura skončí hodnocením false:

Red\[]

s:  "dnes je nádherný den" 

parse s \[thru "nádherný" change "" " a slunný"]

false

           s

       == "dnes je nádherný a slunný den"

K čemu zde došlo:

Vstupní řetězec byl konfrontován s příkazem ke skoku za slovo "nádherný", jehož následná mezera byla nahrazena doplňkem "  a slunný".

PARSE ahead

Zkontroluje, zda se následující (ahead) element shoduje s pravidlem.

Red\[]

a:  \["fox" "dog" "owl" "rat"]        ; input block

print parse a [  

       "fox"        

       "dog"

       ahead "owl"             ;checks if the next item matches the rule

       "owl"

       "rat"     ]

true

Ve skutečnosti je to mnohem složitější - viz [Ungaretti](http://helpin.red/RepetitionandMatchingLoops.html) # while - ahead

PARSE end

Vrací true, jestliže byly pozitivně zkontrolovány všechny položky - což se vykoná i bez slova end.

Red\[]

a:  \[33 18.2 #"c" "rat"]                 ; input block

print parse a \[ integer! float! char!        string! end ]

true

## Poznámka: Slovo end označuje pozici na konci každé sekvence. Interpret si jej dosadí sám, pokud není uveden.

PARSE none

Vždycky vrací true.  Je to pravidlo pro všechny případy

Red\[]

a:  \["fox" "dog" "owl" "rat"]  

print parse a ["fox" "dog"

        none (print "Servus")      ; příkaz print lze vložit i bez none!        

       "owl" "rat" ]

true

PARSE not        

Neguje platnost (existenci) následného "pravidla":

Red\[]

              a:  \["fox" "dog" "owl" "rat"]

    print parse a \["fox" "dog" not "owl" "owl" "rat"]   ; museli jsme jedno "owl" přidat

true

         print parse a \["fox" "dog" not "owl" skip "rat"]    ; museli jsme "owl" přeskočit

true

PARSE quote nebo apostrof  '      

Match next value literaly (for dialect escaping needs).

Red\[]

         parse  \[x] \['x]

true

         parse  \[\[x]] \[ quote \[x]]

true
