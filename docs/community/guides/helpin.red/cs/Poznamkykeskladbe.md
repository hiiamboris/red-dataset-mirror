Original URL: <http://helpin.red/cs/Poznamkykeskladbe.html>

# Poznámky ke skladbě

* * *

* * *

- Red je 'case insensitive' - s několika málo výjimkami, z nichž nejdůležitější je ta, že program musí začínat slovem  Red (nikoliv RED nebo red).
- Znaky new-line  jsou interpretem Redu většinou ignorovány. Relevantní výjimkou je  new-line uvnitř řetězce (stringu).
- Red je funkcionální jazyk, což znamená, že vyhodnocuje výsledky. Pořadí vyhodnocení výrazu není obvyklé a hovoříme o něm v části  [Vyhodnocení](http://helpin.red/Vyhodnoceni.html).

<!--THE END-->

- Program Redu je dlouhý řetěz slov (words). Těmito slovy mohou být buď  "data" nebo "aakce".
- Slova jsou oddělena jednou nebo více mezerami  (whitespaces) .
- Red si vede slovník se systémovými slovy a s uživatelsky vytvořenými slovy.
- Slova mohou být seskupována do "bloků", vymezených hranatými závorkami. Blok je pouhá skupina slov, která může ale nemusí být vyhodnocena nějakou  "akcí".
- Všechna programová data se nacházejí uvnitř samotného programu. Jsou-li potřebná externí data, jsou přidána k řetězci slov programu.
- Každé slovo musí při vyhodnocení mít nějakou hodnotu. Tato hodnota může pocházet z:

  o  slova samotného, je-li datem;

- - vyhodnocení, je-li slovo akcí;
  - odkazu na jiné slovo nebo blok (e.g. myRoom: 33).

<!--THE END-->

- V Redu lze říci, že proměnná je přiřazena své hodnotě, nikoliv obráceně.  V Redu vlastně nejsou žádné "proměnné", pouze slova přiřazená k hodnotám (datům).
- Kopírování slov (proměnných) může být komplikované. Chcete-li vytvořit opravdu nezávislou kopii, použijte slovo  copy . Viz kapitola [Kopírování](http://helpin.red/Kopirovani.html).
- Podobně komplikované je vyprazdňování (clearing) řad ([series),](http://helpin.red/Blokyarady.html) k nimž patří i řetězce. Pouhé přiřazení " " (empty string) nebo nuly nemusí přinést očekávaný výsledek. Takže k nulování řady je vhodné použít příkaz  clear.
- Každé slovo je nějakým datovým typem. Těch má Red pozoruhodné množství. Jsou vyjmenovány v kapitole  [Datové typy](http://helpin.red/Datovetypy.html).
- Deklarované slovo datového typu word! lze použít různým způsobem:

Zápis

Význam

word

Vzít přirozenou hodnotu slova. Je-li funkcí, nejprve ji vyhodnotit.

word:

Přiřadit (assign) slovo k hodnotě.

:word

Vzít hodnotu slova bez vyhodnocení. Užitečné pro získání definice funkce.

'word

Zacházet se slovem jako s hodnotou (a word symbol) -  bez vyhodnocení.

/word

Považovat slovo za upřesnění (refinement). Používá se hlavně u volitelných argumentů.

##### Refinements (upřesnění)

Mnohé akce v Redu umožňují "upřesnění", které modifikuje chování příkazu.  Refinement se deklaruje přidáním slova za lomítkem "/&lt;refinement&gt;".
