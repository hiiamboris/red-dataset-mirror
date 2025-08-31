Original URL: <http://helpin.red/pt/Usodoparse-Extraindodados.html>

# Uso do parse - Extraindo dados

* * *

* * *

Contando palavras no texto:

Red \[]

a: "Not great Britain nor small Britain, just Britain"

count: 0

parse a \[any \[thru "Britain" (count: count + 1)]]

print count

3

Explicando o programa:

Enquanto thru "Britain" encontrar um "Britain", any vai repetir a regra

![](http://helpin.red/lib/NewItem195.png)

![](http://helpin.red/lib/NewItem194.png)

Observe que, se você tivesse utilizado to em vez de thru , o input seria movido para ANTES do match, criando um loop infinito , já que o parse ficaria repetindo sempre o match com "Britain".

Extraindo uma parte de um texto:

Para extrair a parte restante de um texto a partir de um determinado ponto, você pode usar word:, como explicado no capítulo [Guardando o Input](http://helpin.red/Guardandooinput.html#Collecting) . Para extrair texto entre dois matches do parse, você pode usar copy :

Red \[]

txt: "They are one person, they are two together"

parse txt \[thru "person, " copy b to " two"]

print b

they are

[]()Extraindo dados da Internet:

Este é um exemplo muito básico. Eu criei uma página html em helpin.red: [http://helpin.red/samples/samplehtml1.html](http://helpin.red/samples/samplehtml1.html) . O html é muito simples e você pode vê-lo digitando print read http://helpin.red/samples/samplehtml1.html no console.

Como conhecemos o html, podemos extrair algumas informações com o código abaixo:

Red \[]

txt: read http://helpin.red/samples/samplehtml1.html

parse txt [

       thru "today"

       2 thru "&gt;"

       copy weather1 to "&lt;"

       thru "tomorrow"

       2 thru "&gt;"

       copy weather2 to "&lt;"

       thru "week"

       2 thru "&gt;"

       copy weather3 to "&lt;"

]

print {Acording to helpin.red website weather will be: }

print \[] ; just adding an empty line

print \["Today:     "  weather1]

print \["Tomorrow:  "  weather2]

print \["Next week: "  #"^(tab)"  weather3] ; just showing the use of tab

Acording to helpin.red website weather will be:

Today:      sunny

Tomorrow:   horrible

Next week:          really really horrible

Mostrarei como o parse funciona para extrair o tempo de "today" para a variável "weather1":

thru "today" ; pula todo o texto até achar o texto "today".

border="1" cellpadding="2" cellspacing="2"&gt;

 &lt;tbody&gt;

   &lt;tr&gt;

     &lt;td style="color: black;"&gt;weather today:&lt;/td&gt;

     &lt;td style="color: black;"&gt;sunny&lt;/td&gt;

   &lt;/tr&gt;

   &lt;tr&gt;

2 thru "&gt;" ; isso faz pular o texto até (depois do) caracter "&gt;". faz isso duas vezes!

border="1" cellpadding="2" cellspacing="2"&gt;

 &lt;tbody&gt;

   &lt;tr&gt;

     &lt;td style="color: black;"&gt;weather today:&lt;/td&gt;        ; 1

     &lt;td style="color: black;"&gt;sunny&lt;/td&gt;                 ; 2

   &lt;/tr&gt;

   &lt;tr&gt;

copy weather1 to "&lt;" ; isso copia para "weather1" tudo que encontra até (antes de) um "&lt;".

border="1" cellpadding="2" cellspacing="2"&gt;

 &lt;tbody&gt;

   &lt;tr&gt;

     &lt;td style="color: black;"&gt;weather today:&lt;/td&gt;

     &lt;td style="color: black;"&gt;sunny&lt;/td&gt;                  ; ==&gt; weather1

   &lt;/tr&gt;

   &lt;tr&gt;
