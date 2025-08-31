Original URL: <http://helpin.red/cs/Faces.html>

# Faces

* * *

## GUI - Piškoty (faces)

* * *

Piškoty neboli faces (neboli widgets), jsou základní stavební kameny grafického rozhraní.  Interní součástí každého piškotu je sada 23 aspektů (facets), jimiž jsou určovány jednotlivé parametry piškotu. Těmito parametry je určován nejen vzhed piškotů, ale i jejich odezva na různé události a souvislost s jinými piškoty.

Seznam aspektů (facets)

Facet

Datatype

Povinné?

Použití

Popis

type

word!

yes

all

Typ grafické komponenty

offset

pair!

yes

all

Ofset reflektovaného kurzoru od počátku vlevo nahoře

size

pair!

yes

all

Velikost piškotu

text

string!

no

all

Popisek, zobrazený v piškotu

image

image!

no

some

Obraz na pozadí piškotu

color

tuple!

no

some

Barva pozadí ve formátu R.G.B nebo R.G.B.A.

menu

block!

no

all

Lišta menu nebo kontextuální nabídky.

data

any-type!

no

all

Data o piškotu.

enable?

logic!

yes

all

Povolit nebo zakázat události v piškotu

visible?

logic!

yes

all

Zobrazit či skrýt piškot.

selected

integer!

no

some

Index aktuálně vybraného elementu seznamu.

flags

block!, word!

no

some

Klíčová slova, měnící zobrazení nebo chování piškotu.

options

block!

no

some

Další vlastnost piškotu ve formátu \[name: value]

parent

object!

no

all

Odkaz na rodičovský piškot, pokud existuje.

pane

block!

no

some

Seznam dětí, zobrazených uvnitř piškotu.

state

block

no

all

Info o interním stavu piškotu (pouze u View engine).

rate

integer!, time!

no

all

Časovač piškotu. Integer udává frequenci, time udá- vá trvání, none zastavuje.

edge

object!

no

all

(reserved for future use)

para

object!

no

all

Pokyny pro umístění textu.

font

object!

no

all

Nastavení atributů fontu

actors

object!

no

all

Uživatelsky vytvořené ovladače událostí.

extra

any-type!

no

all

Volitelná uživatelská data připojená k piškotu.

draw

block!

no

all

Seznam příkazů Draw, jež mají být provedeny.

#### Datové typy hodnot aspektů:

Hodnoty aspektů se zadávají přímo, bez uvedení jejich určení, které interně provádí interpret na základě jejich datového typu.

Datový typ

Aspekt

Účel použití

integer!

rate, selected

Určuje šířku piškotu, výška zůstává implicitní. U panelů udává počet řad či sloupců.

pair!

offset, size

Určuje šířku a výšku piškotu.

tuple!

color

Určuje barvu pozadí piškotu ve formátu rgb, např. 211.9.84.

issue!

color

Určuje barvu pozadí piškotu použitím hexadecimálního zápisu,   například #d30954.

word!

color

Určuje barvu pozadí piškotu slovem, např. aqua

string!

text

Určuje text, zobrazovaný piškotem.

percent!

Nastavuje aspekt data (užitečné pro piškoty  progress a slider).

logic!

Nastavuje aspekt data (užitečné pro piškoty check a radio).

image!

image

Nastavuje obrázek, zobrazený jako pozadí piškotu.

url!

Načte zdroj, na nějž URL ukazuje.

block!

Udává akci pro implicitní či deklarovanou událost piškotu. U panelů určuje obsah.

get-word!

Jako aktéra používá existující funkci.

time!

Určuje časový úsek delší než 1 sec v aspektu rate

Příklad aplikace aspektů:

Red \[needs: view]

view [

       base "HELLO!" 130x100 %balloon.jpeg   ; base je piškot, následují hodnoty  aspektů text, size, image

]

(soubor %baloon.jpeg musí být uložen ve stejném adresáři jako prováděčka red.exe)

