Original URL: <http://helpin.red/cs/Objekty.html>

# Objekty

* * *

* * *

Objekt je kontejnér, který sdružuje data či funkce a je (téměř vždy) přiřazený ke slovu (proměnné). Pro přístup k atributu objektu používáme lomítko (neboli formát podobný cestě). Tímto se Red liší od většiny jazyků, které v podobných situacích používají tečku.

#### Vytvoření objektu:

action! make object! , function! context  a  function! object

K vytvoření objektu použijeme příkaz  make object! nebo jeho kratší varianty object případně  context.

Red \[]

myobject: object [

       x: 10

       y: 20

       f: function \[a b] \[a + b]

       name: none

       tel: none   ]

myobject/name: "Dimitri"

myobject/tel: #3333-3333

print myobject/x

print myobject/y

print myobject/f 3 5

print myobject/name

print myobject/tel

10

20

8

Dimitri

3333-3333

Vyhodnocení výrazu se provede pouze při deklaraci objektu (constructor code). Zde například příkaz 'print' je posléze nepřístupný.:

&gt;&gt; myobject: object \[print "hello" a: 1 b: 2]  
hello  
\== make object! [  
       a: 1  
       b: 2  
]  
&gt;&gt; myobject/a  
\== 1

#### Reference 'self':

Má-li objekt odkazovat sám na sebe, použijeme specielní klíčové slovo self :

Red \[]

myobject: object [

       x: 10

       y: 20

       f: function \[a b] \[a + b]

       autoanalisys: does \[print self]

]

myobject/autoanalisys

x: 10

y: 20

f: func \[a b]\[a + b]

autoanalisys: func \[]\[print self]

#### Klonování objektu a dědění:

Pouhé přiřazení objektu k jinému jménu vytváří pouhou kopii ukazovátka (pointer) na tento objekt. Změní-li se originál, změní se i jeho prezentace v jiném objektu:

&gt;&gt; a: object \[x: 10]        ; odezva konzoly zde není uvedena  
&gt;&gt; b: a                                ; odezva konzoly zde není uvedena  
&gt;&gt; a/x: 20  
\== 20

&gt;&gt; b/x  
\== 20                                ; rovněž změněno! b je závislá kopie

K vytvoření nezávislé kopie objektu použijeme slovo  copy:

&gt;&gt; a: object \[x: 10]        ; odezva konzoly zde neuvedena  
&gt;&gt; b: copy a                        ; odezva konzoly zde neuvedena  
&gt;&gt; a/x: 20  
\== 20  
&gt;&gt; b/x  
\== 10                                ; žádná změna! b je nezávislá kopie

Chceme-li vytvořit nový objekt, který dědí z jiného objektu, použijeme sekvenci: make zdroj \[nová specifikace]:

Red \[]

a: object \[x: 3]        ; deklarace zdrojového objektu

b: make a \[y: 12]       ; nový objekt

print b

x: 3

y: 12

### find a select - pro objekty

find zkontroluje, zda zadané pole existuje  a vrací true nebo none 

select provádí totéž ale pokud zadané pole existuje, vrací jeho hodnotu

Red \[]

obj: object \[a: 44]

print find obj 'a

print select obj 'a

print find obj 'x

print select obj 'something

true

44

none

none

Přípustný formát zadávaného pole je lit-word! ('word). Hodnotu proměnné lze evokovat příkazem  obj/a.
