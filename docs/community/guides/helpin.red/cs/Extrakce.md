Original URL: <http://helpin.red/cs/Extrakce.html>

# Extrakce

* * *

## Klíčová slova:  set, copy,  keep, collect, collect set, collect into.

Připomínka: Příkaz "print" provádí úpravu výstupu. Sběrný blok \["fox" "rat"] například, upraví na fox rat.

PARSE set ,  PARSE copy

V obou případech přiřadí ke jménu  následnou  první hodnotu uspokojené regule:

       parse \[7 9 3] \[set val integer! string! integer!]         ; --&gt; false

print val                                                 ; --&gt; 7

parse \[7 9 3] \[copy val integer! integer! integer!]       ; --&gt; true                        print val                                                 ; --&gt; 7    

parse \[7 9 3] \[integer! set val string! integer!]         ; --&gt; false

print val                                                 ; --&gt; val has no value!

Ve spojení s klíčovým slovem any se výstupy liší. Příkaz set vrací pouze první platnou hodnotu, příkaz copy vrací všechny zbyvající platné hodnoty:

       parse \[7 9 3] \[integer! set val any integer!]             ; --&gt; true

print val                                                 ; --&gt; 9

parse \[7 9 3] \[integer! copy val any integer!]            ; --&gt; true                       print val                                                 ; --&gt; 9 3    

PARSE keep  rule

Používá se s klíčovým slovem collect, collect set a collect into. Připojí do sběrného bloku kopii první následné hodnoty uspokojené regule.

PARSE collect

Vytvoří sběrný blok, zaplněný příkazem  keep. Příkaz  parse zde nevrací true či false.

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; vstupní blok

print parse a [

       collect[

       keep "fox"          ; success, patří do sběrného bloku

       "dog" "owl"     ; success, ale nepatří do sběrného bloku

       keep "rat"      ; success, patří do sběrného bloku

       keep "cow"          ; fail, proto nepatří do sběrného bloku

       "cat"  ] ]         ; success, ale nepatří do sběrného bloku

fox rat

PARSE collect set

Na rozdíl od collect vrací true či false. Vytvořený sběrný blok přiřadí zadané proměnné (zde b).

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; input block

print parse a [                 ; bez "print" nevrátí "false"

       collect set b [                 ; vytvoří sběrný blok b

       keep "fox" "dog" "owl"            ; "fox" is OK, will be kept

       keep "rat"                  ; "rat" is OK, will be kept

       keep "cow" "cat" ]          ; "cow" will be not kept

]

print b

false

fox rat

PARSE collect into

Na rozdíl od collect vrací true či false. Vytvořený sběrný blok přiřadí předem připravené proměnné (zde b).

Red\[]

a: \["fox" "dog" "owl" "rat" "elk" "cat"]        

b: ""                                ; must create block first

print parse a [

       collect into b [

       keep "fox"             ; success, WILL be kept

       "dog"

       "owl"

       keep "rat"         ; success, WILL be kept

       keep "cow"             ; FAIL! will NOT be kept

       "cat"

               ]

]

print b

false

foxrat

Selektivní výběr syntaxí set-word

Při parsování lze ke zbytku vstupu přiřadit proměnnou, byť je výsledek negativní:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]

print parse a \[ "fox" "dog"  b:  ]   ; přiřadí zbytek slovu b

probe b

false

\["owl" "rat" "elk" "cat"]
