Original URL: <http://helpin.red/pt/Parandoaexecucao.html>

# Parando a execução

* * *

## Parando a execução

* * *

### function!  quit

### Pára a execução e sai do programa.

### Se você digitar isso no console GUI (REPL), ele fecha. Se você digitar no Command Line Interface, você só sai do interpretador Red.

/return      =&gt; Para a execução e sai do programa retornando um status para o sistema operacional. Não consegui achar um exemplo que consiga usar isso.

quit/return 3   ;passa 3 para o sistema operacional.

### function!  halt

Acho que simplesmente pára a execução do script. A documentação diz que retorna o valor 1.

### routine!   quit-return

Pára a execução com um dado status. Me parece ser a mesma coisa que  quit/return, mas é um tipo routine! , não um function! . Vá entender!

VID DLS  on-close

É um evento da VID. Executa um pedaço de código quando você fecha uma janela GUI. Mencionado também em [GUI - Tópicos avançados](http://helpin.red/Topicosavancados.html).

Execute o programa abaixo e, quando você fechar a janela, ele vai imprimir "bye!" no console.

Red \[needs: view]

view [

       on-close \[print "bye!"]        

       button \[print "click"]

]

Control-C

Digitar control-C pára a execução do e sai do interpretador no Command Line Interface, mas não no console GUI.
