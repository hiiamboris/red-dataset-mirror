Original URL: <http://helpin.red/cs/Funkce.html>

# Funkce

* * *

* * *

Funkce musejí být před použitím deklarovány a proto se píší v přední části programu. To ale není požadováno, je-li funkce volána z jiné funkce.

native! func

Skladba funkce s func je tato:

&lt;název&gt;: func \[&lt;arg1&gt; &lt;arg2&gt; ... &lt;arg n&gt;] \[ &lt;actions performed on arguments&gt;]

Red \[]

mysum: func \[a b] \[a + b]

print mysum 3 4

7

Proměnné uvnitř funkce, vytvořené se slovem func, jsou globální. Jsou viditelné z celého programu.:

Red \[]

mysum: func \[a b] [

       mynumber: a + b

       print mynumber

]

mynumber: 20

mysum 3 4

print mynumber

7

7

native! function

Proměnné uvnitř funkce se slovem function  jsou lokální, to jest, jsou přístupné pouze uvnitř definované funkce.

Red \[]

mysum: function \[a b] [

       mynumber: a + b

       print mynumber

]

mynumber: 20

mysum 3 4

print mynumber

Různé výsledky:

7

20

#### Vnucená globální přístupnost proměnných upřesněním /extern:

Red \[]

myfunc: function \[/extern a b] [

       a: 22

       b: 33

]

a: 7

b: 9

myfunc

print a

print b

22

33

#### Definice typu argumentu:

Datový typ (datatype) argumentu lze předem určit :

Red \[]

mysum: function \[a \[integer!] b\[integer!]] \[print a + b]

print mysum 3.2 4        ; oops! 3.2 is a float!

\*\** Script Error: mysum does not allow float! for its a argument

\*\** Where: mysum

\*\** Stack: mysum

Lze připustit více datových typů:

Red \[]

mysum: function \[a \[integer! float!] b\[integer!]] \[print a + b]

print mysum 3.2 4

7.2

Případně lze zadat nadřízený datový typ:

Red \[]

mysum: function \[a \[number!] b\[number!]] \[print a + b]

print mysum 3.2 4

7.2

#### Vratná hodnota funkce:  native! return

Vratnou (return) hodnotou funkce je buď poslední funkcí vyhodnocená hodnota nebo hodnota explicitně určená slovem  return:

Red \[]

myfunc: function \[] [

       8 + 9

       3 + 3

       print "got here"          ; this executes

       10 + 5                       ; this is returned

]

print myfunc

got here

15

Příklad s 'return'; slovo return je poslední aktivní příkaz funkce:

Red \[]

myfunc: function \[] [

       8 + 9

       return 3 + 3                        ; this is returned

       print "never got here"        ; NOT executed

       10 + 5                                

]

print myfunc

6

#### Vytváření vlastních upřesnění:

Je možné vytvářet vlastní upřesnění funkcí, podobná nativním upřesněním Redu: Jednotlivá upřesnění jsou bulíny (boolean values), ověřované funkcí:

Red \[]

myfunc: function \[a /up   b /down   c] [

       if up \[print a + b]

       if down \[print a - c]

]

myfunc/up 10 3

myfunc/down 10 3

13

7

Pro upřesnění nejsou argumenty povinné.

#### Přiřazení funkcí ke slovům (variables)

To assign a function to a variable (a word) you must precede the function with a colon: &lt;word&gt;: :&lt;function&gt;

&gt;&gt; mysum: func \[a b] \[a + b]

== func \[a b]\[a + b]

&gt;&gt; a: :mysum

== func \[a b]\[a + b]

&gt;&gt; a 3 9

== 12

native! does

Pokud naše rutina jenom něco provádí - bez argumentů a lokálních proměnných, použijeme slovo does :

Red \[]

greeting: does [

       print "Hello"

       print "Stranger"

]

greeting

Hello

Stranger

native! has

Pokud naše rutina nepoužívá žádné externí argumenty ale má lokální proměnné, použijeme slovo  has. To přemění případný argument na lokální proměnnou. Porovnejte níže uvedené tři programy. První používá has bez argumentu, slovo number je tedy globální proměnná. Druhá obsahuje number jako argument, jenž je však uvnitř funkce redefinovaný na lokální proměnnou. Pokud změníme název tohoto argumentu, je funkcí ignorován, neboť argument není u tohoto typu funkce povinný. V třetí ukázce vidíme, že v definici funkce musí být argument reálně použit, nikoliv redefinován a že funkce musí být volána s hodnotou argumentu.

  ![](http://helpin.red/lib/has1.png) ![](http://helpin.red/lib/has2.png) ![](http://helpin.red/lib/has3.png)

native! exit

Opustí funkci bez vracení jakékoli hodnoty.

#### Různé typy vestavěných funkcí

- mezaninové funkce jsou vytvořeny v jazyce Red a jejich zdrojový kód lze číst s použitím příkazu  source &lt;název fce&gt;.

    Výpisy funkcí následujících typů lze získat dotazem (help či ?) na název typu:

- funkce typu function
- funkce typu op!
- funkce typu action!
- funkce typu routine!
- funkce typu native! jsou součástí interpreta a aktivují se na velmi nízké úrovni;
