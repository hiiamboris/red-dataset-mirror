Original URL: <http://helpin.red/pt/RSP-Helloworld.html>

# RSP -"Hello world"

* * *

* * *

[Veja também a](https://www.cheyenne-server.org/wiki/Rsp/Basis.html) [página do Cheyenne's sobre RSP](https://www.cheyenne-server.org/wiki/Rsp/Basis.html)

Nos scripts RSP, o Cheyenne interpreta tudo que está entre "&lt;%"  e "%&gt;"  como código de Rebol !

Abra seu index.html (aquele que você criou no capítulo "Instalando e configurando ...") com um editor de texto simples, adicione as seguintes linhas destacadas e salve-o na pasta www como myindex . rsp .

&lt;!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"&gt;

&lt;% print "Hello world" %&gt;

&lt;html&gt;

&lt;head&gt;

 &lt;meta content="text/html; charset=ISO-8859-1"

http-equiv="content-type"&gt;

 &lt;title&gt;&lt;/title&gt;

&lt;/head&gt;

&lt;body&gt;

&lt;h2 style="text-align: center;"&gt;Congratulations! Your

Cheyenne server is working!&lt;/h2&gt;

&lt;div style="text-align: center;"&gt;Have a nice day!&lt;/div&gt;

&lt;% print 55 + 88 %&gt;

&lt;/br&gt;

&lt;/body&gt;

&lt;/html&gt;

&lt;% print rejoin \["Time now is " now/time] %&gt;

Com o Cheyenne em execução (ouvindo a porta padrão 80), digite localhost/myindex.rsp na barra de endereços do seu navegador. Você deve ver isso:

![](http://helpin.red/lib/NewItem215.png)
