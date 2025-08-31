Original URL: <http://helpin.red/cs/Soubory.html>

# Soubory

* * *

* * *

### Názvy cest

Cesty k souborům se píší se znakem %, následovaným výčtem adresářů, oddělených lomítkem. Ve Windows si Red sám mění zpětná lomítka na normální lomítka.

Jenom pro připomnění:

- / písmeno před prvním lomítkem označuje kořenový adresář oddílu
- ./ označuje aktuální adresář
- ../ označuje rodiče aktuálního adresáře
- cesty, které nezačínají odkazem na kořenový adresář oddílu, jsou relativní
- absolutní cesta pro často používaný oddíl "C" ve Windows: %/C/docs/file.txt
- absolutní cesty nejsou strojově nezávislé;

##### Grafický selektor souboru:

function! request-file

Příkaz request-file otevře grafické okno Průzkumníka  a vrátí úplnou cestu vybraného souboru (file!)

&gt;&gt; request-file

![](http://helpin.red/lib/requestfile.png)

== %/C/Users/André/Documents/RED/myFirstFile.txt

Refinements

request-file/title  - Window title.

request-file/file -

request-file/filter - Poskytnutý blok filtrů ovlivní konfiguraci otevřeného výběrového okna. Například, request-file/filter \["executables" "\*.exe" "text files" "\*.txt"] vytvoří roletku s nabídkou 'executables'  a 'text files'.

request-file/save - File save mode. Example with filters: request-file/save/filter \["executables" "\*.exe" "text files" "\*.txt"]

##### Grafický selektor adresáře:

function! request-dir

Příkaz request-dir otevře okno se základní nabídkou adresářů (User, Tento počítač, Knihovny, Síť). Pro vybraný soubor či složku vrací úplnou cestu  (file!)

![](http://helpin.red/lib/requestdir.png)

== %/C/Users/André/Documents/RED/

Refinements

   request-dir/title       =&gt; Window title.

   request-dir/dir         =&gt; Set starting directory.

   request-dir/filter      =&gt; TBD: Block of filters (filter-name filter).

   request-dir/keep        =&gt; Keep previous directory path.

   request-dir/multi       =&gt; TBD: Allows multiple file selection, returned as a block.

##### Smazání souboru:

action! delete

 Smaže soubor a vrací true, pokud se zadařilo, jinak vrací false.

&gt;&gt; delete %file.txt  
\== true

##### Zjištění velikosti souboru:

native! size?

Vrací velikost v bajtech nebo none, když soubor neexistuje.

&gt;&gt; size? %myFirstFile.txt  
\== 37

#### Další funkce:

cd nebo change-dir - mění aktuální adresář.

dir, ls nebo list-dir - vypíše obsah adresáře; bez poskytnutého argumentu vypíše obsah aktuálního adresáře.

dir? -  vrací 'true', je-li zadané jméno platnou cestou, jinak vrací 'false'.

dirize - přemění argument na platný adresář; argumentem může být hodnota typu  file! string! url!.  
Effectively dirize only appends a trailing / if needed.

exists? - vrací 'true', je-li argument platnou cestou typu path!

file? -  vrací 'true', je-li argument souborem

get-current-dir - vrací aktuální adresář, používaný programem

get-path? - vrací 'true', je-li argument typu get-path!

path? - vrací 'true', je-li argument typu path!

split-path - rozdělí sestu typu file! nebo url! path; vrací blok, obsahující cestu a cíl

suffix? - vrací příponu souboru, např. exe, txt

what-dir - vrací cestu k aktuálnímu adresáři ve formátu file!

to-red-file - Converts a local file system path to Red's  
standard machine independent path format.

to-local-file - Converts standard, system independent Red  
file paths to the file format used by the local operating system.

to-red-file - maže '.' a '..' v cestě a vrací vyčištěnou cestu

red-complete-file

red-complete-path

set-current-dir
