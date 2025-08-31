Original URL: <http://helpin.red/pt/CGIusandoRed.html>

# CGI usando Red

* * *

* * *

Hello World!

Veja também: [Using Red as CGI](https://github.com/red/red/wiki/%5BDOC%5D-Using-Red-as-CGI)

Faça uma cópia do interpretador Red e salve esse executável na pasta www do seu Cheyenne, assim como você fez com a Rebol.

Renomeie o executável do Red para algo como redcgi.exe . Eu descobri que isso é importante porque eu já tenho o Red "instalado" no meu computador (onde meu servidor está rodando - localhost), e o sistema operacional tenta apenas executar o script normalmente, não como CGI.

Abra o arquivo httpd.cfg em um editor de texto simples e inclua .red no bloco "bind-extern CGI to", conforme mostrado:

globals [

       ;--- define alternative and/or multiple listen ports (by default, cheyenne will run on 80)

       ;listen \[80 10443]

       bind SSI to \[.shtml .shtm]

       bind php-fcgi to \[.php .php3 .php4]

       bind-extern CGI to \[.cgi .red]

       bind-extern RSP to \[.j .rsp .r]

Agora crie o seguinte script em um editor de texto simples e salve-o como myfirst.red na mesma pasta www .  --cli é importante, se não usá-lo, o Red pode tentar compilar e abrir o console GUI.

#!www/redcgi.exe --cli

Red \[]

print "Hello world!"

print "&lt;br/&gt;"

print \["Date/time is:" now]

Agora, se o seu servidor está em execução (porta 80) e você digitar localhost/myfirst.red na barra de endereços do seu navegador, você obtém:

![](http://helpin.red/lib/NewItem223.png)

Processando web forms.

Como mencionado, o Red ainda não tem suporte completo para o CGI. No entanto, acredito que seja possível recuperar e decodificar mensagens HTTP no Linux , usando o [http-tools.red](https://github.com/rebolek/red-tools/blob/master/http-tools.red) de Boleslav Březovský . Eu não sei como fazer isso no Windows.
