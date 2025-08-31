Original URL: <http://helpin.red/cs/Exekucekodu.html>

# Exekuce kódu

* * *

* * *

Spuštění exekuce

Svůj skript můžete uložit jako soubor s příponou ~.red nebo ~.txt  a spustit jej z příkazového řádku jako argument aplikace Red, asi takto:

C:\\Users\\you\\whatever &gt;  red-063.exe  myprogram.red  

To spustí interpret Redu, otevře konzolu (REPL) a spustí váš skript.

V běžícím prostředí Redu však můžete provést exekuci kódu přímo příkazem  do.

### native! do

Vyhodnotí argumenty kódu, jinými slovy provede exekuci kódu. Argumentem může být blok, soubor, funkce či jiná hodnota.

&gt;&gt; do \[loop 3 \[print "hello"]]  
hello  
hello  
hello

Před dalším pokračováním nahlédněte do kapitoly [Soubory](http://helpin.red/Soubory.html).

Pokud jste například uložil skript jako myprogram.red, můžete jej realizovat tímto příkazem:

&gt;&gt; do %myprogram.red

Nezapomeňte, že v tomto případě musí být interpret Redu a zdrojový soubor ve stejné složce; jinak musíte uvest také cestu ke skriptu.

Můžete také načíst skript do interpreta Redu:

&gt;&gt; a: load %myprogram.red

a spustit jej:

&gt;&gt; do a

Můžete také načíst a provést skript, uložený jako textový soubor :

&gt;&gt; do load %myprogram.txt

 Uvědomte si, že toto vše můžete provádět  z vnitřku programu Red! 

Zastavení exekuce

### function!  quit

### Zastaví vyhodnocení a opustí program.

### Zapíšete-li to v konzole GUI, zavře se. Zapíšete-li to na příkazový řádek interaktivního rozhraní, pouze opustíte interpreta Redu.

/return    Zastaví vyhodnocení a opustí program ...           ;; koketuje s OS, opatrně!

quit/return 3   ;hands the value 3 to the Operating System

### function!  halt

Zastaví interpretaci skriptu.

### routine!   quit-return                                        ;; koketuje s OS, opatrně!

Stops evaluation and exits the program with a given status. Seems to me as exactly the same as quit/return, but it's a routine! datatype, not a function! Go figure out.

VID DLS  on-close                                          

Aktivita řízená událostí - spustí zadaný kód po zavření aplikace (okna GUI). Spusťte následující program. Vytvoříte tlačítko a když na něj kliknete, tlačítko zmizí a v konzole se má objevit text "bye!".                                                                                  ;;  ale nechodí a nechodí

Red \[needs: view]

view [

         on-close \[print "bye!"]

      button \[print "click"]

]

Control C

Dvojklik Ctrl+c zastaví exekuci a opustí interpreta Redu.
