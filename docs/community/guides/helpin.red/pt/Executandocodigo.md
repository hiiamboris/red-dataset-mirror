Original URL: <http://helpin.red/pt/Executandocodigo.html>

# Executando código

* * *

* * *

Claro que você pode salvar o seu script como um arquivo e executar do command prompt, como um argumento do Red, assim:

C:\\Users\\you\\whatever&gt; red-063.exe myprogram.red  

Isto abre o interpretador Red, abre o console (REPL) e executa o seu script.

Mas quando o Red já está sendo executado, você pode usar a palavra pré-definida  do .

### native! do

Avalia o código no seu argumento. Em outras palavras: executa o código. Este argumento pode ser um block, um  [arquivo](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html), uma função ou qualquer outro valor.

&gt;&gt; do \[loop 3 \[print "hello"]]  
hello  
hello  
hello

Dê uma olhada no capítulo [Arquivos](http://helpin.red/Arquivos.html) antes de continuar.

Por exemplo, se você salvou um script Red como myprogram.txt você pode executá-lo do console digitando isto:

&gt;&gt; do %myprogram.txt

Note que neste exemplo o interpretador Red e o arquivo texto estão na mesma pasta, se não for assim, você tem de fornecer o caminho (path) correto.

Ainda, se você digitar:

&gt;&gt; a: load %myprogram.txt

E depois:

&gt;&gt; do a

...o seu programa é executado normalmente.

do, [load](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html) e [save](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html) são melhor entendidos se você pensar no console do Red como a tela de algum computador dos anos 80 rodando alguma versão de BASIC. Você pode carregar um programa ( load ), salvá-lo ( save ) ou executá-lo ( do ).

Você pode ainda carregar e executar funções salvas como texto:

&gt;&gt; do load %myfunction.txt

 Note que você pode fazer isto tudo dentro de um script Red,! Então, é um comando poderoso.
