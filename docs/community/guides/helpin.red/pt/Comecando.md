Original URL: <http://helpin.red/pt/Comecando.html>

# Começando

* * *

* * *

A primeira coisa, é claro, é baixar o executável do Red. Você pode achar o download [aqui](https://www.red-lang.org/p/download.html).

Quando você dá um duplo clique no executável, ele simplesmente abre o console (também chamado REPL) no seu desktop. Na primeira vez que você roda o executável, ele também faz algumas compilações, veja nota adiante.

Instruções para rodar scripts estão no capítulo ["Hello world" - compilar e executar](http://helpin.red/Helloworld-compilareexecutar.html) mas, primeiro, acho que você deve escolher um editor de texto.

Escolhendo um editor

Você pode simplesmente escrever seus scripts em um editor que salve o arquivo como um texto puro (p. ex. o Notepad), e então usar o Red para executá-lo através da linha de comando, mas isso não é muito amigável. Existem várias opções que podem deixar sua vida muito mais fácil.

O website do Red sugere:

- [Visual Studio Code](https://code.visualstudio.com/) com [Red extension](https://marketplace.visualstudio.com/items?itemName=red-auto.red) .
- [Cloud9](https://aws.amazon.com/cloud9/?origin=c9io) editor, que roda no browser ([setup instructions for Red](https://github.com/red/red/wiki/Install-Red-in-Cloud9-IDE)).

Eu acrescento o [Notepad++](https://notepad-plus-plus.org/download/v7.5.6.html) a estas sugestões, pois é um editor leve e muito popular. O Red se orgulha de ser um único arquivo sem instalação ou setup. Bem, se você aprecia estas qualidades do Red, você vai gostar de usar o Notepad++, especialmente se configurado como [Rededitor](http://helpin.red/Rededitor.html).

Em todo este trabalho eu uso o Notepad++.

Eu também fiz um [um capítulo sobre o setup do Visual Studio Code](http://helpin.red/Setup-VisualStudio.html). É um editor mais sofisticado que tem muitas coisas que o Notepad++ não tem.

![](http://helpin.red/lib/NewItem103.png)

Informações que podem ser úteis:

Na primeira vez que você roda o executável do Red, ele cria alguns arquivos em C:\\ProgramData\\Red\\ . Se você instalar um novo release de Red, eu aconselho você a apagar todos os arquivos que estão dentro desta pasta. Se você não fizer isso, a não ser que você especifique o path para o novo release cada vez que rodar um script, o Windows vai continuar usando o release velho como default.

Um script de Red é um arquivo de texto puro. Ele pode ter qualquer extensão, mas é uma boa ideia dar a eles a extensão .red, já que, quando você usar editores de texto, você vai querer que eles reconheçam a linguagem que você está usando.

Você provavelmente vai querer também que o Windows associe a extensão .red ao arquivo executável Red. A maneira mais fácil de fazer isso é clicar com o botão direito em um arquivo com a extensão .red e escolher "Open with/Choose another app":

![](http://helpin.red/lib/associate2.png)

Então navege até "Look for another app on this PC", marque o checkbox "Always use this app to open .red files" clique em "Look for another app on this PC" e selecione o executável Red. Todo o arquivo com a extensão .red vai ficar assim associada ao executável Red.

![](http://helpin.red/lib/associate1.png)
