Original URL: <http://helpin.red/pt/Outrosdatatypes.html>

# Outros datatypes

* * *

#### Outros datatypes:

* * *

#### ♦ issue!

Série de caracteres usados para sequenciar símbolos ou identificadore para coisas como números de telefone, números de modelos, números de série, números de cartões de crédito etc. Um issue! tem que começar pelo caracter "#". A maior parte dos caracteres pode ser usada dentro de um issue!, sendo a barra "/" uma exceção..

&gt;&gt; a: #333-444-555-999  
\== #333-444-555-999

&gt;&gt; a: #34-Ab.77-14  
\== #34-Ab.77-14

#### ♦ url!

Representada por &lt;protocolo&gt;://&lt;path&gt;

&gt;&gt; a: read http://www.red-lang.org/p/about.html  
\== {&lt;!DOCTYPE html&gt;^/&lt;html class='v2' dir='ltr' x

#### ♦ email!

Usado para identificar endereços de e-mail. A sintaxe não é checada, apenas deve possuir o caracter "@".

&gt;&gt; a: myname@mysite.org  
\== myname@mysite.org

&gt;&gt; type? a  
\== email!

#### ♦ image!

Para criar uma image! você deve usar make image!  
Os formatos de imagem suportados são: GIF, JPEG, PNG e BMP.  
Quando você carrega (load) um arquivo de imagem, os dados são tipificados como image!. É pouco provável que você vá criar uma imagem com texto, mas se você quiser, o formato seria:

&gt;&gt; a: make image! [30x40 #{ ; here goes the data...  
;You can change or get information from your image using the actions that apply to series:  
&gt;&gt; a: load %heart.bmp  
\== make image! [30x20 #{  
       00A2E800A2E800A2E800A

&gt;&gt; print a/size  
30x20

&gt;&gt; print pick a 1                ; getting the RGBA data of pixel 1  
0.162.232.0

&gt;&gt; poke a 1 255.255.255.0        ; changing the RGBA data of pixel 1  
\== 255.255.255.0

#### ♦ block!

Qualquer série dentro de colchetes.

#### ♦ paren!

Uma série dentro de parêntesis.

#### ♦ set-word! ♦ lit-word! ♦ get-word!

w: - atribui à palavra um valor. O seu tipo é  set-word!

:w - resgata o valor associado à palavra sem computação. Seu tipo é  get-word!

'w - trata a palavra como um símbolo, sem computação. Seu tipo é lit-word (literal word)

#### ♦ refinement!

Precedido por um "/" - indica uma variação no uso ou uma extensão do significado de uma function!, object!, file! ou path!.

#### ♦ action!

É o datatype de todas as "ações" do Red, p. exemplo: add , take , append, negate etc.

&gt;&gt; action? :take ; Colon is mandatory.  
\== true

TPara obter uma lista de todas as palavras pré-definidas do tipo  action! digite:

&gt;&gt; ? action!

#### ♦ op!

É o datatype dos operadores infixos, como  +  ou  \*\*.

#### ♦ routine!

Usado para "linkar" com código externo.

#### ♦ binary!

É uma série de bytes. Pode codificar dados como imagens, sons, strngs (no formato UTF ou outros), videos, dados comprimidos, dados encriptados ou outros.

O formato de origem pode estar na base 2, 16 ou 64. Não sei qual é o default em Red.

O formato da fonte é : #{...}

#{3A1F5A}  ; base 16

2#{01000101101010}  ; base 2

64#{0aGvXmgUkVCu} ; base 64

#### ♦ word!

A mãe de todos os datatypes. Quando uma palavra é criada, este é o datatype dela.

#### ♦ datatype!

É o datatype de todos os datatype! .

#### ♦ event!

#### Este datatype é explicado em is explained in the [Event! posição do mouse e uso de teclas](http://helpin.red/Eventposicaodomouseeusodeteclas.html).

#### ♦ function!

#### ♦ object!

#### ♦ handle!

#### ♦ unset!

#### ♦ tag!

#### ♦ lit-path!

#### ♦ set-path!

#### ♦ get-path!

#### ♦ bitset!

#### ♦ typeset!

#### ♦ error!

#### ♦ native!
