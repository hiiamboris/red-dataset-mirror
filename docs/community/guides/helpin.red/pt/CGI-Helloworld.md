Original URL: <http://helpin.red/pt/CGI-Helloworld.html>

# CGI -"Hello world"

* * *

* * *

Veja também: [Quick and Easy CGI - A Beginner's Tutorial and Guide](http://www.rebol.com/docs/cgi1.html)

Faça o download do interpretador "rebol core" da página de downloads do Rebol . Salve esse executável na pasta www do seu Cheyenne.

Agora crie o seguinte script em um editor de texto simples e salve-o como myfirst.cgi na mesma pasta www.

#!www/rebol.exe -c

REBOL \[]

print "Hello world!"

print "&lt;br/&gt;"

print \["Date/time is:" now]

Sua pasta www agora deve estar assim:

![](http://helpin.red/lib/NewItem221.png)

Agora, se o seu servidor está rodando (porta 80) e você digitar localhost/myfirst.cgi na barra de endereço do seu navegador, você obtém:

![](http://helpin.red/lib/NewItem220.png)

Explicando o script:

#!www/rebol.exe -c                ; Essa linha é importante

; ela diz ao servido o

; path do interpretador.

; A opção -c diz ao Rebol

; para funcionar no modo CGI.

REBOL \[]                

print "Hello world!"                ; Manda "Hello world!" para o browser.

print "&lt;br/&gt;"                        ; carriage return.

print \["Date/time is:" now]        ; Manda data e hora.
