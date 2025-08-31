Original URL: <http://helpin.red/pt/DefinicoesdoContainer.html>

# Definições do Container

* * *

* * *

Estas definem as características da janela que vai conter os elementos da GUI.

VID DLS size

Determina o tamanho da janela em pixels

![](http://helpin.red/lib/size.png)

Se você não der um size, o Red o faz automaticamente.

Uma observação interessante é que, a não ser que a janela seja grande o suficiente para mostrar parte do título, você não consegue movê-la (drag).

VID DLS title

Determina o título no topo da janela.

![](http://helpin.red/lib/title.png)

VID DLS backdrop

Determina a cor de fundo da janela.

![](http://helpin.red/lib/backdrop.png)

### actors

- Veja o [capítulo específico](http://helpin.red/EventseActors.html).

### Definindo um icon

Isto só funciona se você compilar o código. Não funciona no modo interpretado.

Não é uma definição de container, mas eu acho que se encaixa aqui. Se você quer colocar o seu próprio ícone numa janela do Red, adicione icon: &lt;path-to-icon&gt; após o needs: 'view no bloco inicial do Red.

![](http://helpin.red/lib/settinganicon.png)

### Refinamentos

Containers (janelas) permitem os refinamentos options, flags e no-wait. Os refinamentos options e flags são definidos em blocos após o bloco principal do  view .

#### Options

No refinamento options você pode determinar o offset e o tamanho (size). O tamanho parece poder ser definido de duas maneiras, como uma definição de container ou como uma option.

 Offset determina onde sua janela vai aparecer, medido to topo esquerdo da tela.

![](http://helpin.red/lib/offset.png)

#### flags

 modal - uma janela modal. Demanda atenção, desabilita todas as outras janelas até você fechá-la.

Nota: se você criar uma janela que é modal e no-title/no-border, é bem difícil se livrar dela. Acho que só com o Task Manager.

 resize - a janela pode ser redimensionada.

![](http://helpin.red/lib/flagsmodalresize.png)

 no-title - resulta em uma moldura retangular sem título e sem botões.

![](http://helpin.red/lib/flagsnotitle.png)

 no-border - resulta em uma moldura retangular sem título, sem botões e sem borda.

![](http://helpin.red/lib/flagsnoborder.png)

 no-min - só o botão de fechar é mostrado no topo da janela.

![](http://helpin.red/lib/flagsnomin.png)

 no-max - O botão de maximizar é mostrado como inativo.

![](http://helpin.red/lib/flagsnomax.png)

 no-buttons - sem botões.

![](http://helpin.red/lib/flagsnobuttons.png)

 popup - só em Windows - faz que a janela seja um popup. Tem um estilo especial (apenas botão de fechar) e permite que outras janelas permaneçam ativas. Fecha se você mudar o foco para outra janela.

#### no-wait

Da  [documentação](https://doc.red-lang.org/en/view.html#_extra_functions): "View: Render on screen a window from a face tree or a block of VID code. Enters an event loop unless /no-wait refinement is used.
