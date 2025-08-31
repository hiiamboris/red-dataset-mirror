Original URL: <http://helpin.red/cs/Upravavstupu.html>

# Úprava vstupu

* * *

* * *

## Klíčová slova:  insert, remove, change.

PARSE insert

Vloží zadanou hodnotu do vstupního bloku.

a:  \["fox" "dog" "owl" "rat"]

parse a \["fox" "dog" insert 33 "owl"        "rat"]

true

print a

fox dog 33 owl rat

Jiný příklad:

         b:  "Tvé velké oči"

    parse b \[thru "velké" insert " hnědé"]          ; mezera!

false

    print b

Tvé velké hnědé oči

PARSE  remove

Odebere shodující se označené elementy ze vstupu.

a:  \["fox" "dog" "owl" "rat"]

parse a \[        "fox" remove "dog"        remove "owl" "rat"]

true

print a

fox rat

Jiný příklad:

      a:  "Tvé velké oči"

       parse a \[ to "velké"  remove "velké"]                 ; == false      

      print a                           

 Tvé oči

PARSE  change

Mění označenou položku  konformního  vstupního bloku:

a:  \["fox" "dog" "owl" "rat"]

parse a \["fox" "dog" change "owl" "COW" "owl" "rat"]      ; == false      

print a

fox dog COW rat
