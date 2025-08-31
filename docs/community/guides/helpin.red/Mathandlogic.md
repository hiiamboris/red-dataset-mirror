Original URL: <http://helpin.red/Mathandlogic.html>

# Math and logic

* * *

* * *

Most of Red's math and logic is usual, except maybe the order of [evaluation](https://ungaretti.gitbooks.io/red-language-notebook/content/evaluation.html).

Interesting notes:

- input to Red may use a period or a coma as decimal separator for float!:

&gt;&gt; 5,5 + 9.2    ; notice the coma in the first number and the period in the second  
\== 14.7                ; Red always uses a period for its output of floats

- if you want to use apostrophes for readability, Red ignores them:

&gt;&gt; 5'420'120,00 * 2  
\== 10840240.0

- you may evaluate strings using do:

&gt;&gt; do "2 + 5"  
\== 7

## Below I list the operators (words) used for calculations, adding notes that I find useful. Most of them have no need for a detailed description.

## Math

#### The basics:

The following group have a both a functional (e.g. add) and an infix operator (e.g. "+") . They accept number! char! pair! tuple! or vector! as arguments (except power?).

Note that if you use the functional operator, it goes before the operands (e.g.: 3 + 4 &lt;=&gt; add 3 4).

I'll try to give examples using more complex datatypes than integers and floats:

### action! add  or   op! +

&gt;&gt; add 3x4 2x3

== 5x7

&gt;&gt; now/time + 0:5:0   ; added five minutes to current time

== 7:16:27

### action! subtract  or  op!  -

&gt;&gt; subtract 33 13

== 20

&gt;&gt; 3.4.6 - 1.2.1

== 2.2.5

&gt;&gt; now/month - 3  ;is october now

== 7

### action! multiply  or  op! *

&gt;&gt; multiply 3x2 2x5

== 6x10

&gt;&gt; 2.3.4 * 3.7.2

== 6.21.8

### action! divide  or op! /

&gt;&gt; divide 3x5 2

== 1x2        ;truncate result because pair! is made of integer!

&gt;&gt; divide 8 3 ;truncate result because both are integer!

== 2

&gt;&gt; 8 / 3.0        ;3.0 is a float! so result is float!

== 2.666666666666667

### action! power  or op! \**

&gt;&gt; 3 \** 3

== 27

### action! absolute

Evaluates an expression and returns the absolute value, that is, a positive number.

&gt;&gt; absolute 2 - 7

== 5

### action! negate

Invert the signal of a value, that is: positive &lt;=&gt; negative

&gt;&gt; negate 3x2

== -3x-2

### float! pi

3,141592...

### action! random

Returns a random value of the same type as its argument.

If argument is an integer, returns an integer between 1 (inclusive) and the argument (inclusive).

If argument is a float, returns a float between 0 (inclusive) and the argument (inclusive).

If the argument is a series, it shuffles the elements.

&gt;&gt; random 10  
\== 2

&gt;&gt; random 33x33  
\== 13x23

&gt;&gt; random 1  
\== 1

&gt;&gt; random 1.0  
\== 0.07588539741741744

&gt;&gt; random "abcde"  
\== "cedab"

&gt;&gt; random 10:20:05  
\== 8:02:32.5867693

Refinements:

/seed - Restart or randomize. I think the use of this is if your random function is called many times within a program. In this case it may not be so random unless you reestart it with a seed.

/secure - TBD: Returns a cryptographically secure random number.

/only - Pick a random value from a series.

&gt;&gt; random/only \["fly" "bee" "ant" "owl" "dog"]  
\== "fly"

&gt;&gt; random/only "aeiou"  
\== #"o"

### action! round

Returns the nearest integer value. Halves (e.g. 0,5) are rounded away from zero by default.

&gt;&gt; round 2.3  
\== 2.0

&gt;&gt; round 2.5  
\== 3.0

&gt;&gt; round -2.3  
\== -2.0

&gt;&gt; round -2.5  
\== -3.0

Refinements:

/to - You supply the "precision" of your rounding:

&gt;&gt; round/to 6.8343278 0.1  
\== 6.8

&gt;&gt; round/to 6.8343278 0.01  
\== 6.83

&gt;&gt; round/to 6.8343278 0.001  
\== 6.834

/even - Halves (e.g. 0.5) are rounded not "up" as default, but towards the even integer.

&gt;&gt; round/even 2.5  
\== 2.0                ;not 3

/down - Simply truncates the number, but keeps the number a float!.

&gt;&gt; round/down 3.9876  
\== 3.0

&gt;&gt; round/down -3.876  
\== -3.0

/half-down - Halves round toward zero, not away from zero.

&gt;&gt; round/half-down 2.5  
\== 2.0

&gt;&gt; round/half-down -2.5  
\== -2.0

/floor - Rounds in negative direction.

&gt;&gt; round/floor 3.8  
\== 3.0

&gt;&gt; round/floor -3.8  
\== -4.0

/ceiling - Rounds in positive direction.

&gt;&gt; round/ceiling 2.2  
\== 3.0

&gt;&gt; round/ceiling -2.8  
\== -2.0

/half-ceiling - Halves round in positive direction.

&gt;&gt; round/half-ceiling 2.5  
\== 3.0

&gt;&gt; round/half-ceiling -2.5  
\== -2.0

### native! square-root

Takes any number! as argument.

* * *

#### Remainders etc.:

### action! remainder or  op! //   (* see "%" operator below)

