Original URL: <http://helpin.red/cs/Podminky.html>

# Podmínky

* * *

* * *

native! if

Provede blok při splnění zadané podmínky.

if &lt;test&gt; \[ block ]

&gt;&gt; if 10 &gt; 4 \[print "large"]  
large

native! unless

Totéž jako if not. Provede blok pouze při nesplnění zadané podmínky.

unless &lt;test&gt; \[ block (if test false) ]

&gt;&gt; unless 10 &gt; 4 \[print "large"]  
\== none

&gt;&gt; unless 4 &gt; 10 \[print "large"]  
large

native! either

Nový název pro klasickou podmínku if-else. Provede první blok, je-li podmínka vyhodnocena jako  true ; v opačném případě provede druhý blok.

either &lt;test&gt; \[true block] \[false block]

&gt;&gt; either 10 &gt; 4 \[print "bigger"] \[print "smaller"]  
bigger

&gt;&gt; either 4 &gt; 10 \[print "bigger"] \[print "smaller"]  
smaller

native! switch

Provede blok, odpovídající zadané hodnotě.

Red\[]

switch 20 [

       10 \[print "ten"]

       20 \[print "twenty"]

       30 \[print "thirty"]

]

twenty  
&gt;&gt;

/default

Nenalezne-li program shodu se zadáním, provede 'defaultní' blok.

Red\[]

switch/default 15 [

       10 \[print "ten"]

       20 \[print "twenty"]

       30 \[print "thirty"]

]\[ print "none of them"]        ;default block

none of them &gt;&gt;

native! case

Vyhodnotí řadu podmínek a provede blok, odpovídající prvnímu testu s hodnocením true.

Red\[]

case [

       10 &gt; 20 \[print "not ok!"]

       20 &gt; 10 \[print "this is it!"]

       30 &gt; 10 \[print "also ok!"]

]

this is it!  
&gt;&gt;

/all

Provede všechny testy s hodnotou true.

Red\[]

case/all [

       10 &gt; 20 \[print "not ok!"]

       20 &gt; 10 \[print "this is it!"]

       30 &gt; 10 \[print "also ok!"]

]

this is it!  
also ok!

native! catch &amp; throw

Catch a throw lze použít pro vytvoření složitější řídící struktury. Ve sve nejjednodušší formě obdrží catch  návratovou hodnotu z  více možností 'throw' :

Red\[]

a: 10

print catch [

       if a &lt; 10 \[throw "too small"]

       if a = 10 \[throw "just right"]

       if a &gt; 10 \[throw "too big"]

]

just right

## catch/name

## odchytí pojmenované 'throw'

## throw/name

## throws to a named catch

* * *

## Boolean branching

native! all

Vyhodnotí všechny výrazy v bloku a vrací poslední výslednou hodnotu, lze-li všechny výrazy označit jako true. Případně vrací  none, je-li některý výraz hodnocen jako false.

![](http://helpin.red/lib/all.png)

&gt;&gt; john: "boy"  
\== "boy"

&gt;&gt; alice: "girl"  
\== "girl"

&gt;&gt; all \[john = "boy" alice = "girl" 10 + 3]        ;all true, the last evaluation is returned.  
\== 13

&gt;&gt; all \[john = "boy" alice = "boy" 10 + 3]        ; alice = "boy" is false!  
\== none

native! any

Hodnotí postupně výrazy v bloku a vrací první hodnotu, která není  false. Jsou-li všechny vyhodnocené hodnoty false , vrací  none.

![](http://helpin.red/lib/any.png)

&gt;&gt; john: "boy"  
\== "boy"

&gt;&gt; alice: "girl"  
\== "girl"

&gt;&gt; any \[john = "girl"  alice = "girl"  10 + 3]        ;alice = "girl" is not false: return it!  
\== true

&gt;&gt; any \[john = "girl"  10 + 3  5 &gt; 2]                        ; 10 + 3 is not false: return it!  
\== 13
