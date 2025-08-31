Original URL: <http://helpin.red/cs/Helloworld.html>

# "Hello world"

* * *

## "Hello world" - spuštění a kompilace

* * *

### "Hello world" v konzole:

Otevřte v Notepadu++  již vytvořený skript "MyFirst.red" a spusťte jej (run/red-run). Měl byste v konzole dostat toto:

![](http://helpin.red/lib/helloworld12.png)

Okno vpravo je interaktivní konzola Red Console, někdy obecně označovaná jako REPL, což je zkratka sousloví Read, Evaluate, Print, Load . V její ploše zapište  print "I can use the console too!" a stiskněte Enter. Na to konzola reaguje výpisem zadaného textu na následujícím řádku:

![](http://helpin.red/lib/helloworld2.png)

Nyní zadejte 3 + 7 a stiskněte Enter:

![](http://helpin.red/lib/helloworld3.png)

Všimněte si, že musíte mít mezery mezi jednotlivými slovy. Mezery jsou povinné oddělovače a bez nich obdržíte chybu:

Hello world!  
&gt;&gt; print "I can use the console too!"  
I can use the console too!  
&gt;&gt; 3 + 7  
\== 10  
&gt;&gt; 3+7                                                 ; no spaces!!!!!  
\*\** Syntax Error: invalid integer! at "3+7"  
\*\** Where: do  
\*\** Stack: load

Všimněte si, že jsem za 3+7 připsal ; no spaces!!!!! . Red ignoruje slova za středníkem.

##### Zpracování skriptu:

Interpretované programovací jazyky vykonávají kód skriptu řádek po řádku. Red není zcela interpretovaný, protože provádí jistou kompilaci před exekucí ale jeho programům se přesto říká skripty.

Na prvním řádku skriptu je povinně blok Red \[ ], nikoliv RED, nikoliv red. Tento první blok je určen pro metadata programu, nicméně může být prázdný. Úplný blok by mohl vypadat takto:

Red [

       title: "Hello World"

       author: "My name"

       version: 1.1

       purpose {

               To print a greeting to the planet.

               Notice that multi-line text goes

               inside curly brackets.

               }

       ]                   ; cokoli před tímto blokem je ignorováno!

print "Hello World!"

### "Hello world" s grafickým rozhranním - GUI:

Jednou z nejnápadnějších vlastností Redu je jeho schopnost snadného vytváření programů s grafickým rozhraním. Chytře využívá vlastní API operačního systému. Jednoduchý prográmek pro Hello world v GUI vypadá takto:

Red \[needs: 'view]

view [

   text "Hello World!"

]

![](http://helpin.red/lib/helloworld5.png)

Pokyn needs: 'view  v bloku záhlaví říká Redu, že má načíst grafickou knihovnu  "view". Toto záhlaví s pokynem není potřebné, zadáváme-li příkaz view \[text "Hello World!"] z  konzoly Redu, v níž je knihovna "view" již obsažena.

Není však zřejmě nic proti ničemu, když i v konzole uvedeme  needs: 'view  - již bez bloku Red \[].

### Spuštění skriptu z konzoly:

Spuštění kódu, zapsaného v konzole provedeme prostým příkazem Enter, spuštění kódu, zapsaného ve skriptu, provedeme v Notepad++ příkazem Run/Red Run. Spuštění skriptu z konzoly je popsáno v kapitole [Exekuce kódu](http://helpin.red/Exekucekodu.html).

### Kompilace "Hello world" na spustitelný soubor:

Prográmek GUI "Hello World" lze kompilovat na spustitelný soubor.

Máte-li výše uvedený program uložen jako "MyFirst.red" ve složce "programs" v adresáři "RedIDE", měl byste mít v počítači přibližně následující konstelaci:

![](http://helpin.red/lib/helloworld6.png)

Aby se nám produkty kompilace nerozsypaly do složky RedIDE, vložte do složky "programs" ještě kopii prováděčky Redu:

![](http://helpin.red/lib/compile2.png)

Otevřte systémovou konzolu. Nevíte-li jak, napište "cmd" do vyhledávacího pole Windows a potvrďte položku Příkazový řádek (Command Prompt):

![](http://helpin.red/lib/compile1.png)

V příkazovém řádku se nacédujte do složky s prováděčkou Red (právě jsme ji překopírovali do složky "programs") a zadejte žlutě označený text dole:

![](http://helpin.red/lib/compile6.png)

Red odpoví řadou sdělení a asi po 10 vteřinách budete mít ve složce "programy" pět dalších souborů, včetně "Myfirst.exe".

![](http://helpin.red/lib/compile7.png)

Dvojklikem jej aktivujte a hned se vám na obrazovce objeví úhledné sdělení  "Hello World".

### Doplňující poznámky ke kompilování:

Zjistil jsem, že se kompilovaná verze programu může chovat odlišně od interpretované verze. Měl jsem problémy s příkazy "print", které jsem do programu vložil kvůli ladění. Mám zato, že volání příkazů konzoly v binárním (executable) souboru není to pravé ořechové. Také jsem měl problémy s globálními proměnnými (slovy) uvnitř funkcí; zdá se že kompilátor je neoznačí jako globální. Poslední problém jsem řešil dvojím způsobem:

1. Deklaroval jsem proměnné (přiřadil hodnoty slovům) na počátku svého programu.

<!--THE END-->

1. Při kompilaci jsem použil opci "-e" (v github není uvedena, patrně jde o experimentální volbu).

 -e znamená  "encap" v Rebolu. Výstupem je binárka  EXE, jejíž kód je interně interpretován, takže  problémy, které jsou omezením kompilátoru, mohou být řešeny" - Gregg Irwin.)

MyFirst.red program jsme mohli kompilovat také s použitím pouze opce  -c (compile):

![](http://helpin.red/lib/compile3.png)

Po jedné z obou kompilací máte ve složce "programy" tyto soubory:

![](http://helpin.red/lib/compile4.png)

Jediné dva soubory, které musí být k disposici pro spuštění vašeho programu jsou libRedRT.dll a vaše prováděčka (binárka), v tomto případě MyFirst.exe.

Když ovšem spustíte binárku, kompilovanou pouze s opcí -c, otevře Red také obtěžující okno konzoly. Chcete-li se tomu vyhnout (kdo by nechtěl?), zadejte ještě opci  -t windows, která zajistí kompilaci pro určenou platformu.

![](http://helpin.red/lib/compile5.png)

Měli byste být schopni kompilace pro níže uvedené platformy ale v současné době se Red stále vyvíjí a tak se může stát, že s některými platformami budete mít problémy  (např. se zdá, že kompilace pro android nechodí).

#### From Red's github:

###### Cross-compilation targets:

MSDOS        : Windows, x86, console (+ GUI) applications  
Windows      : Windows, x86, GUI applications  
WindowsXP    : Windows, x86, GUI applications, no touch API  
Linux        : GNU/Linux, x86  
Linux-ARM    : GNU/Linux, ARMv5, armel (soft-float)  
RPi          : GNU/Linux, ARMv5, armhf (hard-float)  
Darwin       : macOS Intel, console-only applications  
macOS        : macOS Intel, applications bundles  
Syllable     : Syllable OS, x86  
FreeBSD      : FreeBSD, x86  
Android      : Android, ARMv5  
Android-x86  : Android, x86

###### Způsoby kompilace:

-c, --compile                  : Generuje v pracovním adresáři spustitelný kód  (prováděčku)                          s použitím libRedRT. (developement mode)  
\-d, --debug, --debug-stabs     : Kompiluje zdrojový soubor v ladícím regimu (debug mode).                                    STABS is supported for Linux targets.  
\-dlib, --dynamic-lib           : Generuje sdílenou knihovnu ze zdrojového souboru.                  
\-h, --help                     : Output this help text.                                     -o &lt;file&gt;, --output &lt;file&gt;     : Specify a non-default \[path/]\[name] for  
                                the generated binary file.  
\-r, --release                  : Kompiluje v režimu release mode, spojujíc vše dohromady                                     (implicitní je development mode).  
\-s, --show-expanded            : Output result of Red source code expansion by  
                                the preprocessor.  
\-t &lt;ID&gt;, --target &lt;ID&gt;         : Cross-compile to a different platform  
                                target than the current one (see targets  
                                table below).  
\-u, --update-libRedRT          : Rebuild libRedRT and compile the input script  
                                (only for Red scripts with R/S code).  
\-v &lt;level&gt;, --verbose &lt;level&gt;  : Set compilation verbosity level, 1-3 for  
                                Red, 4-11 for Red/System.  
\-V, --version                  : Output Red's executable version in x.y.z  
                                format.  
\--config \[...]                 : Provides compilation settings as a block  
                                of \`name: value\` pairs.  
\--cli                          : Run the command-line REPL instead of the  
                                graphical console.  
\--no-runtime                   : Do not include runtime during Red/System  
                                source compilation.  
\--red-only                     : Stop just after Red-level compilation.  
                                Use higher verbose level to see compiler  
                                output. (internal debugging purpose)

Existuje také volba -e. Viz "Doplňující poznámky ke kompilování" výše.
