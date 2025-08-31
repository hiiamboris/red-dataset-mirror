Original URL: <http://helpin.red/pt/InstalandoeconfigurandooCheyenne.html>

# Instalando e configurando o Cheyenne

* * *

* * *

Vá para [https://www.cheyenne-server.org/download.shtml](https://www.cheyenne-server.org/download.shtml) e baixe o zip. Eu escolhi Cheyenne Pro porque é menor, mas você pode receber Cheyenne Command se você quiser alguns extras.

Descompacte-o em qualquer lugar no seu computador. Eu descompactei em uma pasta chamada RED, então eu tenho isso:

![](http://helpin.red/lib/NewItem214.png)

Agora crie uma pasta chamada "www" dentro da pasta do Cheyenne, assim:

![](http://helpin.red/lib/NewItem213.png)

Agora copie o HTML abaixo em algum editor de texto e salve-o como index.html dentro da pasta www :

&lt;!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"&gt;

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

&lt;/body&gt;

&lt;/html&gt;

Fica assim:

![](http://helpin.red/lib/NewItem212.png)

Agora dê um duplo clique no executável Cheyenne. Eu tive um par de avisos do Windows Defender e escolhi mais informações / executar de qualquer maneira .

Na barra de tarefas, um pequeno ícone do Rebol avisa que Cheyenne está a funcionar:

![](http://helpin.red/lib/NewItem211.png)

Agora abra seu navegador favorito, digite "localhost" na barra de endereços e pressione enter. O browser deve ir para a página html que você acabou de criar:

![](http://helpin.red/lib/NewItem210.png)

Após essa primeira execução, Cheyenne cria alguns arquivos e pastas extras e deve ficar assim:

![](http://helpin.red/lib/NewItem209.png)

Você pode sair do Cheyenne clicando com o botão direito do mouse no ícone da barra de tarefas e escolhendo Quit :

![](http://helpin.red/lib/NewItem208.png)

Portas são os "canais" da comunicação do computador. Por padrão, o Cheyenne escuta a porta 80, mas você pode querer mudar isso, seja para evitar conflitos ou, talvez (?), adicionar alguma segurança extra. Um número de porta é um inteiro  de 16 bits, variando de 0 a 65535, mas sugiro que você escolha um número aleatório em torno de 30000.

A propósito, usar o Cheyenne como descrito neste texto deve ser seguro, a menos que você abra explicitamente suas portas no modem DSL e no firewall no seu PC.

Para alterar a porta que o Cheyenne escuta para, por exemplo, 32852, abra o arquivo httpd.cfg com um editor de texto simples e adicione a seguinte linha:

       ...

;--- define alternative and/or multiple listen ports (by default, cheyenne will run on 80)

       ;listen \[80 10443]

       listen \[32852]

       bind SSI to \[.shtml .shtm]

       bind php-fcgi to \[.php .php3 .php4]

       ...

Ou você pode apenas descomentar a linha de cima e mudar os números das portas (Cheyenne pode ouvir mais de uma porta).

Agora você pode acessar seu index.html digitando na barra de endereços do seu host localhost: &lt;número da porta&gt; :

![](http://helpin.red/lib/NewItem207.png)

Apenas lembrando que os números de porta comuns (evite-os) são:

20: Transferência de dados do protocolo de transferência de arquivos (FTP)

21: Controle de Comando do Protocolo de Transferência de Arquivo (FTP)

22: Login Seguro do Secure Shell (SSH)

23: serviço de login remoto Telnet, mensagens de texto não criptografadas

25: roteamento de email SMTP (Simple Mail Transfer Protocol)

53: serviço Sistema de Nomes de Domínio (DNS)

80: HTTP (Hypertext Transfer Protocol) usado na World Wide Web - padrão Cheyenne

110: protocolo postal (POP3)

119: Protocolo de transferência de notícias de rede (NNTP)

123: protocolo de tempo de rede (NTP)

143: IMAP (Internet Message Access Protocol) Gerenciamento de correio digital

161: Protocolo simples de gerenciamento de rede (SNMP)

194: Internet Relay Chat (IRC)

443: HTTP Seguro (HTTPS) HTTP sobre TLS / SSL

Se você removesse todas as linhas comentadas do arquivo httpd.cfg (não faça isso), você obteria o texto abaixo, que eu acho que é uma configuração simples e auto-explicativa:

modules [

       userdir

       internal

       extapp

       static

       upload

       action

       fastcgi

       rsp

       ssi

       alias

       socket

]

globals [

       bind SSI to \[.shtml .shtm]

       bind php-fcgi to \[.php .php3 .php4]

       bind-extern CGI to \[.cgi]

       bind-extern RSP to \[.j .rsp .r]

]

default [

       root-dir %www/

       default \[%index.html %index.rsp %index.php]

       on-status-code [

               404          "/custom404.html"

       ]

       socket-app "/ws.rsp"        ws-test-app

       socket-app "/chat.rsp"        chat

       webapp [

               virtual-root "/testapp"

               root-dir %www/testapp/

               auth "/testapp/login.rsp"

       ]

]
