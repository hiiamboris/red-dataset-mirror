Original URL: <http://helpin.red/pt/Ajudadosistema.html>

# Ajuda do sistema

* * *

* * *

Red tem um ótimo help embutido no próprio programa. Tem uma grande quantidade de informações que você pode opter sobre a linguagem e sobre o seu código simplesmente digitando alguns comandos no console.

### function! ? (ou help)

Dá informação sobre as palavras pré-definidas do Red e também sobre o seu próprio programa. Você também pode digitar  help, mas  ? é, claro, mais curto. ? por sí só dá informações sobre como usar o help.

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

Você pode obter informação sobre objetos complexos:

![](http://helpin.red/lib/builtinhelp1.png)

Se você não sabe exatamente o que está procurando, "?" faz uma busca para você:

&gt;&gt; ? -to

    hex-to-rgb      function!     Converts a color in hex format to a tuple value; returns NONE if it f...

    link-sub-to-parent function!     \[face \[object!] type \[word!] old new /local parent]

    link-tabs-to-parent function!     \[face \[object!] /init /local faces visible?]

Você pode achar todas as palavras pré-definidas de um determinado datatype! :

&gt;&gt; ? tuple!

   Red              255.0.0

   white            255.255.255

   transparent      0.0.0.255

   black            0.0.0

   gray             128.128.128

    ; ... the list is too long!

### function! what

Imprime uma lista de todas as palavras pré-definidas. Tente!

### function! source

Mostra o código fonte das funções mezzanine e das funções criadas pelo usuário.

tente source replace .

#### funções mezzanine

O interpretador Red tem:

- as funções nativas que fazem parte do interpretador e são executadas em um nível baixo;
- as funções mezzanine que, apesar de fazerem parte do interpretador Red (vem junto com o executável_ foram criadas usando o Red, quer dizer, tem um código fonte que você pode ler usando source.

### function! about

Lista o número da versão e a data do build.
