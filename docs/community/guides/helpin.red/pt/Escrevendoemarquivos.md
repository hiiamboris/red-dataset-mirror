Original URL: <http://helpin.red/pt/Escrevendoemarquivos.html>

# Escrevendo em arquivos

* * *

### Escrevendo em arquivos

* * *

##### Escrevendo para um arquivo texto:

action! write

##### Escreve em um arquivo, criando-o se necessário.

&gt;&gt; write %myFirstFile.txt "Once upon a time..."

##### Acrescentando (Appending) à um arquivo texto:

##### /append

Se você simplesmente usar write de novo no arquivo criado acima, ele vai ser sobrescrito (original apagado). Se você quer acrescentar texto a ele, use write/append:

&gt;&gt; write/append %myFirstFile.txt "there was a house."

Seu arquivo agora tem "Once upon a time...there was a house" .

##### Escrevendo uma série para um arquivo fazendo de cada elemento da série uma linha do arquivo:

Now lets add another file with 3 lines of text:

&gt;&gt; write/lines %mySecondFile.txt \["First line;" "Second line;" "Third line."]

##### Appending full lines:

&gt;&gt; write/append/lines %mySecondFile.txt \["Fourth line;" "Fifth line;" "Sixth line."]

Seu arquivo agora está assim:

First line;  
Second line;  
Third line.  
Fourth line;  
Fifth line;  
Sixth line.

Note que você poderia ter escrito write/lines/append. A ordem dos refinamentos não faz diferença.

##### Substituindo caracteres em um arquivo:

Para substituir caracteres em um arquivo texto, começando na posição n+1, use  write/seek %&lt;file&gt; &lt;n&gt; :

&gt;&gt; write/seek %myFirstFile.txt "NEW TEXT" 5

Agora aquele arquivo criado no início do capítulo tem: "Once NEW TEXTime...there was a house."

Refinamentos de Write :

/binary      =&gt; Preserva o conteúdo exato (binário).

/lines       =&gt; Escreve cada valor de um bloco em uma nova linha..

/info        =&gt;

/append      =&gt; Escreve no fim do arquivo.

/part        =&gt; Escrita parcial, dado o número de unidades.

/seek        =&gt; Escreve a partir de uma posição específica.

/allow       =&gt; Especifica atributos de proteção.

/as          =&gt; Escreve em uma codificação específica, o default é 'UTF-8.

function! save

Salva o valor, bloco ou outro tipo de dados para um arquivo, URL, binário ou string.

##### Diferença entre write e save:

&gt;&gt; write %myFourthFile.txt \[11 22 "three" "four" "five"]

Seu arquivo agora tem: \[11 22 "three" "four" "five"]

&gt;&gt; save %myFourthFile.txt \[11 22 "three" "four" "five"]

Seu arquivo agora tem:  11 22 "three" "four" "five"

Um uso importante de  save é de simplificar o salvamento de scripts Red para que possam ser interpretados usando a ação  do :

&gt;&gt; save %myProgram.r \[Red\[] print "hello"]  
&gt;&gt; do %myProgram.r  
hello

do, [load](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html) e [save](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html) são entendidos melhor se você pensar no console do Red como a tela de um daqueles computadores dos anos 80, rodando alguma variação da linguagem Basic. Você pode load o seu programa, salvá-lo com save , ou rodá-lo com do .
