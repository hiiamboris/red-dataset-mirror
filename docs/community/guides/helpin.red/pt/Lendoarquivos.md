Original URL: <http://helpin.red/pt/Lendoarquivos.html>

# Lendo arquivos

* * *

### Lendo arquivos

* * *

##### Lendo arquivos como texto:

action! read

&gt;&gt; a: read %mySecondFile.txt  
\== {First line;^/Second line;^/Third line.^/Fourth line;^/Fifth li

Agora a palavra (variável) "a" tem todo o conteúdo do arquivo:

&gt;&gt; print a  
First line;  
Second line;  
Third line.  
Fourth line;  
Fifth line;  
Sixth line.

##### Lendo arquivos como séries onde cada linha é um elemento:

Note que a palavra (variável) a acima é, por enquanto, só texto com newlines. Se você quiser ler o arquivo como uma série, tendo cada linha como um elemento, você deve usar read/lines:

&gt;&gt; a: read/lines %mySecondFile.txt  
\== ["First line;" "Second line;" "Third line." "Fourth line;"...

&gt;&gt; print pick a 2  
Second line;

##### Read refinements:

##### /part        =&gt; Leitura parcial de um dado número de elementos.

##### /seek        =&gt; Lê a partir de uma posição específica (source relative).

##### /binary      =&gt; Preserva o conteúdo (binário).

##### /lines       =&gt; Converte para bloco de strings.

##### /info        =&gt;

##### /as          =&gt; Lê com a codificação especificada, o default é 'UTF-8.

function! load

Lendo arquivos como séries, onde cada palavra (separada por espaço) é um elemento:

Neste caso, você deve usar load ao invés de read:

&gt;&gt; a: load %mySecondFile.txt  
\== [First line Second line Third line.  
               Fourth line Fifth...

&gt;&gt; print pick a 2  
line

##### Lendo e escrevendo arquivos binários:

Para ler ou escrever um arquivo binário como uma imagem ou um som, você deve usar o refinamento /binary . O código abaixo carrega uma imagem bitmap para uma palavra (variável) e salva essa imagem com outro nome:

&gt;&gt; a: read/binary %heart.bmp  
\== #{  
424D660700000000000036000000280000001E00000014000000010...  
&gt;&gt; write/binary %newheart.bmp a

##### Load refinements:

##### /header      =&gt; &lt;em discussão&gt;.

##### /all         =&gt; Carrega todos os valores e retorna um bloco..

##### /trap        =&gt; Carrebga todos os valores, retorna \[\[values] position error].

##### /next        =&gt; Carrega apenas o próximo valor.

##### /part        =&gt;

##### /into        =&gt; Põe o resultado em um bloco dado ao invés de criar um novo bloco.

##### /as          =&gt; Especifica o tipo de dados. Use NONE para carregar como código.
