Original URL: <http://helpin.red/pt/Convencoesenotacoes.html>

# Convenções e notações

* * *

* * *

1- Sintaxe colorida

Eu acho que a sintaxe colorida ajuda muito os principiantes, pois existem tantas palavras pré-definidas em Red e o seu código é muito conciso. Sempre que possível, eu copio e colo a sintexe colorida do Notepad++\[1].

Red \[]

a: "Hello"

b: 123

c: \[33 "fox"]

print c

\[1] - Para compiar e colar a sintaxe colorida do Notepad++ Eu uso um plugin chamado NppExport.

O console é representado por um fundo cinza:

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

Quando os exemplos são dados como commandos digitados no console, eu destaco em negrito aquilo que é digitado pelo usuário. Isso evita confusão, pois algumas vezes você pode copiar e colar o texto dos exemplos e isso pode não funcionar direito.

Eu também adiciono uma linha em branco entre os comandos, para deixar mais legível, e às vezes coloco um fundo colorido para descacar coisas importantes. Isso tudo é adicionado durante a edição, portanto, cuidado ao copiar e colar.

&gt;&gt; a: make hash! \[a 33 b 44 c 52]  
\== make hash! \[a 33 b 44 c 52]  
                               ;esta linha vazia não existe no console  
&gt;&gt; select a \[c]  
\== 52  
                               ;nem esta  
&gt;&gt; select a 'c  
\== 52                        ;comentários e fundos coloridos são adicionados na edição
