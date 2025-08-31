Original URL: <http://helpin.red/cs/Konverzedatovychtypu.html>

# Konverze datových typů

* * *

#### Konverze datových typů:

* * *

action! to

Konvertuje jeden datový typ na druhý, např.  integer! na string!, float! na integer! a dokonce string! na number!.

&gt;&gt; to integer! 3.4  
\== 3

&gt;&gt; to float! 23  
\== 23.0

&gt;&gt; to string! 23.2  
\== "23.2"

&gt;&gt; to integer! "34"  
\== 34

### function! to-time

### Konvertuje hodnoty na datový typ time!.

&gt;&gt; to-time \[22 55 48]  
\== 22:55:48

&gt;&gt; to-time \[22 65 70]  
\== 23:06:10

&gt;&gt; to-time "11:15"  
\== 11:15:00

### native! as-pair

### Konvertuje dvě čísla typu integer! nebo float! na pair!

&gt;&gt; as-pair 11 53  
\== 11x53

&gt;&gt; as-pair 3.2 5.67  
\== 3x5

&gt;&gt; as-pair 88 12.7  
\== 88x12

### function! to-binary

### Konvertuje argument na hodnotu typu binary!.

&gt;&gt; to-binary 8  
\== #{00000008}

&gt;&gt; to-binary 33  
\== #{00000021}