Takes number! char! pair! tuple! and vector! as arguments. Returns the rest of dividing the first by the second value.

&gt;&gt; remainder 15 6  
\== 3

&gt;&gt; remainder -15 6  
\== -3

&gt;&gt; remainder 4.67 2  
\== 0.67

&gt;&gt; 17 // 5  
\== 2

&gt;&gt; 4.8 // 2.2  
\== 0.3999999999999995

#### op! %

Returns what is left over when one value is divided by another. Seems to me as the same as remainder, look at the examples:

&gt;&gt; remainder 11x19 3

== 2x1

&gt;&gt; 11x19 % 3

== 2x1

&gt;&gt; 11x19 // 3

\*\** Script Error: cannot compare 2x1 with 0        ; WHAT?!

\*\** Where: &lt;

\*\** Stack: mod  

### function! modulo

From the documentation: "Wrapper for MOD that handles errors like REMAINDER. Negligible values (compared to A and B) are rounded to zero". Can't really figure this one out.

&gt;&gt; modulo 9 4  
\== 1

&gt;&gt; modulo -15 6  
\== 3

&gt;&gt; modulo -15 -6  
\== 3

&gt;&gt; modulo -15 7                ;?????  
\== 6

&gt;&gt; modulo -15 -7        ;?????  
\== 6

* * *

#### Logarithms etc.:

### function! exp

Raises e (the natural number) to the power of the single argument.

### native! log-10

Returns the logarithm base 10 of the argument.

### native! log-2

Returns the logarithm base 2 of the argument.

### native! log-e

Returns the logarithm base e of the argument.

* * *

#### Trigonometry:

All the trigonometric functions with long names (arccosine, cosine etc) use degrees as default, but accept the refinement /radians to use this unit. The short name versions (acos, cos etc.) take radians as arguments and require it to be a number!

### function! acos  or  native! arccosine

### function! asin  or native! arcsine

### function! atan  or  native! arctangent

#### Returns the trigonometric arctangent.

### function! atan2  or  native! arctangent2

#### Returns the angle of the point y/x in radians, when measured counterclockwise from a circle's x axis (where 0x0 represents the center of the circle). The return value is between -pi and +pi.

### function! cos  or  native! cosine

### function! sin  or  native! sine

### function! tan  or  native! tangent

* * *

#### Extras:

#### native! max

Returns the greater of two arguments. Arguments may be scalar! or series!

I'm not sure how it selects the greater series, but is seems to choose the series with the first greater value from left to right.

&gt;&gt; max 8 12  
\== 12

&gt;&gt; max "abd" "abc"  
\== "abd"

&gt;&gt; max \[1 2 3] \[3 2 1]  
\== \[3 2 1]

&gt;&gt; max \[1 2 99] \[3 2 1]  
\== \[3 2 1]

In a pair! comparison, it returns the greater for each element:

&gt;&gt; max 12x6 7x34  
\== 12x34

#### native! min

Returns the smaller of two arguments. Notes for max apply here too.

### action! odd?

Returns true if argument (integer!) is odd, and false otherwise.

### action! even?

Returns true if argument (integer!) is even, and false otherwise.

#### native! positive?

true if greater than zero. Note: false if zero.

#### native! negative?

true if less than zero. Note: false if zero.

#### native! zero?

true only if zero.

### function! math

Evaluates a block! using the normal mathematical rules of precedence, that is, divisions and multiplications are evaluated before additions and subtractions and so on. As of november 2018, math dialect unfinished and may produce unexpected results!

### function! within?

It has 3 arguments of the pair! type. The first is a point's coordinates (origin in the upper left corner). The other two describe a rectangle, the first is its upper left origin, and the second is the width and height. If the point is inside or at the edge, returns true, otherwise returns false .

#### native! NaN?

Returns true if the argument is 'not a number',otherwise false.

#### native! NaN

#### Returns TRUE if the number is Not-a-Number.

### function! a-an

#### Returns the appropriate variant of "a" or "an" (simple, vs 100% grammatically correct).

* * *

## Logic

### action! and~   or  op! and (infix)

#### native! equal?   or   op! =

#### native! greater-or-equal?  or  op! &gt;=

#### native! greater?  or  op! &gt;

#### native! lesser-or-equal?   or  op! &lt;=

#### native! lesser?  or  op! &lt;

#### native! not

#### native! not-equal?   or   op! &lt;&gt;

### action! or~  or  op! or (infix)

#### native! same?  or  op! =?

Returns true if the arguments refer to the same data (object, string etc.), that is, it they both refer to the same space in memory.

&gt;&gt; a: \[1 2 3]  
\== \[1 2 3]

&gt;&gt; b: a                ; b points to the same data as a  
\== \[1 2 3]

&gt;&gt; a =? b  
\== true                ; they are the same

&gt;&gt; c: \[1 2 3]  
\== \[1 2 3]

&gt;&gt; c =? a                ; c is equal to a, but is not the same data in memory.  
\== false

#### native! strict-equal?  or  op! ==

Returns true if the arguments are exactly equal, with same datatype same lower-case/uppercase (strings) etc.

&gt;&gt; a: "house"  
&gt;&gt; b: "House"  
&gt;&gt; a = b  
\== true

&gt;&gt; a == b  
\== false

[&lt; Previous topic](http://helpin.red/Accessingandformattingdata.html)                                                                                          [Next topic &gt;](http://helpin.red/Otherbases.html)
