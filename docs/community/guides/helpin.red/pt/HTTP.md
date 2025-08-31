Original URL: <http://helpin.red/pt/HTTP.html>

# HTTP

* * *

## I/O - HTTP

* * *

Eu criei alguns arquivo no servidor do helpin.red  para fazer testes com HTTP I/O:

[http://helpin.red/samples/samplescript1.txt](http://helpin.red/samples/samplescript1.txt)  - um loop simples sem o header (cabeçalho) do Red ( repeat i 3 \[prin "hello " print i] );

[http://helpin.red/samples/samplescript2.txt](http://helpin.red/samples/samplescript2.txt) - um loop simples com header ( Red\[] repeat i 3 \[prin "hello " print i] );

[http://helpin.red/samples/samplehtml1.html](http://helpin.red/samples/samplehtml1.html) - uma página HTML de exemplo.

&gt;&gt; print read http://helpin.red/samples/samplescript1.txt

repeat i 3 \[prin "hello " print i]

&gt;&gt; print read http://helpin.red/samples/samplescript2.txt

Red\[] repeat i 3 \[prin "hello " print i]

De dentro um script ou usando o console, você pode executar código de um servidor remoto:

&gt;&gt;  do read http://helpin.red/samples/samplescript1.txt   ;without header

hello 1

hello 2

hello 3

Se o código no servidor remoto tiver o header Red, você poderá executá-lo diretamente, sem a instrução read:

&gt;&gt; do http://helpin.red/samples/samplescript2.txt    ;with Red \[] header

hello 1

hello 2

hello 3

Você pode carregar dados ou código, incluindo funções e objetos:

&gt;&gt; a: load http://helpin.red/samples/samplescript1.txt

== \[repeat i 3 \[prin "hello " print i]]

&gt;&gt; do a

hello 1

hello 2

hello 3

Arquivos HTML também podem ser acessados ​​para processamento. Dê uma olhada no examplo usando dialeto parse.

&gt;&gt; print read http://helpin.red/samples/samplehtml1.html

&lt;!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"&gt;

&lt;html&gt;

&lt;head&gt;

 &lt;meta content="text/html; charset=ISO-8859-1"

http-equiv="content-type"&gt;

 &lt;title&gt;testHtmlPage&lt;/title&gt;

&lt;/head&gt;

&lt;body&gt;

...

&lt;/html&gt;

A ser terminado... um dia.
