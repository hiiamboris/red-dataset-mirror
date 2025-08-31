Original URL: <http://helpin.red/pt/InterfacecomoSistemaOperacional.html>

# Interface com o Sistema Operacional

* * *

* * *

### native! call

Executa um comando em shell. Na maior parte dos casos, é a mesma coisa que escrever no commando prompt (CLI), mas tem algumas particularidades.

O código abaixo abre o Windows Explorer:

&gt;&gt; call "explorer.exe"  
\== 11272                        ; este é o número do processo aberto.

Isso também funciona:

&gt;&gt; str: "explorer.exe"  
\== "explorer.exe"

&gt;&gt; call str  
\== 11916

Entretanto, o código abaixo cria o processo, mas não abre o Notepad na tela:

&gt;&gt; call "notepad.exe"  
\== 4180

Se você busca um comportamento mais próximo a digitar o comando no shell, você deve usar o refinamento /shell:

&gt;&gt; call/shell "notepad.exe"                ;abre o notepad na tela  
\== 6524

Outros refinamentos:

 /wait

Roda o comando e espera até o comando terminar sua execução. Cuidado: se você usar /wait em um commando que você não pode terminar (como call "notepad.exe" acima), o Red vai esperar... e esperar... indefinidamente.

 /input - nós fornecemos uma string!, um file! ou um  binary!, que vai ser redirecionado para stdin.

Não entendo este comando, me parece a mesma coisa que simplesmente call, uma vez que nós fornecemos a string ou o arquivo de qualquer forma.

 /output

Nós fornecemos uma string! , file! ou um binary! que vai receber o stdout redirecionado do comando. Note que o output é appended.

O código a seguir cria uma arquivo de texo ou o output do shell para o comando "dir" (uma lista de todos os arquivos e pastas do path corrente):

&gt;&gt; call/output "dir" %mycall.txt  
\== 0

Este cria uma (longa) string com os resultados de "dir":

&gt;&gt; a: ""  
\== ""

&gt;&gt; call/output "dir" a  
\== 0

&gt;&gt; a  
\== { Volume in drive C has no label.^/ Volume Serial Number is BC5 ;...

 /show

Força a exibição da janela de shell (Windows only). Seu script vai rodar com o command prompt do Windows aberto.

&gt;&gt; call/shell/show "notepad.exe"  
\== 12372

 /console

Roda o comando com o I/O redirecionado para o console. Por enquanto funciona apenas se você está rodando o Red do CLI, não funciona no console GUI normal do Red.

### native! write-clipboard &amp;  read-clipboard

Escreve e lê do clipboard do sistema operacional:

&gt;&gt; write-clipboard "You could paste this somewhere you find useful"  
\== true

&gt;&gt; print read-clipboard  
You could paste this somewhere you find useful
