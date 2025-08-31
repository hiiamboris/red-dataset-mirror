Original URL: <http://helpin.red/Otherdatatypes.html>

# Other datatypes

* * *

#### Other datatypes:

* * *

#### More information on these datatypes can be found at [Red documentation](https://doc.red-lang.org/en/datatypes.html) and [Red-by-example.](http://www.red-by-example.org/#cat-d03)

#### ♦ issue!

Series of characters used to sequence symbols or identifiers for things like telephone numbers, model numbers, serial numbers, and credit card numbers. An issue! has to start with the character "#". Most characters can be used inside an issue!, a notable exception being the slash "/".

&gt;&gt; a: #333-444-555-999  
\== #333-444-555-999

&gt;&gt; a: #34-Ab.77-14  
\== #34-Ab.77-14

#### ♦ url!

Represented by &lt;protocol&gt;://&lt;path&gt;

&gt;&gt; a: read http://www.red-lang.org/p/about.html  
\== {&lt;!DOCTYPE html&gt;^/&lt;html class='v2' dir='ltr' x

#### ♦ email!

Used to identify email addresses. No detailed syntax-checking is performed, it must only contain an @ character.

&gt;&gt; a: myname@mysite.org  
\== myname@mysite.org

&gt;&gt; type? a  
\== email!

#### ♦ image!

To create a image! you must use make image!  
The external image formats supported are GIF, JPEG, PNG and BMP.  
When you load an image file, the data is typed as image! It is unlikely that you will create image with text, but the format would be:

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

Any series within brackets.

#### ♦ paren!

Any series within parentheses.

#### ♦ refinement!

Preceded by "/" - indicate a variation in the use or an extension of the meaning of a function!, object!, file! or path!.

#### ♦ action!

Is the datatype of all "actions" in red, e.g. add , take , append, negate etc.

&gt;&gt; action? :take ; Colon is mandatory.  
\== true

To get a list of all action! words type:

&gt;&gt; ? action!

#### ♦ op!

Is the datatype of infix operators , like  +  or \*\*.

#### ♦ routine!

Used to link to external code

#### ♦ binary!

Is a series of bytes. It's the raw storage format and it can encode data such as images, sounds, strings (in formats like UTF and others), movies, compressed data, encrypted data and others.

The source format may be on base 2, 16 or 64. I'm not sure which is the default in Red,

The source format is: #{...}

#{3A1F5A}  ; base 16

2#{01000101101010}  ; base 2

64#{0aGvXmgUkVCu} ; base 64

#### ♦ word!

The mother of all datatypes. When a word is created it has this datatype.

#### ♦ datatype!

Is the datatype of all the datatype! words listed in this chapter.

#### ♦ event!

#### This datatype is explained in the [Event! mouse position and key pressed](http://helpin.red/Eventmousepositionandkeypressed.html).

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

[&lt; Previous topic](http://helpin.red/Hashvectorandmap.html)                                                                                          [Next topic &gt;](http://helpin.red/Datatypeconversion.html)
