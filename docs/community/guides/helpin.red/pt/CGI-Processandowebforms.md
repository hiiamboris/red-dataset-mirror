Original URL: <http://helpin.red/pt/CGI-Processandowebforms.html>

# CGI -Processando web forms

* * *

## CGI - Processing web forms

* * *

Veja também: [Creating and Processing Web Forms with CGI (Tutorial)](http://www.rebol.com/docs/cgi2.html)

Crie o seguinte arquivo form1.html na pasta www:

&lt;HTML&gt;

&lt;TITLE&gt;Simple Web Form&lt;/TITLE&gt;

&lt;BODY&gt;

&lt;b&gt;Simple Web Form&lt;/b&gt;&lt;p&gt;

&lt;FORM ACTION="formhandler.cgi"&gt;

&lt;INPUT TYPE="TEXT" NAME="Field" SIZE="25"&gt;&lt;BR&gt;

&lt;INPUT TYPE="SUBMIT" NAME="Submit" VALUE="Submit"&gt;

&lt;/FORM&gt;

&lt;/BODY&gt;

&lt;/HTML&gt;

![](http://helpin.red/lib/NewItem222.png)

Agora crie e salve na mesma pasta o script formhandler.cgi:

#!www/rebol.exe -c

Rebol \[]

print \[&lt;HTML&gt;&lt;PRE&gt; mold system/options/cgi &lt;/HTML&gt;]

Quando você escreve "My Name" no campo e aperta o botão "Submit", o seu form1.html vai chamar o formhandler.cgi, e este script vai imprimir o que o protocolo CGI passa para o Rebol e este armazena em system/options/cgi:

make object! [  
   server-software: "Cheyenne/1.0"  
   server-name: "Ungaretti"  
   gateway-interface: "CGI/1.1"  
   server-protocol: "HTTP/1.1"  
   server-port: "80"  
   request-method: "GET"  
   path-info: "/formhandler.cgi"  
   path-translated: "www\\formhandler.cgi"  
   script-name: "/formhandler.cgi"  
   query-string: "Field=My+Name&amp;Submit=Submit"  
   remote-host: none  
   remote-addr: "127.0.0.1"  
   auth-type: none  
   remote-user: none  
   remote-ident: none  
   Content-Type: none  
   content-length: "0"  
   other-headers: ["HTTP\_ACCEPT" {text/html,application/xhtml+xml,application/...  
]

É bom saber isso, mas o Rebol oferece uma função para decodificar o CGI, chamada decode-cgi que converte os dados brutos em um bloco de Rebol que contém palavras seguidas pelos seus valores. A informação que queremos (o conteúdo do campo) estão na variável query-string. Então, altere script formhandler.cgi como se segue:

#!www/rebol.exe -c

Rebol \[]

print \[&lt;HTML&gt;&lt;PRE&gt; decode-cgi system/options/cgi/query-string &lt;/HTML&gt;]

O navegador agora vai mostrar :

Field My Name Submit Submit

Exemplo legal de CGI

Esta é a versão CGI do [exemplo legal](http://helpin.red/RSP-RequesteResponse.html#Cool) de RSP. Salve como coolexample.cgi  na pasta www do Cheyenne. Abra com o navegador usando localhost/coolexample.cgi.

#!www/rebol.exe -c

Rebol \[]

; First, a not very elegant way of avoiding crashes:

either system/options/cgi/query-string = none [

   system/options/cgi/query-string: ""

   decoded: ""

   ][

   decoded: second decode-cgi system/options/cgi/query-string

]

; Lets show what's in "decoded":

print {&lt;font face="courier"&gt;}

print "decoded = " probe decoded      print "&lt;br&gt;"

; Here we start HTML

print {

   &lt;HTML&gt;

   &lt;br&gt;&lt;br&gt;

   &lt;TITLE&gt;Cool Example&lt;/TITLE&gt;

   &lt;BODY&gt;

   &lt;b&gt;Cool Example&lt;/b&gt;&lt;p&gt;

   &lt;FORM ACTION="coolexample.cgi"&gt;}

print {&lt;INPUT TYPE="SUBMIT" NAME="Triangle" VALUE="Triangle"&gt;&lt;br&gt;&lt;br&gt;}

if decoded = "Triangle"  [

    print {&lt;svg width="120" height="120"&gt;

   &lt;polygon points="0,100 50,0 100,100"

   style="fill:lime;stroke:purple;stroke-width:5;fill-rule:evenodd;" /&gt;

   &lt;/svg&gt; &lt;br&gt;}  

]

print {&lt;INPUT TYPE="SUBMIT" NAME="Square" VALUE="Square"&gt;&lt;br&gt;&lt;br&gt;}

if decoded = "Square"  [

   print {&lt;svg width="120" height="120"&gt;

   &lt;rect width="100" height="100" style="fill:rgb(0,0,255);stroke-width:10;stroke:rgb(0,0,0)" /&gt;

   &lt;/svg&gt; &lt;br&gt;}  

]

print {&lt;INPUT TYPE="SUBMIT" NAME="Circle" VALUE="Circle"&gt;&lt;br&gt;&lt;br&gt;}

if decoded = "Circle"  [

   print {&lt;svg width="120" height="120"&gt;

   &lt;circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" /&gt;

   &lt;/svg&gt; &lt;br&gt;}  

]

; Now we finish HTML

print {

   &lt;/FORM&gt;

   &lt;/BODY&gt;

   &lt;/HTML&gt;}
