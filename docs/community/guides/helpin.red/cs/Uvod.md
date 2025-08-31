Original URL: <http://helpin.red/cs/Uvod.html>

# Úvod

* * *

* * *

O programovacím jazyku Red

- Red je programovací jazyk, který se se vším všudy vejde do jednoho spustitelného souboru o velikosti asi 1 MB. Žádná instalace, žádné sestavování.
- Red je 'free' a 'open-source'.
- Red je interpretovaný jazyk ale můžete svůj kód kompilovat a generovat samostatnou prováděčku.
- Red si před interpretací část kódu kompiluje, takže je docela rychlý.
- Red je jednoduchý. Jeho kód je čistý a stručný.
- Red je aktuálně (duben 2018) ve fázi 'alfa' ale má ambiciózní cíle:
  
  - býti multi-platformní;
  - míti nativní systém GUI s UI dialektem;
  - býti multi-úrovňový (full-stack) programovací jazyk.
- Red je 'open-source' pokračováním jazyka Rebol, vytvořeného tvůrcem Amigy - Carlem Sassentarhem. Chcete-li si vyzkoušet některé procedury, které nejsou zatím v Redu zavedeny, můžete si je vyzkoušet v instalovaném Rebolu.
- Red je vyvíjen skupinou lidí pod vedením Nenada Rakocevice.
- V poslední době  posbíral Red nemalý fond z ICO a v Paříži byla ustavena společnost Red Foundation, takže je naděje že tu Red s námi chvíli pobude.

Ukázka Redu:

Red \[needs: view]

view [

   f1: field "First name"

   f2: field "Last name"

   button "Greet Me!" [

       t1/text: rejoin \["Have a very nice day " f1/text " " f2/text "!"]

   ]

   return

   t1: text "" 200

]

![](http://helpin.red/lib/NewItem53.png)

Pokud vás to zaujalo, můžete nahlédnout do [Short Red Examples](http://redprogramming.com/Short%20Red%20Code%20Examples.html) od Nicka Antonaccia, případně do českého překladu prozatimní oficiální dokumentace [Programovací jazyk Red](https://doc.red-lang.org/cs/)[.](https://doc.red-lang.org/cs/)

Introductory notes by Ungaretti:

This is an evolution of the [Red Language Notebook](https://www.gitbook.com/book/ungaretti/red-language-notebook/details).  
I chose to use [HelpNDoc](https://www.helpndoc.com/) software to develop a more friendly and useful interface.

Notes:

- I use Windows, so this work is based on this Operating System.
- I'm not an experienced or even a good Red programmer, in fact, I'm not a programmer at all.
- English is not my native language.
- This isn't a complete reference for the Red language (yet?).
- I did not use the best coding style in many examples. Please, take a look at [Red's coding style guide](https://doc.red-lang.org/v/v0.6.0/Coding-Style-Guide.html).
- I try to make my work original, but some text was copied and pasted from [Red's official documentation](https://doc.red-lang.org/en/) and I based some examples on what I found at:

<!--THE END-->

- - [red-by-example.org](http://www.red-by-example.org/index.html)[](https://ungaretti.gitbooks.io/red-language-notebook/content/www.red-by-example.org)by Arie van Wingerden and Mike Parr
  - [mycode4fun.com.uk](http://www.mycode4fun.co.uk/red-beginners-reference-guide) by Alan Brack
  - [redprogramming.com](http://redprogramming.com/Home.html) by Nick Antonaccio

Also, a lot of help came from the Red community at [gitter.im/red/home](https://gitter.im/red/home)

Nezbytná poznámka překladatele:

Mám zato, že programátor nebo zájemce o programování  musí alespoň částečně umět anglicky a mít znalost alespoň nezbytné zásoby anglických slov.

Vycházeje z tohoto předpokladu, pokusím se některé termíny nepřekládat, pokud budou rozumně použitelné v české větě.

Přivítám pomoc při překladu termínu face (tvář), pro který jsem použil výraz piškot, jenž některé Redisty (Rebolisty) poněkud irituje. Slovo face zde nemá s tváři mnoho společného, neboť je to zkrácenina slova interface. Face i interface mi nepřijdou jako označení pro daný objekt jednoznačně přiléhavá a proto se jich nedržím. Alternativní označení k face je widget, jež se mi líbí ale špatně se s ním v české větě pracuje. Také se mi líbí slovo grafion. Tož uvidíme.

Použítí upraveného editoru Notepad ++ vřele doporučuji - spolu s interaktivní konzolou Redu  v aplikaci [Console](https://sourceforge.net/projects/console-devel/files/console-releases/2.0b148a/) [2](https://sourceforge.net/projects/console-devel/files/console-releases/2.0b148a/) pro jednodušší příklady.
