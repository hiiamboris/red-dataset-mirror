Original URL: <http://helpin.red/cs/Reaktivniprogramovani.html>

# Reaktivní programování

* * *

* * *

Reaktivní programování je pěkně popsané v oficiální [dokumentaci](https://doc.red-lang.org/cs/reactivity.html).

Reaktivní programování vytváří interní mechanizmus, který automaticky aktualizuje stav objektu A při změně objektu B - bez volání funkcí či subrutin.

Red používá objektově orientovaný [reaktivní model](https://en.wikipedia.org/wiki/Reactive_programming#Object-oriented) [push](https://en.wikipedia.org/wiki/Reactive_programming#Object-oriented)[.](https://en.wikipedia.org/wiki/Reactive_programming#Object-oriented)

Reaktor je reaktivní objekt, jehož změna spustí změny v jiných objektech. Vytváří se příkazem  make reactor!.

Reaktivní vztah (statický nebo dynamický) je deklarace vztahu mezi příslušnými poli reaktivně propojených objektů. Vytváří se funkcemi is nebo react .

Příkaz make reactor! a funkce is

Velmi bazální příklad použití reaktivního programování:

Red\[]

a: make reactor! \[x: ""]        ;reaktor

b: is \[a/x]                                ;reaktivní vztah

forever [

       a/x: ask "? "                ;here we input a value for x field of 'a'

       print b                        ;here we print b and... surprise! it changed!

]                       ; Pozor, vytváří nekonečnou smyčku!

?house

house

?fly

fly

?bee

bee

Reaktor může aktualizovat sám sebe:

Red\[]

a:  make reactor! \[x: 1 y: 2 total: is \[x + y]]

forever [

       a/x: to integer! ask "?"

       print a/total

]                          ; Pozor, vytváří nekonečnou smyčku!

?33

35

?45

47

deep-reactor!

Stejně jako má copy upřesnění /deep pro přístup k zanořeným hodnotám (bloky uvnitř bloku), totéž má i reactor!.

Tento program má opakovat vstup z konzoly ale jaksi nechodí:

Red\[]

a: make reactor! \[z: \[x: ""]]

b: object \[w: is \[a/z/x]]

b/w: "no change"

forever [

       a/z/x: ask "?"

       print b/w

]

?house  
no change  
?blue  
no change

Pokud však použijeme deep-reactor!:

Red\[]

a: make deep-reactor! \[z: \[x: ""]]

b: object \[w: is \[a/z/x]]

b/w: "no change"

forever [

       a/z/x: ask "?"

       print b/w

]

?house  
house  
?blue  
blue

function! react

Toto je příkaz pro vytváření reaktivních grafických aplikací GUIs. Nahlédněte prosím do [GUI-Pokročilá témata](http://helpin.red/Pokrocilatemata.html).

function! clear-reactions

Odstraní bezpodmínečně všechny definované reakce.

function! react?

Zjistí, zda je pole objektu reaktivním zdrojem . Pokud ano, vrátí se první reakce, nalezená jako zdroj v poli objektu; pokud ne, vrací se hodnota note. Upřesnění /target kontroluje, zda je pole cílem místo zdrojem a vrátí první reakci, zacílenou na toto pole nebo vrátí none při absenci shody.

    /target      =&gt; kontroluje, jde-li o cíl (target) a ne zdroj (source).

function! dump-reactions

Vytvoří seznam registrovaných reakcí pro ladící účely.