![](http://helpin.red/lib/NewItem22.png)

#### Atributy aspektu font

Aspekt font má 9 předdefinovaných formátovacích atributů: name, size, style, angle, color, anti-alias?, shadow, state, parent. Prostřednictvím atributu parent mohou na daný aspekt odkazovat i jiné piškoty.

Při deklaraci se název atributu uvádí za pomlčkou, například font-name.

Pole

Datový typ

Povinné?

Popis

\- name

string!

ne

Název fontu, instalovaného v OS

\- size

string!

ne

Velikost fontu v bodech (points)

\- style

word!, block!

ne

Styly fontů:                                                      bold, italic, underline a strike

\- angle

integer!

ano

Sklon textu ve stupních

\- color

tuple!

ano

Barva fontu ve formátu RGB nebo RGBA

\- anti-alias?

logic!, word!

ne

Režim vyhlazení

\- shadow

(reserved)

ne

(reserved for future use)

\- state

block!

ne

Interní stav piškotu (pouze ve View)

\- parent

block!

ne

Interní odkaz na rodičovský piškot

Příklad použití:

Red \[needs: view]

view [

       text "hello" font-name "algerian" font-size 18 font-color red bold

       text "hello" font-name "algerian" font-size 18 font-color blue

       text "hello" font-name "broadway" font-size 15 font-color green strike

       text "hello" font-name "arial" font-size 12 font-color cyan underline

]  ; piškot, aspekt, atributy fontu, příslovce

![](http://helpin.red/lib/NewItem26.png)

#### Klíčová slova (keywords):

Klíčovými slovy (typu word!) se přiřazují slovní hodnoty různým aspektům (text, extra, data, draw, font, para, select) Jsou to tato slova:

left, center, right, top, middle, bottom, bold, italic, underline, strike, extra, data, draw, font, para, wrap, no-wrap, font-size, font-color, font-name, react, loose, all-over, hidden, disabled, select, focus, hint, rate, default.

Případně slouží jako hodnoty upřesnění při formování piškotu (window):

- /flags   ::  modal, resize, no-title, no-border, no-min, no-max, no-buttons, popup
- /options:: on-(enter, change, select, key)

Aktéři - actors

Slovo actors (aktéři) je název jednoho z aspektů a rovněž společné označení funkcí pro ošetření událostí.  Aktér (actor) je funkce, která popisuje aktivitu piškotu při výskytu jisté události - viz [další kapitola](http://helpin.red/Udalostiaakteri.html).

Piškoty - faces

Knihovna view disponuje těmito piškoty: area, base, button,  camera, check, drop-down, drop-list,  field, group-box,  panel, tab-panel,  progress, radio, slider, screen,  text, text-list, window, . Jednotlivé piškoty jsou v následujcím textu podrobněji popsány.

Rozšířením piškotu text jsou piškoty h1 až h5, rozšířením piškotu base jsou piškoty box a image.

Nejvýše postaveným objekty jsou diskrétní piškoty screen a window. Tyto piškoty se nedají samostatně deklarovat. Jsou však automaticky přítomny při každé vizualizaci bloku funkcí view, například i  prázdného:

Red \[needs: view]        ; "needs: view" je potřebné pouze při kompilaci skriptu

view \[]

![](http://helpin.red/lib/empty.png)

Aktivita piškotů

Většina piškotů (vyjímaje screen a window) si ví rady s výskytem nějaké události. Tou událostí může být kliknutí myší klávesy, stisknutí klávesy na klávesnici nebo provedení výběru. Výpis těchto událostí je uveden na počátku další kapitoly. Implicitně nastavené události (ovladače) jsou dále uvedeny u každého piškotu.

Pro tlačítka (buttons) je touto implicitně ošetřenou událostí stisk levé klávesy myši  (down) a v následující ukázce spouští příkaz  quit, který končí program. Místo funkce \[quit] lze použít  například  \[print "Tornado Loo"].

Red \[needs: view]

view [

       button 50x40 "click me" \[quit] ; piškot, aspekt, aspekt, aktér

]

![](http://helpin.red/lib/NewItem28.png)

Citlivost piškotu na událost se projeví jen v tom případě, je-li deklarace piškotu doplněna blokem s názvem definované funkce nebo s definicí uživatelské funkce - neboli aktérem.

Přehled piškotů

     base (on-down)

Piškot base  bez parametru zobrazí uvnitř piškotu window (jehož rodičem je piškot screen) tmavošedý (128.128.128) čtverec (80x80 px) bez ohraničení.

Red \[needs: view]        

view [

       base

]

![](http://helpin.red/lib/NewItem21.png)

     button (on-click)

Red \[needs: view]

view [

       button

]

![](http://helpin.red/lib/NewItem27.png)

#### check (on-change)

Piškot reaguje na změnu stavu zatržení uživatelem.

Red \[needs: view]

view [

       check

]

![](http://helpin.red/lib/NewItem30.png)

Aktuální stav zatržítka je uložen v aspektu data (true nebo false)

![](http://helpin.red/lib/check2.png)

     radio (on-change)

Událost, registrující u piškotu vstup textu nebo výběr ze seznamu, se nazývá change.

Při každé volbě (zde on, off, uh?) umožní realizaci příslušného aktéra - příslušného bloku.

Piškoty radio tvoří obsah kontejneru window. V kontejneru může být zatrženo pouze jedno výběrové tlačítko radio.

Red \[needs: view]

view [

       r1: radio "on" \[t/text: "on"]

       t: text "none"     ; jen před první volbou

       return

       below

       r2: radio "off" \[t/text: "off"]

       r3: radio "uh?" \[t/text: "uh?"]

]  ; proměnná, piškot, aspekt, aktér

![](http://helpin.red/lib/NewItem31.png)

     field (on-enter)

Piškot field slouží k vložení textu.

Text v poli piškotu field je uložen v aspektu data. Chodí to však obojím směrem. Změníte-li obsah aspektu data (.../data value), změní se zobrazený text v poli.

Red \[needs: view]

view [

       field

]

![](http://helpin.red/lib/NewItem32.png)

V této ukázce se vytiskne zápis v poli do konzoly při (každém) stisku Enter:

Red \[needs: view]

view [

       f: field \[print f/text]

]  ; proměnná, piškot, aktér

Piškot field podporuje flag no-border :

Red \[needs: view]

view \[field no-border]

![](http://helpin.red/lib/NewItem33.png)

     area (on-change)

Text uvnitř piškotu area  je uložen v aspektu text. Do zobrazeného okna lze psát víceřádkový text:

Red \[needs: view]

view [

       area

]

![](http://helpin.red/lib/NewItem34.png)

Živější aplikaci vytvoříme připojením aktéra \[print a/text], který tiskne aktuální obsah aspektu text do konzoly.  Aktér je aktivován stiskem každé klávesy na klávesnici, včetně příkazu Enter:

![](http://helpin.red/lib/area2.png)

     text-list (on-change)

Procházené řetězce jsou uloženy v aspektu data. Index vybraného řetězce je v aspektu selected:

Red \[needs: view]

view [

       tl: text-list 100x100 data[

       "Nenad" "Gregg" "Qtxie"        "Rebolek"

       "Speedy G." "Myke" "Toomas"

       "Alan" "Nick" "Peter" "Carl"]

       \[print tl/selected ]

]

![](http://helpin.red/lib/NewItem35.png)

3     ; index vybrané položky se vytiskne do konzoly      

===

To use the string selected, the code snippet could be:  nevím, jak to připojit

pick face/data face/selected

   \[ t/text: pick face/data face/selected ] viz drop-down

This would be the same as : pick \["Nenad" "Greg" "Qtxie" "Rebolek" (...)] 3

===

     progress (on-change)

Aktuální stav posuvníku je uložen v aspektu data, jako hodnota typu percent! nebo float! v rozsahu mezi 0 a 1.

Red \[needs: view]

view [

       below

       text "Enter float"

       text "0 - 1 (float):"

       field \[p/data: to percent! face/data]

       p: progress

]

![](http://helpin.red/lib/NewItem36.png)

     slider (on-change)

Aktuální procentní hodnota je uložena v aspektu data jako datový typ percent! nebo float!.

Red \[needs: view]

view [

       title "slider"

       t: text "Percentage"

       slider 100x20 data 10% \[t/text: to string! face/data]

]    ; označení aspektu 'data' je nadbytečné ale užitečné pro porozumnění kódu        

Pohybem jazýčku měníte hodnotu procenta. Implicitně nastavená hodnota je 10% :

![](http://helpin.red/lib/NewItem38.png)

Všimneme si zde, jak je zadána hodnota aspektu data. V tomto případě by šlo slovo 'data' vynechat - na rozdíl od deklarace piškotu text-list, kde přiřazovanou hodnotou k aspektu data byl blok.

     panel (on-down)

Vytváří společný piškot (uvnitř piškotu window a screen) pro umístění dalších piškotů.

Red \[needs: view]

view [

       panel red \[size 100x120 below text "Panel 1" check button "Quit 1" \[quit]]

       panel gray \[size 100x120 below text "Panel 2" check button "Quit 2" \[quit]]

]  

![](http://helpin.red/lib/NewItem39.png)

     group-box (on-down)

Group-box je kontejner podobný kontejneru panel. Rovněž slouží pro umístění dalších piškotů. Uvažuje se, že se zruší po zavedení aspektu edge.

Red \[needs: view]

view [

       group-box \[size 110x120 below text "box1" check button "Quit 1" \[quit]]

       group-box gray \[size 110x120 below text "box2" check button "Quit 2" \[quit]]

]

![](http://helpin.red/lib/group-box.png)

     tab-panel (on-select)

Vytvoří sadu karet s oušky, formou překrývajících se panelů v piškotu window. Každý panel může obsahovat více piškotů. Informace o sestavě jsou uloženy v těchto aspektech:

&lt;tab-panel&gt;/data - blok s názvy oušek (string!).  
&lt;tab-panel&gt;/pane - odkaz na dětské piškoty (block!).  
&lt;tab-panel&gt;/selected - index vybraného panelu nebo hodnota none .

Na rozdíl od piškotu group-box je piškot tab-panel expilicitně deklarován jen jednou:

Red \[needs: view]

view [

       Title "Tab-panels"

       tab-panel 200x100 [

               "Tab 1 " \[text "First panel"]

               "Tab 2 " \[text "Second panel"]

               "Tab 3 " \[text "Third panel"]

       ]

]

![](http://helpin.red/lib/NewItem40.png)

Ukázka karty s více piškoty:

Red \[needs: view]

view [

       Title "Tab-panels"

       tab-panel 110x140 [

               "Tab 1 " [

               below

               text font-color blue "First panel"

               button "quit" \[quit]

               check "check to quit" \[quit]

               ]

               "Tab 2 " \[text "Second panel"]

       ]

]

![](http://helpin.red/lib/NewItem41.png)

     drop-down (on-select, on-change, on-enter)

Roletka s vertikálním seznamem řetězců. Aspekt  data příjímá jakékoli hodnoty ale pouze řetězce jsou přidávány do seznamu a zobrazeny. Neřetězcové hodnoty lze použít pro vytvoření asociativních řad (arrays) s použitím řetězců jako klíčů.

Aspekt  selected obsahuje celočíselný index vybrané položky. Aspekt  text obsahuje aktuálně vybranou položku. Zobrazí se při stisku Enter.

Red \[needs: view]

view [

         t: text "--&gt;"

         drop-down "Choose one" data [     ; piškot, aspekt text, aspekt data

                "First" "Second" "Third" ] [

       t/text: pick face/data face/selected ]                    ; aktér

    ]        

![](http://helpin.red/lib/NewItem45.png)

     drop-list (on-change)

Stejné jako drop-down, akorát že se nezobrazí řetězec aspektu text a název položky se projeví hned po jejím výběru v roletce.

![](http://helpin.red/lib/droplist.png)

     text (on-down)

Piškot text  je autonomní entita s rodiči window a screen  (případně panel, případně jiný piškot).

Red \[needs: view]

view [

       text "Hello"        ; piškot text plus hodnota aspektu text

]

![](http://helpin.red/lib/NewItem24.png)

     camera (on-down)            Nutno doplnit komentář

     box (on-down)        image (on-down)

Piškoty box a image jsou variantami piškotu base (type: ´base).

box  bez parametru vymezí v nadřazeném piškotu window transparentní čtverec (80x80 px) bez ohraničení

image  bez parametru vymezí v nadřazeném piškotu window bílý čtverec (100x100 px) bez ohraničení. Image s odkazem na soubor vrátí zobrazení tohoto souboru.

Red \[needs: view]        

view [

       base

       box

       image

       image %smallballoon.jpeg

]

![](http://helpin.red/lib/NewItem139140.png)

     h1 až h5 (on-down)

Piškoty[](http://helpin.red/Pokrocilatemata.html)h1, h2, h3, h4 a h5 jsou variantami piškotu text (type: ´text).

Red \[needs view]

view [

       below

       h1 "Hello"

       h2 "Hello"

       h3 "Hello"

       h4 "Hello"

       h5 "Hello" \[print "Halali"]    ; jediný aktivní piškot

]

![](http://helpin.red/lib/NewItem25.png)

Introspekcí kódu lze zjistit, že i tyto piškoty jsou deklarovány stejnými sadami 23 aspektů, stejně jako základní piškoty.

#### Aspekt text

Aspekt text je pole piškotu pro uložení textu.

Red \[needs: view]        

view [

       button "hello"               ; piškot button plus hodnota aspektu text

       button "bold" bold           ; dtto plus klíčové slovo

       button "underline" underline

       button "strike" strike

       return

       button "top" 70x70 top       ; hodnoty aspektů text, size plus keyword

       button "middle" 70x70 middle ; dtto

       button "bottom" 70x70 bottom

       return

       button "left" 70x70 left

       button "center" 70x70 center

       button "right" 70x70 right

       return

       button "mix1" 70x70 top left

       button "mix2" 70x70 top center

       button "mix3" 70x70 top right

       return

       button "No" 70x70 right bold       ; right nechodí!

]

![](http://helpin.red/lib/NewItem23.png)

#### Aspekt color

K zadání barvy pozadí slouží aspekt color. Jeho hodnotu lze zadat jako literál ve formátu word! (např. aqua) nebo tuple! (0.255.255) či issue! (#00ffff) - bez uvedení názvu aspektu. V následující ukázce vidíme deklaraci 32 piškotů base uvnitř automaticky generovaného piškotu window:

Red \[needs: view]

view [

       base 30x30 aqua  text "aqua"       base 30x30 beige text "beige"  

       base 30x30 black text "black"     base 30x30 blue   text "blue"                

       return

       base 30x30 brick text "brick"      base 30x30 brown text "brown"  

       base 30x30 coal text "coal"       base 30x30 coffee   text "coffee"              

       return

       base 30x30 crimson text "crimson"  base 30x30 cyan text "cyan"    

       base 30x30 forest text "forest"   base 30x30 gold text "gold"                  

       return

       base 30x30 gray text "gray"        base 30x30 green text "green"  

       base 30x30 ivory text "ivory"     base 30x30 khaki text "khaki"                  

       return

       base 30x30 leaf text "leaf"        base 30x30 linen text "linen"  

       base 30x30 magenta text "magenta" base 30x30 maroon  text "maroon"              

       return

       base 30x30 mint text "mint"        base 30x30 navy text  "navy"    

       base 30x30 oldrab text "oldrab"   base 30x30 olive text "olive"                  

       return

       base 30x30 orange text "orange"    base 30x30 papaya text "papaya"

       base 30x30 pewter text "pewter"   base 30x30 pink text "pink"                  

       return

       base 30x30 purple text "purple"    base 30x30 reblue text "reblue"

       base 30x30 rebolor text "rebolor"  base 30x30 red text "red"

]

Dostaneme tuto pěknou paletu. Kdybychom popis barev v uvozovkách použili bez anotace text, šlo by o aplikaci aspektu text a popisky by byly uvnitř barevných polí. Takto jde o deklaraci piškotu text se zadanou hodnotou aspektu text.

#### ![](http://helpin.red/lib/NewItem29.png)

Dynamická změna aspektů

Při běhu programu lze měnit hodnoty jejich aspektů (facets):

![](http://helpin.red/lib/button3.png)

Všimněte si, že při deklaraci jednotlivých aspektů piškotu zadáváme přímo jejich příslušné hodnoty (50x20 "click me"), zatímco při změně hodnot (zde v hranatých závorkách) uvádíme rovněž název příslušného aspektu (b/text: "Ouch!"), přičemž můžeme uplatnit i aspekt původně nepoužitý (t/color: red), případně můžeme odkázat na aspekt jiného piškotu, například:

   b: button 50x20 "click me" \[b/text: "Au!" t/size: 60x50]     ;vyzkoušejte si to

 Na objekt piškotu se lze také odkázat slovem face/&lt;attribute&gt;:

![](http://helpin.red/lib/button4.png)
