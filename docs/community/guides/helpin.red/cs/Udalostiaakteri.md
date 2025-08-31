Original URL: <http://helpin.red/cs/Udalostiaakteri.html>

# Události a aktéři

* * *

* * *

## Události - events:

Stisk klávesy na klávesnici či myši, přejíždění kurzorem přes zaměřené pole na obrazovce, výběr položky - to všechno jsou události, které lze podchytit vhodně napsanou definicí piškotu a spojit je s nějakou aktivitou - implicitně definovanou nebo uživatelsky určenou. V následující tabulce je výpis aktuálně použitelných názvů událostí:

Jméno

Prostředek

Akce

down

mouse

Stisknuté levé tlačítko myši.

up

mouse

Uvolněné levé tlačítko myši.

mid‑down

mouse

Stisknuté prostřední tlačítko myši.

mid‑up

mouse

Uvolněné prostřední tlačítko myši.

alt‑down

mouse

Stisknuté pravé tlačítko myši.

alt‑up

mouse

Uvolněné pravé tlačítko myši.

aux‑down

mouse

Stisknuté pomocné tlačítko myši.

aux‑up

mouse

Uvolněné pomocné tlačítko myši.

drag‑start

mouse

Piškot začíná být tažen.

drag

mouse

Piškot je tažen.

drop

mouse

Od tažení piškotu bylo upuštěno.

click

mouse

Klik levým tlačítkem myši (pouze pro button).

dbl‑click

mouse

Dvojklik levým tlačítkem myši.

over

mouse

Kurzor myši přechází přes piškot. K této události dochází nejprve když kurzor vstupuje na piškot a poté když jej opouští. Pokud aspekt flags obsahuje flag all‑over, potom jsou rovněž produkovány všechny mezilehlé události.

move

mouse

Došlo k pusunu okna.

resize

mouse

Byla změněna velikost okna.

moving

mouse

Okno je posouváno.

resizing

mouse

Mění se velikost okna.

wheel

mouse

Otáčí se kolečko myši.

zoom

touch

A zooming gesture (pinching) has been recognized.

pan

touch

A panning gesture (sweeping) has been recognized.

rotate

touch

A rotating gesture has been recognized.

two‑tap

touch

A double tapping gesture has been recognized.

press‑tap

touch

A press-and-tap gesture has been recognized.

key‑down

keyboard

Stisknutá klávesa klávesnice.

key

keyboard

Byl zadán znak nebo stisknuta speciální klávesa (kromě kláves Ctrl, Shift a Menu).

key‑up

keyboard

Uvolněná klávesa klávesnice.

enter

keyboard

Stisknutá klávesa Enter.

focus

any

Piškot právě přešel do režimu focus.

unfocus

any

Piškot právě ztratil focus.

select

any

V piškotu je prováděn výběr z více možností

change

any

V piškotu došlo ke změně v důsledku vstupu uživatele  (vložení textu nebo výběr ze seznamu).

menu

any

Výběr položky z menu.

close

any

Zavření okna.

time

timer

Proběhla prodleva, nastavená aspektem rate piškotu.

Některé události jsou definičně spojeny s daným piškotem, případně aspektem (například aspekt rate má časovač on-time). Každý piškot je schopen akceptovat jenom vymezenou sadu událostí. Uživatelsky definované připojení události k piškotu se provádí za výčtem aspektů:

![](http://helpin.red/lib/eventlayout.png)

Příklady některých událostí

Všechny příklady si vyzkoušejte v konzole. Termín např. on-down je spojení obecné předpony on- a názvu události z tabulky.

down, over :

Red \[needs: view]

view [

       t: area 40x40 blue

       on-down \[quit]

       on-over \[either t/color = red \[t/color: blue]\[t/color: red]]

]

wheel :

Red \[needs: view]

list: \["first" "second" "third" "fourth"]

view [

       t: text "Place your cursor over here and roll the wheel"

               on-wheel [

                       t/text: first list

                       list: next list

                       if tail? list \[list: head list]

               ]                

]

key-down :

Red \[needs: view]

list: \["key" "another key" "one more key"]

view [

       below

       text "Click inside field and press a key"

       t: text 100

       a: field

               on-key-down [

                       t/text: first list

                       list: next list

                       if tail? list \[list: head list]

               ]

]

![](http://helpin.red/lib/NewItem47.png)

time :

V tomto příkladě bliká zadaný text zadanou frekvencí (zde jednou za vteřinu - viz kapitola [GUI- Pokročilá témata](http://helpin.red/Pokrocilatemata.html)):

Red \[needs: view]

view [

       t: text "Now you see..." rate 1

               on-time \[either t/text = "" \[t/text: "Now you see..."]\[t/text: ""]]

]

close :

\- událost okna (kontejneru) - při zavření okna se má v konzole vytisknout "bye!" - (ale nevytiskne)

Red \[needs: view]

view [

       button \[print "click"]

    on-close \[print "bye!"]        

]

### Aktéři - actors

Slovo actors (aktéři) je název jednoho z aspektů a rovněž společné označení funkcí pro ošetření událostí. Tyto funkce jsou definovány v bloku za návěstím  on-&lt;event&gt; . Výpis případných událostí je uveden v tabulce na začátku této kapitoly.

Red \[Needs: view]

view [

       t: area 40x40 blue on-down \[print t]    ;click to quit

       on-over \[either t/color = red \[t/color: blue]\[t/color: red]]

]

Spuštění tohoto kódu v konzole je doprovázeno obsáhlým tiskovým výstupem. Ke konci tohoto výstupu vidíme deklaraci hodnoty aspektu actors:

(...)

edge: none

para: none

font: none

actors: make object! [

   on-down: func \[face \[object!] event \[event! none!]]\[print t]

   on-over: func \[face \[object!] event \[event! none!]]\[either t/color = red \[t/color: blue] \[t/color: red]]

]

extra: none

draw: none

(...)

Tiskový výstup do konzoly reprezentuje vnitřní náhled interpreta na skladbu realizovaného kontejneru. Jde o výpis všech aspektů (type, offset, size, text, image, color, menu, data, enabled?. visible?, selected, flags, options, parent, pane, state, rate, edge, para, font, actors, extra a draw) i s příslušejícími hodotami.

Vidíme, že první aspekt parent má ve svém definičním bloku rovněž kompletní  sestavu aspektů, stejně jako jeho zanořený další aspekt parent.

Poznámka:

- Dotekové (touch) události nejsou realizovatelné ve Windows XP.
- Jedna či více pohybových událostí vždy předchází událost move.
- Jedna či více událostí měnících rozměr vždy předchází událost resize.
