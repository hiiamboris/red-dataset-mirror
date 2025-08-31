Original URL: <http://helpin.red/pt/Introducao.html>

# Introdução

* * *

* * *

Sobre Red

- Red é uma linguagem de programação que cabe em um único executável com cerca de 1MB. Sem instalação, sem setup
- Red é gratuito e open-source.
- Red é interpretado, mas você pode compilar seu código para gerar executáveis standalone.
- Red executa alguma compilação antes da interpretação, então é bem rápido.
- Red é simples, sem "bloat".
- Red está em desenvolvimento, mas o objetivo é:
  
  - ser multi-plataforma;
  - ter ferramentas gráficas para todos os sistemas operacionais;
  - ser uma linguagem de programação full-stack ou seja, do mais baixo ao mais alto nível.
- Red é a evolução open-source do [Rebol](http://rebol.com/). Se você quer conhecer algumas das características do Red que ainda não estão disponíveis, você deve baixar e testar o Rebol, mas Red é o futuro.
- Red está sendo desenvolvido por um grupo liderado por Nenad Rakocevic.
- Recentemente, Red levantou fundos substanciais com uma [ICO](https://ico.red-lang.org/) e foi criada a Red Foundation em Paris, França, então, o Red está aqui para ficar.

Uma amostra de Red:

Red \[needs: view]

view [

   f1: field "First name"

   f2: field "Last name"

   button "Greet Me!" [

       t1/text: rejoin \["Have a very nice day " f1/text " " f2/text "!"]

   ]

   return

   t1: text "" 200

]

![](http://helpin.red/lib/NewItem53.png)

Se você achou interessante, dê uma olhada em  [Short Red Examples](http://redprogramming.com/Short%20Red%20Code%20Examples.html), por Nick Antonaccio.

Sobre este trabalho:

É uma evolução do [Red Language Notebook](https://www.gitbook.com/book/ungaretti/red-language-notebook/details).  
Eu usei [HelpNDoc](https://www.helpndoc.com/) para desenvolver uma interface mais útil e completa.

Notas:

- Eu uso Windows, então todo esse trabalho é feito em cima deste sistema.
- Eu não sou um programador experiente em Red, aliás, eu nem sou um programador.
- Esta não é uma referência completa de Red (ainda?).
- Muitas vezes eu não uso a melhor formatação para os scripts, dê uma olhada em [Red's coding style guide](https://doc.red-lang.org/v/v0.6.0/Coding-Style-Guide.html).
- Eu tento fazer meu trabalho original, mas parte foi copiada da documentação oficial do Red ou baseada em exemplos que encontrei em:

<!--THE END-->

- - [red-by-example.org](http://www.red-by-example.org/index.html)[](https://ungaretti.gitbooks.io/red-language-notebook/content/www.red-by-example.org) [por Arie van Wingerden e Mike Parr](https://ungaretti.gitbooks.io/red-language-notebook/content/www.red-by-example.org)
  - [mycode4fun.com.uk](http://www.mycode4fun.co.uk/red-beginners-reference-guide)  por Alan Brack
  - [redprogramming.com](http://redprogramming.com/Home.html) por Nick Antonaccio

Ainda, muita coisa foi obtida da comunidade, em [gitter.im/red/home.](https://gitter.im/red/home)

Obrigado a todos!!!

- Se você não encontrar alguma coisa na documentação do Red, você sempre pode pesquisar em [www.rebol.com](http://www.rebol.com/docs.html)[.](http://www.rebol.com/docs.html)
