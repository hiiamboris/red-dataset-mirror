Original URL: <http://helpin.red/Objects.html>

# Objects

* * *

* * *

An object is a container that groups data and/or functions, usually (always?) assigned to a word (variable) . To access an object's attribute in Red, we use a slash (/) as a separator. This is unusual as most languages use a dot, but once you get used to it, it seems more intuitive as it is similar to a path.

#### Creating an object:

action! make object! , function! context and  function! object  [Red-by-example](http://www.red-by-example.org/#cat-o01)  

You may use make object! ,  object or context to create an object. They are the same command. object and context are just shortcuts to make object!.

Red \[]

myobject: object [

       x: 10

       y: 20

       f: function \[a b] \[a + b]

       name: none

       tel: none

]

myobject/name: "Dimitri"

myobject/tel: #3333-3333

print myobject/x

print myobject/y

print myobject/f 3 5

print myobject/name

print myobject/tel

10

20

8

Dimitri

3333-3333

Evaluation is done only when creating an object! (constructor code). Notice that the print command in the code below is not executed when the object is accessed:

&gt;&gt; myobject: object \[print "hello" a: 1 b: 2]  
hello  
\== make object! [  
       a: 1  
       b: 2  
]

&gt;&gt; myobject/a  
\== 1

#### Self reference:

When an object must do a reference to itself, we use a special keyword named self :

Red \[]

myobject: object [

       x: 10

       y: 20

       f: function \[a b] \[a + b]

       autoanalisys: does \[print self]

]

myobject/autoanalisys

x: 10

y: 20

f: func \[a b]\[a + b]

autoanalisys: func \[]\[print self]

#### Cloning an object:

Simply assigning an object to another creates a "link" to the same data. If the original changes, the second also changes:

&gt;&gt; a: object \[x: 10]                ;lines of the console deleted for the sake of clarity.  
&gt;&gt; b: a                                ;lines of the console deleted for the sake of clarity.  
&gt;&gt; a/x: 20  
\== 20

&gt;&gt; b/x  
\== 20                                ;changed too!

To make a true copy of an object, we use the word copy:

&gt;&gt; a: object \[x: 10]                ;lines of the console deleted for the sake of clarity.  
&gt;&gt; b: copy a                        ;lines of the console deleted for the sake of clarity.  
&gt;&gt; a/x: 20  
\== 20

&gt;&gt; b/x  
\== 10                                ;NO change! b is a true copy.

Prototyping (Inheritance)

Any object can serve as a prototype for making new objects. If we want to create a new object that inherits the first object , we use: make &lt;original object&gt; &lt;new specifications&gt;:

Red \[]

a: object \[x: 3]

b: make a \[y: 12]

print b

x: 3

y: 12

Another example:

Red \[]

myobject: object [

       name: none

       tel: none

]

myobject/name: "Dimitri"

myobject/tel: #3333-3333

myextended-object: make myobject [

       gender: "male"

       zip\_code: 666

]

myextended-object/name: "Igor"

myextended-object/tel: #9996-9669

prin myobject/name prin "  tel:" print myobject/tel

prin myextended-object/name prin "  tel:" prin myextended-object/tel

prin "  gender:" prin myextended-object/gender prin "  zip:"

print myextended-object/zip\_code

Dimitri  tel:3333-3333

Igor  tel:9996-9669  gender:male  zip:666

### find and select - for objects

find simply checks if the field exists, returning true or none .

select does the same checking, but if the field exists, returns its value.

Red \[]

obj: object \[a: 44]

print find obj 'a

print select obj 'a

print find obj 'x

print select obj 'something

true

44

none

none

Notice that both look for the word (indicated by the ' symbol preceding it), not the variable itself. The variable would be accessed by a simple path like obj/a.

Note on extending objects:

Documentation says the built-in function extend should be able to add new items not only to map!, but also to object! However, this seems not to have been implemented yet.

[&lt; Previous topic](http://helpin.red/Functions.html)                                                                                          [Next topic &gt;](http://helpin.red/Reactiveprogramming.html)
