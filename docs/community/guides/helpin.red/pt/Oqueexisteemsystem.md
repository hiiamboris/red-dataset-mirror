Original URL: <http://helpin.red/pt/Oqueexisteemsystem.html>

# O que existe em "system"

* * *

* * *

Se você digitar ? system no console, você obtém:

&gt;&gt; ? system

SYSTEM is an object! with the following words and values:

    version     tuple!        0.6.3

    build       object!       \[date git config]

    words       object!       [datatype! unset! none! logic!...

    platform    function!     Return a word identifying the operating system.

    catalog     object!       \[datatypes actions natives accessors errors]

    state       object!       \[interpreted? last-error trace]

    modules     block!        length: 0  \[]

    codecs      block!        length: 8  [png make object! [title:...

    schemes     object!       \[]

    ports       object!       \[]

    locale      object!       \[language language* locale locale* months days]

    options     object!       [boot home path script cache thru-cache ...

    script      object!       \[title header parent path args]

    standard    object!       \[header error file-info]

    lexer       object!       [pre-load throw-error make-hm make-msf...

    console     object!       [prompt result history size running? catch? ...

    view        object!       [screens event-port metrics fonts platform ...

    reactivity  object!       [relations stack queue eat-events? debug? ...

Você pode explorar esses paths usando tanto  ? como probe.

Coisas interessantes que você pode fazer:

#### Acessar words, não só as do sistema, mas as suas próprias.

Se você digitar ? system/words, você obtém um lista muito, muito longa de todas as palavras da sua sessão Red:

&gt;&gt; ? system/words

SYSTEM/WORDS is an object! with the following words and values:

    datatype!                datatype!     datatype!

    unset!                   datatype!     unset!

    none!                    datatype!     none!

  ...

  ...

    right-command            unset!        

    caps-lock                unset!        

    num-lock                 unset!        

Digite uma nova palavra no seu console, como banana , aperte enter (dá um erro) então digite  ? system/words novamente. Você verá que banana foi adicionada à lista de palavras de sua sessão:

&gt;&gt; banana

\*\** Script Error: banana has no value

\*\** Where: catch

\*\** Stack:  

&gt;&gt; ? system/words

SYSTEM/WORDS is an object! with the following words and values:

    datatype!                datatype!     datatype!

    unset!                   datatype!     unset!  

  ...

  ...

    caps-lock                unset!        

    num-lock                 unset!        

    banana                   unset!

Se você atribuir um valor a banana e repetir ? system/words você verá que o valor foi vinculado à palavra (word):

&gt;&gt; banana: "hello"

  ...

  ...

    caps-lock                unset!        

    num-lock                 unset!        

    banana                   string!       "Hello"

#### Mudar o prompt do console:

&gt;&gt; ? system/console/prompt

SYSTEM/CONSOLE/PROMPT is a string! value: "&gt;&gt; "

&gt;&gt; system/console/prompt: "@\*=&gt; "

== "@\*=&gt; "

@\*=&gt;                   ;este é o novo prompt agora

#### Ver o histórico dos comandos:

&gt;&gt; probe system/console/history

\["probe system/console/history" "? system/console" {system/console/prompt: "@\*=&gt; "} " " {system/console/prompt: "@\*"} "? system/console/prompt" "? console/prompt" "? system" "? system/standard/error" "? system" "probe last system/word" "probe last system" "probe last a" "a: \[a b c]" "probe last sys ...

#### Alterar as mensagens de erro:

&gt;&gt; ? system/catalog/errors/script

SYSTEM/CATALOG/ERRORS/SCRIPT is an object! with the following words and values:

    code                integer!      300

    type                string!       "Script Error"

    no-value            block!        length: 2  \[:arg1 "has no value"]

   ...

    lib-invalid-arg     block!        length: 2  \["LIBRED - invalid argument for" :arg1]

&gt;&gt; system/catalog/errors/script/type: "Don't be silly!! "

== "Don't be silly!! "

&gt;&gt; nono

\*\** Don't be silly!! : nono has no value

\*\** Where: catch

\*\** Stack:

#### Escolher caminhos conforme o Sistema Operacional:

&gt;&gt; either system/platform = 'Windows \[print "Do this"] \[print "Do that"]

Do this

#### Note o apóstrofo antes de "Windows". É uma word! não uma string!

Obter o tamanho da tela:

&gt;&gt; print system/view/screens/1/size  
1366x768

Debugar View:

[]()Use system/view/debug?: yes , como explicado em[]() [GUI Tópicos Avançados](http://helpin.red/Topicosavancados.html#debugview) .
