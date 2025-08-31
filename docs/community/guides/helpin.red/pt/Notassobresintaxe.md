Original URL: <http://helpin.red/pt/Notassobresintaxe.html>

# Notas sobre sintaxe

* * *

* * *

- Letras maiúsculas ou minúsculas são indiferentes para o Red, mas existem algumas exceções, a mais relevante é que um programa precisa começar com Red (não REd nem red).
- Caracteres de nova linha new-line são ignorados pelo Red, uma exceção é um  new-line dentro de uma string.

Nota da tradução: Não consegui encontrar em português uma palavra que traduzisse o exato sentido de "evaluate" no contexto do processamento de dados como é feito pelo Red: não só com números mas com palavras e rotinas. Assim vou usar a palavra "computação", que não me parece perfeita mas...

- Red é uma linguagem funcional, significando que ela avalia, ou computa (evaluates) resultados. A ordem desta computação (ordem de execução das funções)  não é usual e é bom você dar uma olhada no capítulo [Ordem de computação](http://helpin.red/Avaliacaocomputacao.html).

(os próximos tópicos podem não ser exatos, mas até agora explicam o funcionamento do Red satisfatoriamente)

- um script de Red é uma longa cadeia de "palavras" ("words"). Estas palavras podem estar associadas a dados ou ações.
- "palavras" são separadas por um ou mais espaços em branco.
- o Red mantém um dicionário com as palavras pré-definidas e as palavras criadas pelo usuário.
- "palavras" podem ser agrupadas em "blocos" delimitados por colchetes ("\[" e "]"). Blocos não são necessariamente rotinas, são só grupos de "palavras" que podem ou não ser "avaliados" por uma ação.
- todos os dados do programa estão dentro do próprio programa. Se são acrescentados dados externos, estes são adicionados à lista de "palavras" do programa.
- toda palavra tem que ter um valor quando avaliada. Este valor pode vir:
  
  - da computação, se a palavra for associada a uma ação;
  - da própria palavra, quando esta for associada a um dado;
  - de outra palavra ou bloco. Isto é feito com o símbolo de atribuição, que é dois-pontos (":"), seguido pela palavra ou bloco que se quer associar (por exemplo: meuQuarto: 33).

<!--THE END-->

- Me parece que em Red, você pode dizer que a variável é atribuida aos dados, e não o contrário. Na verdade, não existem "variáveis" em Red, só palavras que são associadas a dados.
- Copiar palavras (variáveis) em Red requer muito cuidado. Quando você quiser fazer uma cópia realmente independente de uma palavra (variável), você deve usar a palavra pré-definida (comando) copy  . Veja o capítulo [Copiando](http://helpin.red/Copiando.html).
- Assim como "copiar", "limpar" uma [série](http://helpin.red/BlocksSeries.html) (note que todas as strings são séries) também requer cuidado. Simplesmente atribuir "" (string vazio) o zero à série pode não produzir os resultados esperados. A lógica interna do Red faz com que ele pareça "lembrar" de coisas de uma forma inesperada. Então, para limpar uma série, você deve usar a palavra pré-definida  clear.
- Toda palavra tem um datatype. Red tem um número notavelmente grande de datatypes. Eles estão listados no capítulo [Datatypes](http://helpin.red/Datatypes.html) . O nome de um datatype é sempre seguido por um ponto de exclamação.
- Quando uma palavra é criada pela primeira vez, ela tem o datatype word! que é usado assim:

Notação

Significado

palavra

Obtém o valor natural da palavra. (se o valor for uma função, avalia a função, senão, retorna o valor).

palavra:

Associa o valor da palavra (como atribuição) a um valor.

:palavra

Obtém o valor da palavra sem computar o resultado (Útil par obter o valor de uma função)

'palavra

Trata a palavra como um valor em si própria (um símbolo). Não avalia o seu valor.

/palavra

Trata a palavra como um refinamento. Usado para argumentos opcionais.

##### Uma visão um tanto simplificada do fluxo do Red:

![](http://helpin.red/lib/syntax1.png)

Nota: A função que obtém dados anteriores a ela (a terceira da direita para a esquerda) represnta um operador infixo, como "+", "-" , "\*" , "/" etc.

##### Refinamentos

Muitas ações em Red admitem "refinamentos". Um refinamento é declarado adicionando "/&lt;refinamento&gt;" ao comando (palavra pré-definida) e modifica seu funcionamento.

##### []()Comentando o código:

Todo o texto depois de um ponto-e-vírgula (;) em uma linha é ignorado pelo interpretador.  Também existe a função interna comment . Um grupo de words após comment também será ignorado pelo interpretador. Esse grupo de palavras deve estar dentro de  " ", { } ou \[ ] .

Eu também notei que qualquer texto escrito no código-fonte antes do "prólogo" do Red ( Red \[ ... ] ), no início, também é ignorado pelo interpretador, mas não tenho certeza se essa é uma maneira segura de adicionar informação ao código.

Exemplos de comentários:

Me parece que qualquer coisa escrita aqui, antes do código,

é ignorada.

Red [                                        ; Aqui começa o prólogo

 Author: "Ungaretti"                        ; você pode adicionar comentários depois de ";"

 Date: "september 2018"                ; mas apenas na mesma linha.

 Purpose: "to show how to comment the code"

]

; Um prólogo deve ser informativo

comment [ Este é um comentário multi-linhas

usando o colchetes.]

print "End of first comment."

comment " This is a comment."        ; se você usa aspas o comentário

                                               ; é limitado a uma linha

print "End of second comment."

comment { Essa me parece a melhor maneira

de fazer comentários multi-linhas: usando

comment e chaves}

print "End of third comment."

{estranhamente, o interpretador parece ignorar texto

dentro de chaves, mesmo sem o uso do comando "comment".

Me parece bem elegante, mas cuidado, não vi nada na

documentação sobre isso}

print "End of the fourth, strange, comment."

End of first comment.

End of second comment.

End of third comment.

End of the fourth, strange, comment.
