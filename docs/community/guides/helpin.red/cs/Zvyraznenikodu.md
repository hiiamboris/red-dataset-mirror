Original URL: <http://helpin.red/cs/Zvyraznenikodu.html>

# Zvýraznění kódu

* * *

* * *

Zvýraznění textu ve skriptu

Zvýraznění syntaxe je pro začátečníky velmi prospěšné - zejména v programovacím jazyce Red, s jeho mnoha předdefinovanými slovy a stručným kódem. Kdykoli je to možné, používám zvýrazněný kód převzatý z Notepad++.

Red \[]

                     ; mezera kvůli přehlednosti

a: "Hello"

b: 123

c: \[33 "fox"]

print c

Práce v konzole je prezentována s tmavým pozadím:

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

Uživatelský vstup je prezentován tučným písmem, odezva interpreta normálním. To pomůže předejít zbytečným chybám při kopírování kódu z prezentovaných příkladů.

Pro lepší přehlednost vkládám prázdné řádky mezi jednotlivé příkazy. Růžové komentáře jsou přidány při poslední editaci textu.

&gt;&gt; a: make hash! \[a 33 b 44 c 52]  
\== make hash! \[a 33 b 44 c 52]  
                                 
&gt;&gt; select a \[c]  
\== 52  
                                 
&gt;&gt; select a 'c  
\== 52                        ; barevně jsou označeny pozdější komentáře a doplňky
