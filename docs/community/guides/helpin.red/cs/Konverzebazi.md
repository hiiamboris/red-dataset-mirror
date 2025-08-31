Original URL: <http://helpin.red/cs/Konverzebazi.html>

# Konverze bází

* * *

* * *

### native! to-hex

### Konvertuje integer! na issue!  (with leading # and 0's).

&gt;&gt; to-hex 10  
\== #0000000A              ; hexadecimální formát

&gt;&gt; to-hex 16  
\== #00000010

&gt;&gt; to-hex 15  
\== #0000000F

### /size   -  určit počet hexadecimálních číslic ve výsledku

&gt;&gt; to-hex/size 15 4  
\== #000F

&gt;&gt; to-hex/size 10 2  
\== #0A

### native!  enbase a native! debase,

### Používají se pro kódování a dekódování binárních řetězců. These are not for number conversion and, honestly, I don't understand the use for them, but here is how they work:

&gt;&gt; enbase "my house"  
\== "bXkgaG91c2U="

&gt;&gt; probe to-string debase "bXkgaG91c2U=" "my house"  
\== "my house"

### /base     -  báze binárního formátu; může to být 64 (default), 16 nebo 2.

&gt;&gt; enbase/base "Hi" 2  
\== "0100100001101001"

&gt;&gt; probe to-string debase/base "0100100001101001" 2  
"Hi"  
\== "Hi"

### native! dehex

### Converts URL-style hex encoded (%xx) strings.

&gt;&gt; dehex "www.mysite.com/this%20is%20my%20page"  
\== "www.mysite.com/this is my page" ; Hex 20 (%20) is space

&gt;&gt; dehex "%33%44%55"  
\== "3DU"  
; %33 is hex for "3", %44 is hex for "D" and %55 is hex for "U".
