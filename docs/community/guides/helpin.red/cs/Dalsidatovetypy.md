Original URL: <http://helpin.red/cs/Dalsidatovetypy.html>

# Další datové typy

* * *

#### Další datové typy:

* * *

#### issue!

Datový typ issue! (emise) je sekvence znaků, použitelná pro vyjádření telefonního nebo seriového čísla či čísla kreditní karty. Emise  začínají znakem  (#) a pokračují až k prvnímu oddělovači (např. k mezeře). Uvnitř emise lze použít většinu znaků s výjimkou lomítka "/".

&gt;&gt; a: #333-444-555-999  
\== #333-444-555-999

&gt;&gt; a: #34-Ab.77-14  
\== #34-Ab.77-14

#### url!

Schematické složení výrazu tupu URL je toto: &lt;protocol&gt;://&lt;path&gt;. První část uvádí komunikační protokol (http, ftp, nntp, mailto, file, ...), za lomítky je cesta k odkazované entitě.

&gt;&gt; a: read http://www.red-lang.org/p/about.html  
\== {&lt;!DOCTYPE html&gt;^/&lt;html class='v2' dir='ltr' x

#### email!

Datový typ pro uvedení emailové adresy. Zápis musí obsahovat znak @.

&gt;&gt; a: myname@mysite.org  
\== myname@mysite.org

&gt;&gt; type? a  
\== email!

#### image!

Datový typ image! je řada, která obsahuje RGB zobrazení. Podporované formáty jsou  GIF, JPEG, PNG and BMP. Obrazy se obvykle načítají ze souboru.:

&gt;&gt; a: make image! \[30x40 #{00A2E800A2E800A2E800A  ... } ]                              
&gt;&gt; a: load %heart.bmp  
\== make image! [30x20 #{00A2E800A2E800A2E800A ... } }

; S načteným objektem typu image lze manipulovat jako s řadou:

&gt;&gt; print a/size  
30x20

&gt;&gt; print pick a 1                ; getting the RGBA data of pixel 1  
0.162.232.0

&gt;&gt; poke a 1 255.255.255.0        ; changing the RGBA data of pixel 1  
\== 255.255.255.0

#### refinement!

Neboli upřesnění; indikuje variaci (za lomítkem) v použití nebo rozšíření významu funkce, objektu, jména souboru, URL nebo cesty.

&gt;&gt; block: \[1 2]          
&gt;&gt; append/only block (3 4)                          
\== \[1 2 3 4]

#### action!

Datový typ, zahrnující cca 52 funkcí, například  add , take , append, negate, ...

&gt;&gt; action? :take      ; Dvojtečka je povinná.  
\== true

Seznam  všech funkcí typu action! získáme příkazem

&gt;&gt; ? action!

#### op!

Datový typ, zahrnující funkce, které pracují jako infixové operátory, jako  + nebo \*\*.

#### routine!

Používá se pro připojení externího kódu.

#### binary!

Binární řetězce se zapisují do složených závorek s předsazeným znakem #. V tomto formátu lze uložit libovolnou sekvenci bajtů (image, audio, spustitelný soubor, komprimovaná či zašifrovaná data).

Formát binárních dat může být číslo se základem 2 (binár), 16 (hexadecimál) nebo 64 (tetrahexagesimál). Nepřítomnost číslice avizuje implicitní hexadecimální kódování se základem 16.

Příklad:

#{3A1F5A}  ; báze 16

2#{01000101101010}  ; báze 2

64#{0aGvXmgUkVCu} ; báze 64

#### event!

#### Tento datový typ pro událost  se používá v systému Red/GUI, viz   [GUI -](http://helpin.red/Introspekceudalosti.html) [Introspekce událostí](http://helpin.red/Introspekceudalosti.html).

#### function!

#### object!

#### handle!

#### unset!

#### tag!

#### lit-path!

#### set-path!

#### get-path!

#### bitset!

#### typeset!

#### error!

#### native!
