Original URL: <http://helpin.red/cs/Iterace.html>

# Iterace

* * *

* * *

## Klíčová slova:  some, any, opt, while.

Aplikace pravidla (rule) může být nepovinná nebo různým způsobem opakovaná.

Klíčové slovo či hodnota

Popis

3     &lt;rule&gt;

opakovat pravidlo 3 krát

1 3  &lt;rule&gt;

opakovat pravidlo 1 až 3 krát

0 3  &lt;rule&gt;

opakovat pravidlo 0 až 3 krát

some

opakovat pravidlo jednou či vícekrát

any

opakovat pravidlo nula či vícekrát

opt

shoda s pravidlem žádná nebo jedna

Určitý počet opakování - příklady

&gt;&gt; parse "fogfogfog" \[3 "fog"]          ; určeno přesně

== true

&gt;&gt; parse "fogfogfog" \[0 5 "fog"]        ; určeno rozsahem

== true                              

Neurčitý počet opakování - příklady

PARSE some,  PARSE any,  PARSE opt

Aplikuje pravidlo následného vnořeného bloku (jednou či vícekrát, nikdy nebo alespoň jednou, nikdy nebo jednou), dokud neselže nebo dokud lze ve vstupním bloku postupovat:

Red\[]

    a: \[ "elk" "cat" "owl"]

* * *

parse a \[        some \["elk"]            ; jednou nebo vícekrát

          "cat" "owl"  ]

true

parse a \[        some \["elk" "cat"]      ; jednou nebo vícekrát

          "owl"  ]

true

parse a \[        some \["fig"]            ; nikdy

          "elk" "cat" "owl"  ]

false

* * *

parse a \[        any \["elk"]             ; nikdy nebo alespoň jednou

          "cat" "owl"  ]

true

parse a \[        any \["elk" "cat"]       ; nikdy nebo alespoň jednou

          "owl"  ]

true

parse a \[        any \["fig"]             ; nikdy nebo alespoň jednou

          "elk" "cat" "owl"  ]

true

parse a \[        any \["fig"]             ; nikdy nebo alespoň jednou

          "elk" "owl"  ]

false                             ; nikdy se vztahuje jen na subpravidlo any

* * *

parse a \[        opt \["fig"]             ; nikdy nebo alespoň jednou

           "elk" "cat" "owl"  ]

true

parse a \[        opt \["elk" "cat"]       ; nikdy nebo alespoň jednou

          "owl" ]

true

parse a \[        opt \["elk" "owl"]       ; nikdy nebo alespoň jednou

          "cat" ]

false *

         *  Pokud se vstup neshoduje s pravidlem opt, přeskočí parse toto pravidlo a kontroluje tentýž vstup následným pravidlem.

Jiný příklad pro opt:

hd: "horskádráha"                  ; řetězec s 11 elementy

parse hd \[opt "horská" "dráha"]   ; == true     

parse hd \[opt "horská" "práva"]   ; == false

PARSE while

Podobně jako any, aplikuje pravidlo následného vnořeného bloku nikdy nebo alespoň jednou, dokud neselže; nestará se o případnou změnu vstupu:  

a:  \["elk" "cat"]                

print parse a \[ any \["fox" "dog"] "elk" "cat" ]

true

print parse a \[ while \["fox" "dog"] "elk" "cat" ]

true

Ve skutečnosti je to mnohem složitější - viz [Ungaretti](http://helpin.red/RepetitionandMatchingLoops.html) # while.
