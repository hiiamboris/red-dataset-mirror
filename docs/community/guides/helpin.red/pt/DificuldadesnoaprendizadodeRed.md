Original URL: <http://helpin.red/pt/DificuldadesnoaprendizadodeRed.html>

# Dificuldades no aprendizado de Red

* * *

* * *

Red é muito produtivo. É a linguagem de programação mais produtiva que conheço. Você pode fazer tanto usando tão pouco código! Também é muito fácil de usar depois de aprender, mas gostaria de comentar aqui alguns dos problemas que encontrei no processo. Você não pode realmente evitar essas armadilhas, mas sua jornada pode ser mais fácil se você estiver ciente delas.

\# 1 - Nova maneira de pensar. Demora mais tempo a aprender do que o esperado:

A produtividade do Red tem um preço. Embora os exemplos básicos sejam fáceis, parece-me que é muito difícil fazer programação real em Red sem entender seus principais conceitos. O Red não é feito de alguns blocos básicos que você monta como quiser, em Red tudo está interconectado. Avaliações, tipos de dados e dialetos permeiam toda a codificação.Trabalhar com o conceito de "código é dados e dados são código" requer prática para se acostumar. É como aprender uma língua estrangeira, você absorve pela repetição.

\# 2 - Tipos de dados incorretos em argumentos:

Uma palavra em Red pode ter qualquer um dos muitos datatypes disponíveis, mas as funções esperam um conjunto muito definido de datatypes em seus argumentos. Logo logo você encontrará um bug em que uma "variável" aparentemente inocente está bloqueando seu script ou gerando resultados inesperados sem motivo aparente. Uma boa ideia é iniciar sua depuração, verificando o tipo de dados de seus argumentos. Uma abordagem básica seria inserir alguns " print type? &lt;Variável&gt; " em seu código quando as coisas dão errado. Você pode descobrir quais tipos de dados sua função espera digitando " ? &lt;Function&gt; " no console.

\# 3 - os dialetos usam apenas os comandos do dialeto:

Em breve você usará os dialetos internos do Red, como VID (para GUI), parse ou draw, e tentará inserir estruturas do Red dentro do bloco dialeto. Não vai funcionar. Os dialetos podem (ou não) ter seus próprios comandos para permitir que você use o Red normal dentro de seu bloco, mas você não pode simplesmente inserir um loop ou uma estrutura de controle sem a codificação adequada. Por exemplo, no VID, você pode usar do \[&lt;Red code&gt;], mas outros dialetos exigem que você use funções externas e, em seguida, compute os resultados usando compose .  Esse é um assunto para mais adiante mas, por enquanto, apenas tome cuidado.

Assim:

Red \[needs: view]

parse \[xxx] \[só código parse aqui]

view  [

       só comandos view aqui

       draw\[só comandos draw aqui]

]
