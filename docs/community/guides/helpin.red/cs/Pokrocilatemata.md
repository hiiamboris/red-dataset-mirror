Original URL: <http://helpin.red/cs/Pokrocilatemata.html>

# Pokročilá témata

* * *

* * *

VID DLS style

Někdy je zapotřebí nadefinovat si vlastní piškot. Pro tento účel použijeme funkci style. Pěknou ukázku tohoto postupu lze nalézt (anglicky) [zde](http://red.qyz.cz/writing-style.html) .

Deklarace nového piškotu má formát: style &lt;nový název&gt; &lt;stávající piškot&gt; &lt;parametry&gt;

Red \[Needs: view]

view [

       style myface: base 70x40 cyan \[quit]

       myface "Click to quit"       ; hodnota pro aspekt text

       myface "Here too"

       panel red 90x110 [

               below

               myface "And here"

               myface "Also here" blue  ; změna hodnoty aspektu color

       ]

]

![](http://helpin.red/lib/NewItem48.png)

### function! view a unview

##### Vícero oken v obrazovce

Funkci view lze také použít k zobrazení oken, jež byla definována v jiné části kódu. Ovšemže, funkce unview zobrazení (view) ruší. Následující kód vytvoří dvě identická, ale nezávislá okna (rozdílné face trees) v různých místech obrazovky:

Red \[needs: view]

my-view: \[button {click to "unview"} \[unview]]

       ; face        string           actor

print "something"           ; do something else

print "biding my time"      ; do something else

view/options/no-wait my-view \[offset: 30x100]

view/options/no-wait my-view \[offset: 400x100]

unview s upřesněním /only se zaměří pouze na zadané okno:

Red \[needs: view]

v1: view/options/no-wait [

   backdrop blue

   button "unview blue"\[unview/only v1]

   button "unview yellow" \[unview/only v2] ]

  \[offset: 30x100]       ; option

v2: view/options/no-wait [

   backdrop yellow

   button "unview blue"\[unview/only v1]

   button "unview yellow" \[unview/only v2] ]

  \[offset: 400x100]      ; option

![](http://helpin.red/lib/unview3.png)

Upřesnění pro funkci view:

    /tight           =&gt; nulový odstup od výchozího bodu

    /options      =&gt;

    /flags          =&gt;

    /no-wait      =&gt; žádné čekání

Upřesnění pro funkci  unview:

    /all           =&gt; Zavře všechna zobrazení

    /only        =&gt; Zavře zadané zobrazení

VID DLS loose

Klíčové slovo (příslovce)  loose  umožňuje vlečení piškotu myší po okně:

Red \[needs: view]

view [

       size 150x150

       base blue 50x50 "Drag me" loose

]  ; piškot; aspekty color, size, text; příslovce

![](http://helpin.red/lib/loose2.png)

VID DLS all-over

K události on-over normálně dochází v okamžiku, když kurzor "vstupuje" nebo "opouští" plochu piškoutu. Zadáte-li flag (příslovce)  all-over , potom všechny události, k nimž dojde v situaci, kdy je kurzor v ploše piškotu (např. pohyby nebo kliknutí), generují událost  on-over.

V následující ukázce mění levý čtverec barvu pouze při  "vstupu" či "opuštění" piškotu kurzorem, avšak pravý čtverec mění barvu také při kliknutí nebo pohybu kurzoru v ploše piškotu:

Red \[needs: view]

view [

       a: base 40x40 blue

               on-over \[either a/color = red \[a/color: blue]\[a/color: red]]

       b: base 40x40 blue all-over

  ; proměnná, piškot, aspekt, aspekt, příslovce

               on-over \[either b/color = red \[b/color: blue]\[b/color: red]]

]  ; událost, aktér s variantními reakcemi

![](http://helpin.red/lib/NewItem108.png)

VID DLS hidden

Příslovce  hidden činí piškot neviditelným. Možné použití je pro vytvoření skrytého piškotu s využitým aspektem  rate (zde není použito), takže lze mít časování bez zobrazení piškotu.

Red \[needs: view]

view [

       button "I'm here"

       button "I'm not" hidden

       button "Here too"

]

![](http://helpin.red/lib/NewItem109.png)

VID DLS disabled

Příslovce  disabled deaktivuje piškot (nedojde k žádné události, dokud není enabled).

Red \[needs: view]

view [

       button "I should quit, but I don't" disabled \[quit]

       button "Quit" \[quit]

]

![](http://helpin.red/lib/NewItem110.png)

VID DLS select

Příslovce  select  označí přednastavený výběr v piškotu text-list.

Red \[needs: view]

view [

       tl: text-list 100x100 data  [

       "Nenad" "Gregg" "Qtxie"        "Rebolek"

       "Speedy G." "Myke" "Toomas"

       "Alan" "Nick" "Peter" "Carl"

       ] select 6

       \[print tl/selected]

]

![](http://helpin.red/lib/NewItem111.png)

VID DLS focus

Příslovce focus dodá implicitní zaměření označenému piškotu při prvním zobrazení okna. Zaměření může mít pouze jeden piškot. Je-li deklarováno více focusů, má implicitní zaměření ten poslední.                        

Red \[needs: view]

view [

field

field focus

field focus

field

]

![](http://helpin.red/lib/NewItem112.png)

VID DLS hint

Příslovce hint zprostředkuje textové sdělení uvnitř piškotu field. Při zadání nového obsahu (editací pole nebo aspektu face/text) stávající text zmizí.

Red \[needs: view]

view [

field

field hint "hint here"

]

![](http://helpin.red/lib/NewItem113.png)

VID DLS default

příslovce default definuje počáteční hodnotu pro aspekt data, vrací-li konverze hodnoty aspektu text hodnotu none. Aktuálně chodí pouze pro piškoty text a field.     Nepochopil.

Red \[needs: view]

view [

       a: field 100 default "My default"

       b: field 100 "My text default"   ; piškot, délka, hodnota aspektu text

       do [

               print a/text

               print a/data        ; přiřazeno příslovcem "default"

               print b/text

               print b/data        ; error: hodnota aspektu data nebyla určena

       ] ]

![](http://helpin.red/lib/NewItem114.png)

My default  
My default  
My text default  
\*\** Script Error: My has no value  
\*\** Where: print  
\*\** Stack: view layout do-safe

VID DLS with

Řekněme, že chcete vytvořit piškot s hodnotami aspektů, které se vyhodnocují při realizaci piškotu. Vyhodnocení nemůžete uskutečnit coby argumenty piškotu, tudíž je zadáte pomocí slova with .

Toto nechodí:

Red \[needs: view]

a: 2

b: 3

view [

       base a * 30x40 b * 8.20.33

]

Toto chodí:

Red \[needs: view]

a: 2

b: 3

view [

       base with [

               size: a * 30x40  

               color: b * 8.20.33

       ]

]

![](http://helpin.red/lib/NewItem116.png)

VID DLS rate

rate je aspekt s časovačem. Když časovač (timer) "tikne", generuje se událost  on-time. Pamatujte, že argumentem rate je "kolikrát za vteřinu", takže rate 20 je rychlejší než rate 5.

Tento kód způsobí blikání textu:

Red \[needs: view]

view [

       t: text "" rate 2

       on-time \[either t/text = "" \[t/text: "Blink"] \[t/text: ""]]

]

Tento kód vytvoří jednoduchou animaci, kde modrý piškot base cestuje napříč oknem:

Red \[Needs: 'View]

view[

   size 150x150

   b: base 40x40 blue "I move" rate 20

       on-time \[b/offset: b/offset + 1x1]

]

Pomalejší frekvence:

Pro časové úseky delší než 1 vteřinu, použijte pro rate argument typu time!:

Red \[Needs: view]

view[

   t: text "" rate 0:0:3

       on-time \[either t/text = "" \[t/text: "Blink" print now/time]\[t/text: "" print now/time]]

]

function! react

react je klíčové slovo (funkce), které spojuje chování jednoho piškotu s daty jiného piškotu.

Klasický příklad:

Red \[Needs: view]

view[

   progress 100x20 20% react \[face/data: s/data]

       s: slider 100x20 20%

]

Piškot progress reaguje na pohyb posuvníku piškotu slider:

![](http://helpin.red/lib/NewItem49.png)

Upřesnění funkce react

    /link         =&gt; Spojí objekty reaktivním vztahem.

    /unlink     =&gt; Zruší existující reaktivní vztah.

    /later       =&gt; Spustí reakci při příští změně.

    /with        =&gt; Určí vybraný pišktot (interní použití).

function! layout

Funkce layout se používá k vytvoření grafických útvarů bez jejich bezprostředního použití. Funkce definuje blok s popisem útvaru a s aktérem 'unview' nebo 'view'. Je aktivována pozdějším odkazem na její jméno.

Následující kód například zobrazí jedno okno a po jeho zavření zobrazí druhé:

Red \[needs: view]

my-view: layout \[button {click to "unview"} \[unview]]

print "something"           ;do something else

print "biding my time"      ;do something else

view/options my-view \[offset: 30x100]

view/options my-view \[offset: 200x100]

Zobrazení přes celou obrazovku:

Následující skript vytvoří zobrazení přes celou obrazovku :

Red \[needs: view]

view \[size system/view/screens/1/size]
