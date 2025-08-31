Original URL: <http://helpin.red/pt/Tratamentodeerros.html>

# Tratamento de erros

* * *

* * *

### function!  attempt

Avalia um bloco e retonra o resultado ou none se ocorrer um erro.

&gt;&gt; attempt \[a: 10 b: 9]        ;vamos tentar sem erros...  
\== 9

&gt;&gt; a  
\== 10                                ;... sem problemas!

&gt;&gt; attempt \[a: 10 nosyntax]        ;nosyntax não tem valor: ERROR!  
\== none

### native! try

Tenta computar um bloco. Retonra o valor do bloco, mas se ocorrer um error! , o bloco é abandonado e um valor de erro é retornado.  
Para identificar um bloco que gera erro sem ter o erro impresso, usamos a função  error?.

Você pode estar se perguntando porque não usar  attempt ao invés de  error? &amp; try. Eu acho que a resposta é que a combinação  error? &amp; try retorna true e false, ao invés de none ou um resultado de computação. Isto é útil quando usado dentro de outras estruturas.

&gt;&gt; error? \[nosyntax]  
\== false                        ;nosyntax não tem valor e gera um erro,  
                               ;mas apenas se avaliado. Por sí só, não é um datatype error!  

&gt;&gt; try \[nosyntax]  
\*\** Script Error: nosyntax has no value  
\*\** Where: try  
\*\** Stack:                ; apenas "try" não funciona, dá erro!!

&gt;&gt; error? try \[nosyntax]  
\== true                        ;OK!

### native! catch e native! throw

Também são usados para tratar erros, mas eu não entendi como. Parece ser algo muito avançado para principiantes, como está discutido [aqui](http://www.red-by-example.org/index.html#catch).
