Original URL: <http://helpin.red/cs/Parse.html>

# Parse

* * *

* * *

Parse je vnořený jazyk (DSL - Domain Specific Language) pro parsování vstupních řad (series) s použitím gramatických pravidel tohoto jazyka. Používá se pro ověření shody, vyjímání a úpravu vstupních dat. Ve všech případech se používá funkce parse v této skladbě:

parse &lt; input &gt; &lt; rules &gt;

&lt;input&gt; : jakákoli hodnota řady (any-string!, any-block!, binary!)  
&lt;rules&gt; : blok s pravidly

Parsování začíná na začátku vstupní řady. Při úspěšné konfrontaci s pravidly (success) postupuje k dalšímu členu řady. Parsování končí výskytem neúspěchu a operace vrací FALSE nebo úspěšným průchodem celou vstupní řadou a operace vrací TRUE.

Významnou úlohu při sestavování gramatických pravidel mají klíčová slova, která lze rozdělit do několika kategorií:

Ověření shody:

ahead, end, none, not, quote, skip, thru to

Průběh parsování:

break, if, into, fail, then, reject

Iterace:

some, any, opt, while

Extrakce a uložení:

set, copy, keep, collect, collect-set, collect-into

Modifikace:

insert, remove, change

native! parse

Funkce parse podrobí každý element vstupu porovnání s odpovídajícím blokem pravidel. Podmínkou přechodu k ověřování dalšího vstupního elementu je úspěšné hodnocení předchozího. Funkce vrací  true, konvenují-li všechny elementy vstupní řady se zadanými pravidly, případně vrací false, pokud tomu tak není.

Nejjednodušším příkladem je prostá kontrola, zda každý element vstupního bloku je roven svému protějšku v bloku pravidel:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                         ; vstupní blok

print parse a \["fox" "dog" "owl" "rat" "elk" "cat"]      ; kontrolní blok

true

Pro větší přehlednost popisu parse, přepišme výše uvedený příklad do jiného formátu. Kontrolní blok se formálně skládá ze šesti pravidel:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]                ; input block

print parse a [   ; here the rules begin:

       "fox"        ; rule 1 matches element 1 =&gt; success

       "dog"        ; rule 2 matches element 2 =&gt; success

       "owl"        ; rule 3 matches element 3 =&gt; success

       "rat"        ; rule 4 matches element 4 =&gt; success

       "elk"        ; rule 5 matches element 5 =&gt; success

       "cat"        ; rule 6 matches element 6 =&gt; success  

]

; protože všechny konfrontace byly úspěšné, a došli jsme na konec řady

; je výsledkem "true"

true

Vstupní blok lze porovnávat i s datovými typy:

Red\[]

a:  \[33 18.2 #"c" "rat"]        ; input block

print parse a [  

       integer!        

       float!

       char!

       string!

]

true

## Do kontrolního bloku (pravidel) lze vložit běžný kód v závorce:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk"]                ; input block

print parse a [  

       "fox"

       "dog"

       "owl"

       (loop 3 \[print "just regular code here!"])

       "rat"

       "elk"  

]

just regular code here!

just regular code here!

just regular code here!

true

V pravidlech lze použít operátor logického "OR"  ( "|" ) :

Red\[]

a: \["fox" "rat" "elk"]        

b: \["fox" "owl" "elk"]        

print parse a [  

       "fox"

       \["rat" | "owl"]                ; alternativně použitelné hodnoty

       "elk"  

]

print parse b [  

       "fox"

       \["rat" | "owl"| "cat" | "whatever"]

       "elk"  

]

true

true

Obsah vstupního bloku lze upravit zadaným vypuštěním elementů:

Red\[]

a:  \["fox" "dog" "owl" "rat" "elk" "cat"]

print parse a [  

   4 skip                 ; přikázaný skok příkazem "4 skip"

       "elk"  

       "cat"    

]

true

Red\[]

a:  \["rat" "rat" "rat" "rat" "elk" "cat"]

print parse a [  

   4 "rat"            ; počet stejných prvků

       "elk"  

       "cat"    

]

true

Red\[]

a:  \["rat" "rat" "elk" "cat"]

print parse a [  

   0 4 "rat"             ; počet stejných prvků zadán přípustným rozsahem

       "elk"  

       "cat"    

]

true

Introspekce prováděného průběhu parse:

parse-trace &lt; input &gt; &lt; rules &gt;

Upřesnění funkce parse:

    /case        =&gt;

    /part         =&gt;

    /trace       =&gt;
