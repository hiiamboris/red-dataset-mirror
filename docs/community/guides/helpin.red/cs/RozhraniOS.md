Original URL: <http://helpin.red/cs/RozhraniOS.html>

# Rozhraní OS

* * *

* * *

### native! call

Provádí příkazy z shellu. Většinou je to totéž jako z příkazového řádku systémové konzoly (CLI) ale existuje několik úchylek.

Následující kód otevře Windows Explorer:

&gt;&gt; call "explorer.exe"  
\== 11272                        ; this is the number of the process opened.

Toto rovněž chodí:

&gt;&gt; str: "explorer.exe"  
\== "explorer.exe"

&gt;&gt; call str  
\== 11916

Ovšem, následující kód vytvoří proces ale neotevře Notepad na obrazovce:

&gt;&gt; call "notepad.exe"  
\== 4180

Chcete-li chování více podobné zápisu příkazu v shellu, musíte použít upřesnění  /shell:

&gt;&gt; call/shell "notepad.exe"                ; otevře Notepad na obrazovce  
\== 6524

Další upřesnění:

 call/wait

Spustí příkaz a čeká na jeho ukončení. Buďte opatrní, použijete-li upřesnění /wait pro proceduru, kterou nebudete umět ukončit  (jako call "notepad.exe" nahoře), Red bude čekat... a čekat.. až do nekonečna.

 call/input - zadáváme string!, file! nebo binary!, jež bude přesměrováno do stdin.

I don't understand this one. Seems as the same as simply call , as we provide string or a file anyway.

 call/output

Zadáváme string!, file! nebo binary!, jež přijme přesměrovaný stdout z příkazu.  Všimněte si, že výstup je připojen.

Následující kód vytvoří textový soubor s výstupem shellu pro "dir" (seznam souborů a složek z aktuální cesty):

&gt;&gt; call/output "dir" %mycall.txt  
\== 0

Toto vytvoří (dlouhý) řetězec s výstupem z "dir":

&gt;&gt; a: ""  
\== ""

&gt;&gt; call/output "dir" a  
\== 0

&gt;&gt; a  
\== { Volume in drive C has no label.^/ Volume Serial Number is BC5 ;...

 call/shell/show

Force the display of system's shell window (Windows only). Your program will run with windows command prompt open.

&gt;&gt; call/shell/show "notepad.exe"  
\== 12372

 call/console

Spustí příkaz s I/O přesměrovaný do konzoly (CLI console only at present, does not work with Red's normal GUI console).

### native! write-clipboard &amp;  read-clipboard

Zapisuje do a čte ze schránky OS:

&gt;&gt; write-clipboard "You could paste this somewhere you find useful"  
\== true

&gt;&gt; print read-clipboard  
You could paste this somewhere you find useful
