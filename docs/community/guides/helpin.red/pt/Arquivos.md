Original URL: <http://helpin.red/pt/Arquivos.html>

# Arquivos

* * *

* * *

### Path (caminho), diretórios e arquivos

### nomes de Path

Caminhos para arquivos são escritos com um sinal de percentagem (%) seguido pela sequência de nomes de diretórios, separados por uma barra (/). No Windows, o Red faz a conversão de barras à esquerda ou à direita (/ ou \\), você não precisa se preocupar com isso.

Apenas lembrando:

- / é a raiz (root) do drive corrente;
- ./ é o diretório corrente;
- ../ é o diretório superior do diretório corrente;
- caminhos de arquivo que não começam com barra (/) são caminhos relativos;
- para se referir ao drive "C" do Windows, você deve usar: %/C/docs/file.txt
- caminhos absolutos devem ser evitados para garantir scripts que sejam independentes da máquina;

##### Um seletor gráfico de arquivos:

function! request-file

request-file abre um seletor gráfico (GUI) de arquivos e retorna o caminho completo como um  file!

&gt;&gt; request-file

![](http://helpin.red/lib/requestfile.png)

== %/C/Users/André/Documents/RED/myFirstFile.txt

Refinamentos

/title - título da janela. Exemplo: request-file/title "My file is:"  
/file - nome de arquivo ou diretório usado como padrão (default). Exemplo: request-file/file %"MyFile.txt"  
/filter -Fornece um bloco de filtros que consiste de pares compostos do nome dos filtros e os filtros propriamente ditos. Exemplo: request-file/filter \["executables" "\*.exe" "text files" "\*.txt"]  
/save - Modo de salvar arquivo. Exemplo com filtros: request-file/save/filter \["executables" "\*.exe" "text files" "\*.txt"]  
/multi - Permite seleções múltiplas, retornadas como um bloco.

##### Um seletor gráfico de diretórios:

function! request-dir

request-dir abre um seletor gráfico de diretórios e retorna o caminho completo como um  file!

![](http://helpin.red/lib/requestdir.png)

== %/C/Users/André/Documents/RED/

Refinamentos:

    /title       =&gt; título da janela.

    /dir         =&gt; Determina o diretório inicial.

    /filter      =&gt; TBD: Bloco de filtros (filter-name filter).

    /keep        =&gt; Mantém o caminho de diretório anterior.

    /multi       =&gt; TBD: Permite múltiplas seleções, retornadas como um bloco.

##### Apagando um arquivo:

action! delete

Apaga um arquivo e retorna true em caso de sucesso ou, caso contrário,  false .

&gt;&gt; delete %file.txt  
\== true

##### Obtendo o tamanho de um arquivo:

native! size?

Retorna o número de bytes de um arquivo ou, se o arquivo não existir, retorna none .

&gt;&gt; size? %myFirstFile.txt  
\== 37

#### Outras funções de diretório e arquivo:

cd or change-dir - Muda o diretório corrente.

dir, ls or list-dir - Lista o conteúdo de um dado diretório. Se nenhum argumento for dado, lista o diretório corrente.

dir? - Retorna true se o nome fornecido for um caminho ( path!) válido. Senão retorna false.

dirize - Transforma o argumento em um diretório válido. O argumento pode ser um  file! string! url!.  
Só coloca um  / no final se for necessário.

exists? - Retorna true se o argumento for um path! existente, senão retorna false .

file? - Retorna true se o argumento é um file!.

get-current-dir - Retorna o diretório corrente.

get-path? - Retorna true se o argumento é um get-path!

path? - Retorna true se argumento é um path!

split-path - Divide o caminho de um file! ou url! . Retorna um bloco contendo o caminho e o alvo.

suffix? - Retorna o sufixo de um arquivo, por exemplo: exe, txt.

what-dir - Retorna o diretório corrente como um valor file! .

to-red-file - Converte um sistema de arquivos local em um sistema independente de máquina.

to-local-file - Converte do sistema de arquivos independente de máquina para o sistema de arquivos do sistema operacional da máquina.

clean-path - Limpa os '.' e '..' de um caminho e retorna o caminho limpo.

red-complete-file

red-complete-path

set-current-dir
