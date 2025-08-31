Original URL: <http://helpin.red/Whatisinsystem.html>

# What is in "system"

* * *

* * *

If you type ? system on the console, you get:

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

You may explore these paths using either ? or probe.

Interesting things you can do:

#### Accessing words, not only system's but your own.

If you type ? system/words, you get a very, very long list of all words you have in your Red session:

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

Type a new word like banana on your console, press enter (you get an error) then type ? system/words again. You will see that banana was added to your session's list of words:

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

If you assign a value to banana and repeat ? system/words you will see that the value is now linked to the word:

&gt;&gt; banana: "hello"

  ...

  ...

    caps-lock                unset!        

    num-lock                 unset!        

    banana                   string!       "Hello"

#### Changing console's prompt:

&gt;&gt; ? system/console/prompt

SYSTEM/CONSOLE/PROMPT is a string! value: "&gt;&gt; "

&gt;&gt; system/console/prompt: "@\*=&gt; "

== "@\*=&gt; "

@\*=&gt;                   ;this is the prompt now

#### Seeing command history:

&gt;&gt; probe system/console/history

\["probe system/console/history" "? system/console" {system/console/prompt: "@\*=&gt; "} " " {system/console/prompt: "@\*"} "? system/console/prompt" "? console/prompt" "? system" "? system/standard/error" "? system" "probe last system/word" "probe last system" "probe last a" "a: \[a b c]" "probe last sys ...

#### Changing error messages:

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

#### Choose procedures according to OS:

&gt;&gt; either system/platform = 'Windows \[print "Do this"] \[print "Do that"]

Do this

#### Notice the apostrophe before "Windows". This is a word! not a string!

Get the size of screen:

&gt;&gt; print system/view/screens/1/size  
1366x768

Debug View:

[]()Use system/view/debug?: yes , []()as explained in the [GUI Advanced topics](http://helpin.red/Advancedtopics.html#debugview) chapter.

[&lt; Previous topic](http://helpin.red/ProgrammaticdrawingandAnimation.html)                                                                                          [Next topic &gt;](http://helpin.red/AppendixI-Whilewewaitforserialpo.html)
