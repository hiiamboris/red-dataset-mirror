Original URL: <http://helpin.red/pt/RSP-RequesteResponse.html>

# RSP -Request e Response

* * *

* * *

[Use essa página como referência para este texto.](https://www.cheyenne-server.org/docs/rsp-api.html)

Requests:

Use um editor de texto simples para criar o script abaixo e salve na pasta www como reqres.rsp.

&lt;%

print {&lt;font face="courier"&gt;}

print "content ...... = " probe request/content      print "&lt;br&gt;"

print "method ....... = " probe request/method       print "&lt;br&gt;"

print "posted ....... = " probe request/posted       print "&lt;br&gt;"

print "client-ip .... = " probe request/client-ip    print "&lt;br&gt;"

print "server-port .. = " probe request/server-port  print "&lt;br&gt;"

print "translated ... = " probe request/translated   print "&lt;br&gt;"

print "query-string . = " probe request/query-string print "&lt;br&gt;"

%&gt;

&lt;br&gt;&lt;br&gt;

&lt;HTML&gt;

&lt;TITLE&gt;Simple Web Form&lt;/TITLE&gt;

&lt;BODY&gt;

&lt;FORM ACTION="reqres.rsp"&gt;

&lt;INPUT TYPE="TEXT" NAME="Field" SIZE="25"&gt;&lt;BR&gt;

&lt;INPUT TYPE="SUBMIT" NAME="Submit" VALUE="Submit"&gt;

&lt;/FORM&gt;

&lt;/BODY&gt;

&lt;/HTML&gt;

Com o Cheyenne rodando (porta 80), digite localhost/reqres.rsp na barra de endereços do navegador. Você deve ver isso:

![](http://helpin.red/lib/NewItem219.png)

Digite alguma coisa no campo e aperte o botão "Submit". Seu navegador deve mostrar isso:

![](http://helpin.red/lib/NewItem218.png)

O que acontece:

Parece claro que o Cheyenne pega o request do cliente (navegador), decodifica-o e armazena todos os valores importantes nas variáveis ​​internas do objeto request.

Quando você clica em "Submit", ACTION="reqres.rsp" remete você para a mesma página, mas atualizada! Mas, para fazer isso, o navegador envia um request que é dividido e armazenado nas variáveis do objeto request , que são mostradas na página atualizada.

Responses:

Da mesma forma que os requests têm o objeto request, as responses têm o objeto response. No entanto, a maioria dos campos deste objeto são funções (ações). A exceção mais relevante é o response/buffer, que é onde o RSP do Cheyenne armazena tudo o que deve ser enviado ao cliente. É um bloco, e você pode manipulá-lo como qualquer série.

Se você mudar o código do reqres.rsp para:

&lt;%

append response/buffer "&lt;HTML&gt;"

append response/buffer "&lt;h3&gt;This text is in the response buffer&lt;/h3&gt;"

append response/buffer "&lt;h4&gt;This text is in the response buffer too&lt;/h4&gt;"

append response/buffer "&lt;p&gt;So is this&lt;/p&gt;"

%&gt;

Você obtém:

![](http://helpin.red/lib/NewItem217.png)

[]()Exemplo legal:

Crie e salve o seguinte script RSP como coolexample.rsp na pasta www do Cheyenne . Abra localhost/coolexample.rsp no seu navegador e clique em um botão. Se o seu navegador suporta SVG HTML (a maioria suporta), uma imagem correspondente deve aparecer sob o botão.

&lt;%

print {&lt;font face="courier"&gt;}

print "content ...... = " probe request/content      print "&lt;br&gt;"

%&gt;

&lt;HTML&gt;

&lt;br&gt;&lt;br&gt;

&lt;TITLE&gt;Cool Example&lt;/TITLE&gt;

&lt;BODY&gt;

&lt;b&gt;Cool Example&lt;/b&gt;&lt;p&gt;

&lt;FORM ACTION="coolexample.rsp"&gt;

&lt;INPUT TYPE="SUBMIT" NAME="Triangle" VALUE="Triangle"&gt;&lt;br&gt;&lt;br&gt;

&lt;%

if not empty? request/content [

   if (first request/content) = 'Triangle  [

       print {&lt;svg width="100" height="100"&gt;

       &lt;polygon points="0,100 50,0 100,100"

       style="fill:lime;stroke:purple;stroke-width:5;fill-rule:evenodd;" /&gt;

       &lt;/svg&gt; &lt;br&gt;}  

   ]

]

%&gt;

&lt;INPUT TYPE="SUBMIT" NAME="Square" VALUE="Square"&gt;&lt;br&gt;&lt;br&gt;

&lt;%

if not empty? request/content [

   if (first request/content) = 'Square  [

       print {&lt;svg width="100" height="100"&gt;

       &lt;rect width="100" height="100" style="fill:rgb(0,0,255);stroke-width:10;stroke:rgb(0,0,0)" /&gt;

       &lt;/svg&gt; &lt;br&gt;}  

   ]

]

%&gt;

&lt;INPUT TYPE="SUBMIT" NAME="Circle" VALUE="Circle"&gt;&lt;br&gt;&lt;br&gt;

&lt;%

if not empty? request/content [

   if (first request/content) = 'Circle  [

       print {&lt;svg width="100" height="100"&gt;

       &lt;circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" /&gt;

       &lt;/svg&gt; &lt;br&gt;}  

   ]

]

%&gt;

&lt;/FORM&gt;

&lt;/BODY&gt;

&lt;/HTML&gt;

![](http://helpin.red/lib/NewItem216.png)
