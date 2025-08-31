Original URL: <http://helpin.red/pt/ConversaodeDatatypes.html>

# Conversão de Datatypes

* * *

#### Conversão de datatypes:

* * *

action! to

Converte de um datatype! para outro. Por exemplo, um integer! para uma string! , um float! para um integer! e mesmo uma string! para um number!.

&gt;&gt; to integer! 3.4  
\== 3

&gt;&gt; to float! 23  
\== 23.0

&gt;&gt; to string! 23.2  
\== "23.2"

&gt;&gt; to integer! "34"  
\== 34

### function! to-time

### Converte valores para o datatype time!.

&gt;&gt; to-time \[22 55 48]  
\== 22:55:48

&gt;&gt; to-time \[22 65 70]  
\== 23:06:10

&gt;&gt; to-time "11:15"  
\== 11:15:00

### native! as-pair

### Converte dois  integer! ou float! em um pair!

&gt;&gt; as-pair 11 53  
\== 11x53

&gt;&gt; as-pair 3.2 5.67  
\== 3x5

&gt;&gt; as-pair 88 12.7  
\== 88x12

### function! to-binary

### Converete para um tipo binary! . Me parece que não é um conversor de bases, apenas um conversor de datatype.

&gt;&gt; to-binary 8  
\== #{00000008}

&gt;&gt; to-binary 33  
\== #{00000021}
