Original URL: <http://helpin.red/pt/Helloworld-compilareexecutar.html>

# "Hello world" - compilar e executar

* * *

* * *

### "Hello world" no console:

Escreva o código abaixo no Notepad++, salve como "MyFirst.red" na pasta "programs" dentro da pasta da sua IDE e execute (run/red-run). Você vai ter:

![](http://helpin.red/lib/helloworld12.png)

A janela a direita é o console, às vezes chamado de REPL. Clique neste console, digite print "I can use the console too!" e aperte enter:

![](http://helpin.red/lib/helloworld2.png)

Now type 3 + 7 and press enter:

![](http://helpin.red/lib/helloworld3.png)

Note que é preciso ter um espaço entre as palavras. Espaços são delimitadores no Red e sem eles você tem erros:

Hello world!  
&gt;&gt; print "I can use the console too!"  
I can use the console too!

&gt;&gt; 3 + 7  
\== 10

&gt;&gt; 3+7                ;sem espaços!!!!!  
\*\** Syntax Error: invalid integer! at "3+7"  
\*\** Where: do  
\*\** Stack: load

Note que depois de  3+7 eu escrevi ;sem espaços!!!!! . O Red ignora tudo que vem depois do ponto-e-vírgula, é assim que se faz comentários no corpo do programa.

##### De volta ao programa (também chamado script):

Linguagens interpretadas executam uma linha de código de cada vez. Programas para linguagens interpretadas são chamados "scripts". Red não é 100% interpretado, uma vez que realiza alguma compilação antes de executar, mas os programas para Red são chamados scripts de qualquer forma.

Na primeira linha nós temos Red \[ ]. Como eu disse antes, todo script para Red tem que começar com Red. Não RED nem red, mas Red. Depois de Red nós temos os colchetes. Em Red, qualquer coisa dentro de colchetes é chamada de um "bloco " ("block"). Este primeiro bloco é destinado a conter informações sobre o programa. A maior parte desta informação é opcional, com algumas exceções, a mais relevante sendo a declaração de bibliotecas (mais sobre isso daqui a pouco).

Um primeiro bloco bem completo poderia ser:

Red [

       title: "Hello World"

       author: "My name"

       version: 1.1

       purpose {

               To print a greeting to the planet.

               Notice that multi-line text goes

               inside curly brackets.

               }

       ]

print "Hello World!"

### "Hello world" com interface gráfica - GUI:

Uma das características mais relevantes do Red é a sua capacidade de gerar interfaces gráficas com um código muito simples. Ele faz um uso bem inteligente das  APIs do sistema operacional. Um "Hello world" com GUI seria:

![](http://helpin.red/lib/helloworld5.png)

Note que eu escrevi  needs: 'view no bloco de cabeçalho (o apóstrofe é opcional). Isso diz ao Red para carregar a biblioteca gráfica "view" . Isto não é estritamente necessário se você está usando o console gráfico, já que a biblioteca "view" é carregada automaticamente, mas é uma boa idéia deixar isso explícito sempre.

### Compilando seu "Hello world" para um arquivo executável:

Voce pode criar um executável (.exe) do seu "Hello World".

Se você salvou o seu "Hello world" (com GUI) como "MyFirst.red" na pasta "programs" você deve ter algo assim no seu computador:

![](http://helpin.red/lib/helloworld6.png)

Para deixar a coisa mais clara, faça uma cópia do seu executável Red e cole na mesma pasta onde está o seu programa. De outra forma, o resultado da sua compilação vai ficar na mesma parta da IDE Red, perdidos no meio de todos aqueles arquivos.

![](http://helpin.red/lib/compile2.png)

Abra o Command Prompt. Se você não sabe como, escreva "cmd" no campo de busca do Windows (lupa) e procure o ícone do Command Prompt:

![](http://helpin.red/lib/compile1.png)

No Command prompt, digite o caminho do seu executável Red (o executável que você acabou de copiar na pasta "programs") seguido de  -r -t windows e o nome do seu programa:

C:\\Users\\André\\Documents\\Rededitor\\myprograms&gt; red.exe -r -t windows Myfirst.red

Note: If you compile to windows, i believe you must always load the GUI library (use needs: view). If you just want a program that runs on CLI alone, use MSDOS as target.

O Red vai dar uma série de mensagens no Command Prompt e, depois de mais ou menos um minuto, você vai ter o executável na sua pasta "programs":

![](http://helpin.red/lib/compile7.png)

Dê um duplo clique nele e você deve ver o seu "Hello World" gráfico (GUI) na sua tela.

### Mais algumas observações sobre compilação:

Eu notei que a versão compilada do programa pode não se comportar como a interpretada. Eu tive problemas com prints que eu deixei no código, assim, parece que chamar comandos do console no modo executável não é uma boa idéia. Eu também tive problemas com variáveis (palavras) de escopo global dentro de funções. O compilador parece não reconhecê-las como variáveis globais. Eu solucionei este último problema de duas maneiras::

1. Eu "declarei" minhas variáveis, ou seja, eu dei um valor a elas no início do programa. Os valores não são importantes, já que vão mudar depois.

<!--THE END-->

1. Eu suei a opção de compilação  "-e" (que não é listada no github, parece que é experimental). -e significa "encap". Ela faz que você obtenha um executável simples, mas o código é internamente interpretado. compiler option (not listed in github, as it seems to be experimental).

Você pode também compilar o MyFirst.red usando apenas a opção -c (compile) :

C:\\Users\\André\\Documents\\Rededitor\\myprograms&gt; red.exe -c Myfirst.red

Neste caso você vai obter os seguintes arquivos na sua pasta:

![](http://helpin.red/lib/compile4.png)

Os dois únicos arquivos que você precisa para rodar o programa são o libRedRT.dll e o MyFirst.exe.

Entretanto, neste caso, você vai notar que o Red mantém um Command Prompt aberto enquando roda o programa. Se você quiser evitar isso (quem não quer?) use a opção -t . Esta opção compila para uma plataforma específica:

C:\\Users\\André\\Documents\\Rededitor\\myprograms&gt; red.exe -c -t windows Myfirst.red

O resultado vai ser aquele mesmo conjunto de arquivos, incluindo a dll, mas o Command Prompt não fica mais aberto durante a execução.

Você deveria poder compilar para todas as plataformas listadas abaixo, mas como o Red ainda está evoluindo, algumas ainda apresentam problemas. Por exemplo, a plataforma Android ainda não é suportada.

#### Do github do Red:

###### Cross-compilation targets:

MSDOS        : Windows, x86, console (+ GUI) applications  
Windows      : Windows, x86, GUI applications  
WindowsXP    : Windows, x86, GUI applications, no touch API  
Linux        : GNU/Linux, x86  
Linux-ARM    : GNU/Linux, ARMv5, armel (soft-float)  
RPi          : GNU/Linux, ARMv5, armhf (hard-float)  
Darwin       : macOS Intel, console-only applications  
macOS        : macOS Intel, applications bundles  
Syllable     : Syllable OS, x86  
FreeBSD      : FreeBSD, x86  
Android      : Android, ARMv5  
Android-x86  : Android, x86

###### Compiler options:

-c, --compile                  : Generate an executable in the working  
                                folder, using libRedRT. (developement mode)  
\-d, --debug, --debug-stabs     : Compile source file in debug mode. STABS  
                                is supported for Linux targets.  
\-dlib, --dynamic-lib           : Generate a shared library from the source  
                                file.  
\-h, --help                     : Output this help text.  
\-o &lt;file&gt;, --output &lt;file&gt;     : Specify a non-default \[path/]\[name] for  
                                the generated binary file.  
\-r, --release                  : Compile in release mode, linking everything  
                                together (default: development mode).  
\-s, --show-expanded            : Output result of Red source code expansion by  
                                the preprocessor.  
\-t &lt;ID&gt;, --target &lt;ID&gt;         : Cross-compile to a different platform  
                                target than the current one (see targets  
                                table below).  
\-u, --update-libRedRT          : Rebuild libRedRT and compile the input script  
                                 (only for Red scripts with R/S code).  
\-v &lt;level&gt;, --verbose &lt;level&gt;  : Set compilation verbosity level, 1-3 for  
                                Red, 4-11 for Red/System.  
\-V, --version                  : Output Red's executable version in x.y.z  
                                format.  
\--config \[...]                 : Provides compilation settings as a block  
                                of \`name: value\` pairs.  
\--cli                          : Run the command-line REPL instead of the  
                                graphical console.  
\--no-runtime                   : Do not include runtime during Red/System  
                                source compilation.  
\--red-only                     : Stop just after Red-level compilation.  
                                Use higher verbose level to see compiler  
                                output. (internal debugging purpose)

Também tem a opção  -e . Veja a observação lá em cima.

### []()Rodando o Red no console do Windows (cmd):

Para executar o Red no modo linha de comando, abra o cmd prompt, mude o diretório para a  pasta onde você tem o seu executável do Red e digite o nome deste executável seguido de --cli . Note que são dois traços. Eu tenho red-063.exe, então:

C:\\Users\\André\\Documents\\RedIDE&gt;red-063.exe --cli  

--== Red 0.6.3 ==--                                

Type HELP for starting information.                

&gt;&gt;

Passando argumentos para um script Red:

Tudo que vem depois no nome do script na linha de comando é passado para o script como argumentos. Estes argumentos são guardados em system/options/args como um bloco.

Este script foi salvo com o nome de "arguments.red":

Red \[]

probe system/options/args

Executado da linha de comando (CLI):

C:\\Users\\André\\Documents\\RedIDE\\programs&gt;red-063.exe arguments.red foo boo loo

O output do script no console do Red é:

\["foo" "boo" "loo"]

&gt;&gt;
