Original URL: <http://helpin.red/cs/Osetrenichyb.html>

# Ošetření chyb

* * *

* * *

### function!  attempt

Vyhodnotí blok a vrací výsledek nebo vrací none při výskytu chyby.

&gt;&gt; attempt \[a: 10 b: 9]        ;first lets try with no errors...  
\== 9  
&gt;&gt; a  
\== 10                                ;... no problems here!

&gt;&gt; attempt \[a: 10 nosyntax]        ;nosyntax has no value: ERROR!  
\== none

### native! try

Pokusí  se o vyhodnocení bloku. Vrací hodnotu bloku ale při výskytu chyby vrací hodnotu  error!.

Pro identifikaci závadného bloku bez tisku chybového hlášení použijeme funkci  error?.

Můžete se ptát proč nepoužít attempt místo error? &amp; try. Domnívám se že proto, že kombinace error? &amp; try vrací true a false místo none nebo provedeného vyhodnocení. To je užitečné při použití uvnitř jiných struktur.

&gt;&gt; error? \[nosyntax]  
\== false        ;nosyntax has no value and it generates an error,  
                       ;but only if evaluated. In itself, is not a error! datatype.

&gt;&gt; try \[nosyntax]  
\*\** Script Error: nosyntax has no value  
\*\** Where: try  
\*\** Stack:                     ; just "try" does not work, you get an error!!

&gt;&gt; error? try \[nosyntax]  
\== true                        ; OK!

### native! catch and native! throw

Tyto příkazy se používají k ošetření chyb. Delší vysvětlení lze nalézt  [zde](http://www.red-by-example.org/index.html#catch).
