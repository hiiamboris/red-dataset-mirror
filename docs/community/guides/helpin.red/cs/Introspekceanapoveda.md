Original URL: <http://helpin.red/cs/Introspekceanapoveda.html>

# Introspekce a nápověda

* * *

* * *

Red má mimořádnou nápovědu. Pouhým zápisem několika slov v konzole lze získat obsáhlé množství informací o jazyku a o konkretní entitě.

### function! ? (or help)

Poskytne informaci o všech vyhrazených slovech Redu a rovněž o vašem vlastním kódu. Můžete použít příkaz  help nebo ?.  V konzole se vytiskne informace o použití nápovědy.

&gt;&gt; ? now

USAGE:

    NOW

DESCRIPTION:

    Returns date and time.

    NOW is a native! value.

REFINEMENTS:

    /year        =&gt; Returns year only.

    /month       =&gt; Returns month only.

    /day         =&gt; Returns day of the month only.

    /time        =&gt; Returns time only.

    /zone        =&gt; Returns time zone offset from UCT (GMT) only.

    /date        =&gt; Returns date only.

    /weekday     =&gt; Returns day of the week as integer (Monday is day 1).

    /yearday     =&gt; Returns day of the year (Julian).

    /precise     =&gt; High precision time.

    /utc         =&gt; Universal time (no zone).

RETURNS:

    \[date! time! integer!]

&gt;&gt; a: \[1 2 3]  
\== \[1 2 3]  
&gt;&gt; help a  
A is a block! value: \[1 2 3]

&gt;&gt; a: function \[a b] \[a + b]  
\== func \[a b]\[a + b]  
&gt;&gt; ? a  
USAGE:  
       A a b  
DESCRIPTION:  
       A is a function! value.  
ARGUMENTS:  
       a  
       b

Pokud přesně nevíte co hledáte, pomůže vám otazník:

&gt;&gt; ? -to

    hex-to-rgb      function!     Converts a color in hex format to a tuple value; returns NONE if it f...

    link-sub-to-parent function!     \[face \[object!] type \[word!] old new /local parent]

    link-tabs-to-parent function!     \[face \[object!] /init /local faces visible?]

Můžete nalézt všechna definovaná slova pro daný datatyp.

&gt;&gt; ? tuple!

   Red              255.0.0

   white            255.255.255

   transparent      0.0.0.255

   black            0.0.0

   gray             128.128.128

  ; ... seznam je docela dlouhý

### function! what

Vytiskne seznam globálně definovaných funkcí. Zkuste si to!

### function! source

Zobrazí zdrojový kód mezaninové nebo uživatelem vytvořené funkce. Vyzkoušejte si například

 &gt;&gt;  source replace .

### function! about

Zobrazí číslo verze a datum sestavení.

Introspekce grafických objektů

Introspekci grafických objektů (piškotů) si ukážeme v kapitole [GUI](http://helpin.red/GUI.html).
