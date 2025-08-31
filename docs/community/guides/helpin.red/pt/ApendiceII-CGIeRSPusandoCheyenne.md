Original URL: <http://helpin.red/pt/ApendiceII-CGIeRSPusandoCheyenne.html>

# Apêndice II - CGI e RSP usando Cheyenne

* * *

* * *

O Red não tem suporte completo ao CGI (novembro de 2018). Os primeiros capítulos aqui cobrem os passos básicos usando o Rebol. Eu acredito que o comportamento do Red será muito similar, se não o mesmo. Isso não significa que você não pode usar Red para CGI. Você pode encontrar uma boa referência de como usá-lo [aqui](https://github.com/red/red/wiki/%5BDOC%5D-Using-Red-as-CGI)

Há muitas informações sobre CGI na Internet. No entanto, eu tive dificuldade com os primeiros passos, especialmente como usar o [servidor Cheyenne](https://www.cheyenne-server.org/)  no meu próprio computador, como "cobaia" para meus testes. Então eu escrevi este texto como um "guia para iniciantes". Não é um tutorial completo sobre CGI e RSP.

O que é CGI?

Common Gateway Interface (CGI), é um protocolo que permite aos servidores executar programas que geram páginas web dinamicamente, isto é: programas que geram código HTML em tempo real, "adaptados" à entrada do usuário.

O CGI foi substituído por uma grande variedade de tecnologias de programação web. Atualmente, a maioria dos desenvolvedores usa linguagens de script como o PHP para fazer o que o CGI faz.

Então por que você deveria se interessar? Bem, talvez você não queira ser um desenvolvedor da Web, apenas conectar seus scripts Red / Rebol a navegadores da Web, criar alguns aplicativos da Web, ou qualquer coisa assim. Os navegadores da Web são uma ótima maneira de exibir informações e fazer interface com o usuário. E, claro, você também pode acessar a Internet.

O que é o RSP?

Eu posso estar errado sobre isso, mas acredito que o RSP é uma coisa só do Cheyenne. É uma maneira simplificada de fazer CGI, usando o Rebol embutido no código HTML. O que acontece é que Cheyenne tem um interpretador Rebol embutido em seu código, então, ao contrário do CGI normal, no qual tem que chamar algum interpretador de script (um executável) para rodar seu script e criar o HTML, RSP são arquivos interpretados por uma espécie de Rebol nativo em Cheyenne. Além disso, Cheyenne oferece  APIs de RSP para trabalhar com seus scripts.

Por que Cheyenne?

Porque é incrivelmente pequeno, cerca de 500 KB! Tem um único arquivo de configuração e é totalmente portátil. Além disso, foi escrito em Rebol por Nenad Rakocevic e, como mencionado, interpreta essa linguagem nativamente. Você pode facilmente empacotar tudo e seus scripts em um projeto e ainda assim ficar em menos de 1 MB.

Link básico de informações HTTP:

[Um primer sobre HTTP](https://medium.com/douglas-matoso-english/http-primer-for-frontend-developers-f091a2070637) - Muito bom, e tem links para informações mais detalhadas.

.
