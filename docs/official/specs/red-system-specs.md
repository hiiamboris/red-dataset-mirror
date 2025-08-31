[dark version](red-system-specs.html) | [light version](red-system-specs-light.html)

# Red/System Language Specification

> **Author: Nenad Rakocevic**  
> **Date: 08/09/2022**  
> **Revision: 60**  
> **Status: reference document**  
> **Home: [red-lang.org](http://www.red-lang.org)**

## Contents:

[1. Abstract](#section-1)  
[2. Syntax](#section-2)  
[2.1 Delimiters](#section-2.1)  
[2.2 Free-form syntax](#section-2.2)  
[2.3 Comments](#section-2.3)  
[3. Variables](#section-3)  
[3.1 Setting a value](#section-3.1)  
[3.2 Getting a value](#section-3.2)  
[3.3 Typing](#section-3.3)  
[4. Datatypes](#section-4)  
[4.1 Integer!](#section-4.1)  
[4.2 Byte!](#section-4.2)  
[4.3 Float!](#section-4.3)  
[4.4 Float32!](#section-4.4)  
[4.5 Logic!](#section-4.5)  
[4.6 C-string!](#section-4.6)  
[4.7 Struct!](#section-4.7)  
[4.8 Pointer!](#section-4.8)  
[4.9 Type Casting](#section-4.9)  
[4.10 Size?](#section-4.10)  
[5. Expressions](#section-5)  
[5.1 Formal grammar rules](#section-5.1)  
[5.2 Evaluation order rule](#section-5.2)  
[6. Functions](#section-6)  
[6.1 Declaration](#section-6.1)  
[6.2 Return value](#section-6.2)  
[6.3 Attributes](#section-6.3)  
[6.4 Type inference](#section-6.4)  
[6.5 Calling a function](#section-6.5)  
[6.6 Function pointer](#section-6.6)  
[6.7 Premature exiting](#section-6.7)  
[6.8 Subroutines](#section-6.8)  
[7. Scoping](#section-7)  
[7.1 Global Context](#section-7.1)  
[7.2 Functions Contexts](#section-7.2)  
[7.3 Namespaces](#section-7.3)  
[8. Infix operators](#section-8)  
[8.1 Math operators](#section-8.1)  
[8.2 Bitshift operators](#section-8.2)  
[8.3 Bitwise operators](#section-8.3)  
[8.4 Comparison operators](#section-8.4)  
[9. Control flow functions](#section-9)  
[9.1 if](#section-9.1)  
[9.2 either](#section-9.2)  
[9.3 loop](#section-9.3)  
[9.4 until](#section-9.4)  
[9.5 while](#section-9.5)  
[9.6 break](#section-9.6)  
[9.7 continue](#section-9.7)  
[9.8 any](#section-9.8)  
[9.9 all](#section-9.9)  
[9.10 case](#section-9.10)  
[9.11 switch](#section-9.11)  
[10. Exceptions](#section-10)  
[10.1 Throw](#section-10.1)  
[10.2 Catch](#section-10.2)  
[10.3 Exception value](#section-10.3)  
[11. Stack functions](#section-11)  
[11.1 push](#section-11.1)  
[11.2 pop](#section-11.2)  
[12. Debugging functions](#section-12)  
[12.1 assert](#section-12.1)  
[13. System structure](#section-13)  
[13.1 args-count](#section-13.1)  
[13.2 args-list](#section-13.2)  
[13.3 env-vars](#section-13.3)  
[13.4 stack/top](#section-13.4)  
[13.5 stack/frame](#section-13.5)  
[13.6 stack/align](#section-13.6)  
[13.7 stack/allocate](#section-13.7)  
[13.8 stack/free](#section-13.8)  
[13.9 stack/push-all](#section-13.9)  
[13.10 stack/pop-all](#section-13.10)  
[13.11 pc](#section-13.11)  
[13.12 cpu/&lt;reg&gt;](#section-13.12)  
[13.13 cpu/overflow?](#section-13.13)  
[13.14 fpu/type](#section-13.14)  
[13.15 fpu/option](#section-13.15)  
[13.16 fpu/mask](#section-13.16)  
[13.17 fpu/status](#section-13.17)  
[13.18 fpu/control-word](#section-13.18)  
[13.19 fpu/epsilon](#section-13.19)  
[13.20 fpu/update](#section-13.20)  
[13.21 fpu/init](#section-13.21)  
[13.22 io/read](#section-13.22)  
[13.23 io/write](#section-13.23)  
[13.24 atomic/fence](#section-13.24)  
[13.25 atomic/load](#section-13.25)  
[13.26 atomic/store](#section-13.26)  
[13.27 atomic/cas](#section-13.27)  
[13.28 atomic/&lt;math-op&gt;](#section-13.28)  
[13.29 image/base](#section-13.29)  
[13.30 image/code](#section-13.30)  
[13.31 image/code-size](#section-13.31)  
[13.32 image/data](#section-13.32)  
[13.33 image/data-size](#section-13.33)  
[13.34 alias](#section-13.34)  
[13.35 words](#section-13.35)  
[14. Compiler directives](#section-14)  
[15. Importing External Libraries](#section-15)  
[15.1 #import](#section-15.1)  
[15.2 #syscall](#section-15.2)  
[16. Source Processing](#section-16)  
[16.1 #define](#section-16.1)  
[16.2 #enum](#section-16.2)  
[16.3 #include](#section-16.3)  
[16.4 #if](#section-16.4)  
[16.5 #either](#section-16.5)  
[16.6 #switch](#section-16.6)  
[16.7 #verbose](#section-16.7)  
[16.8 #call](#section-16.8)  
[16.9 #export](#section-16.9)  
[16.10 #u16](#section-16.10)  
[16.11 #inline](#section-16.11)  
[17. Source code organization](#section-17)  
[17.1 Source files suffix](#section-17.1)  
[17.2 Header](#section-17.2)  
[17.3 Code flow layout](#section-17.3)  
[17.4 Coding guidelines](#section-17.4)  
[17.5 Shared library program](#section-17.5)  
[17.6 Driver program (experimental)](#section-17.6)  
[18. Reserved keywords](#section-18)  
[19. Possible Evolutions](#section-19)  
[19.1 Variables](#section-19.1)  
[19.2 Pointers](#section-19.2)  
[19.3 Struct](#section-19.3)  
[19.4 C-strings](#section-19.4)  
[19.5 Logic!](#section-19.5)  
[19.6 Integer!](#section-19.6)  
[19.7 Functions](#section-19.7)  
[19.8 New datatypes](#section-19.8)  
[19.9 New functions](#section-19.9)  
[19.10 Misc](#section-19.10)  
[20. Document History](#section-20)

## 1. Abstract

> Red/System is a dialect ([DSL](http://en.wikipedia.org/wiki/Domain-specific_language)) of the Red programming language. Its purpose is to provide:
> 
> - low-level system programming capabilities
> - a tool to build Red's runtime low-level library
> - a tool to link code and produce executables
> 
> Red/System can be seen as a C-level language with memory pointer support and a very basic and limited set of datatypes.
> 
> Implementation note: It is currently provided with a complete tool-chain generating executables from source files. This is a temporary state as Red/System will live inside Red, so will be embedded in Red scripts.

## 2. Syntax

> The syntax is almost the same as the one used by REBOL language, as the lexer ([LOAD](http://www.rebol.com/docs/words/wload.html)) is currently provided by REBOL during the bootstrapping phase. The REBOL syntax does not have a formal specification nor an exhaustive documentation, just a superficial description, but it is enough to work with. See:
> 
> - [http://www.rebol.com/docs/core23/rebolcore-3.html](http://www.rebol.com/docs/core23/rebolcore-3.html) (There is a typo in the table, all literals are missing a caret (^) character after the first quote)
> - [http://www.rebol.com/r3/docs/guide/code-syntax.html](http://www.rebol.com/r3/docs/guide/code-syntax.html)
> 
> A complete syntax specification for both Red and Red/System will be provided during the implementation of the Red language layer.
> 
> For now, Red/System uses 8-bit character encoding (ASCII). Once proper Unicode support will be provided by the Red language layer, Red/System will switch to UTF-8 source encoding.
> 
> Here are a few practical aspects of the language syntax:

### 2.1 Delimiters

> String delimiters: double quotes
> 
> ```
> "this is a string"

{This is
 a multiline
 string.
}
> ```
> 
> Block of code delimiters: square brackets
> 
> ```
> if a > 0 [print "TRUE"]

either a > 0 [print "TRUE"][print "FALSE"]

while [a > 0][print "loop" a: a - 1]
> ```
> 
> Path separator: slash (denotes a hierarchical relation)
> 
> ```
> s: declare struct! [i [integer!] b [byte!]]
s/i: 123
s/b: #"A"
> ```

### 2.2 Free-form syntax

> Red/System (and Red) inherits the free-form syntax of the REBOL language. The only syntactic constraints are putting a whitespace (in the large sense) between tokens and correctly pairing delimiters.
> 
> Examples of valid code:
> 
> ```
> while [a > 0][print "loop" a: a - 1]

while [a > 0]
    [print "loop" a: a - 1]

while [
   a > 0
][
   print "loop"
   a: a - 1
]
> ```
> 
> Code guidelines are not yet available. They will follow standard REBOL practices.

### 2.3 Comments

> Inline comment:
> 
> ```
> ;this is a commented line

print "hello world"    ; this is another comment
> ```
> 
> Multiline comment:
> 
> ```
> comment {
    This is a
    multiline
    comment
}
> ```
> 
> Usage rules:
> 
> - Inline comments are allowed anywhere in the source code
> - Multi-line comments are allowed anywhere in the source code, except in expressions. Example:
> 
> ```
> a: 1 + comment {5} 4   ; this will produce a compilation error
> ```

## 3. Variables

> Variables are labels used to represent a memory location. The labels (called **identifiers** from now) are formed by sequences of printable characters without any blank (space, newlines or tabulation). Printable characters are defined as any one-byte character in the 20h-7Eh range that can be printed out in system's console excepting the following ones (used as delimiters or reserved for some datatypes literals):
> 
> ```
> [ ] { } " ( ) / \ @ # $ % ^ , : ; < >
> ```
> 
> There is a restriction on the first character, the following characters are forbidden in the first position, but allowed at other positions:
> 
> ```
> 0 1 2 3 4 5 6 7 8 9 '
> ```
> 
> Also there is a another restriction to avoid letting the compiler mistake an hex integer for a variable name. Variable names starting with A-F letters consisting of 2, 4 or 8 A-F and 0-9 characters and ending with h are not allowed.
> 
> All identifiers (variables and function names) are case-insensitive.
> 
> Unicode support
> 
> As indicated in the Syntax section, Unicode support is not available during the bootstrapping phase, it will be available at Red layer, so Red/System will inherit it once rewritten in Red.

### 3.1 Setting a value

> Variables can hold any value of the available datatypes. This can be the real value (like integer! or pointer!) or a reference to the real value as is the case for struct! or c-string!). To assign a value to a variable, use a colon character at the end of the variable identifier.
> 
> ```
> foo: 123
bar: "hello"
> ```
> 
> Multiple assignments
> 
> Multiple assignments, like **a: b: 123**, are currently partially supported in Red/System through "assignment grouping". It is acting like a macro expansion where the pattern **a: b: 123** would be expanded to **a: 123 b: 123**. It will duplicate whatever value is assigned to each variable, so special care is needed when using it.

### 3.2 Getting a value

> Just use the variable name without any decoration to get its value or to pass it as a function's argument.
> 
> ```
> bar: "hello"
print bar
> ```
> 
> will output:
> 
> ```
> hello
> ```

### 3.3 Typing

> Variables do have a type. Variables do not need to be declared before being used, but they require to be initialized anyway. Function local variables require to be declared, but the type specification part can be skipped if the variable is properly initialized. For example:
> 
> ```
> foo: 123
bar: "hello"
size: length? bar
id: GetProcessID                       ;-- 'GetProcessID would return an integer!

compute: func [
   a [integer!]
   return: [integer!]
   /local c                            ;-- 'c is declared without a type
][
   c: 1                                ;-- inferred type is integer!
   a + c
]
> ```
> 
> are valid variable usages.
> 
> Initializations have to be done at root level of code, attempt to initialize from a block of code will result in a compilation error.
> 
> ```
> foo: 123                               ;-- valid initialization

if a < b [foo: 123]                    ;-- invalid initialization
> ```
> 
> Note: A function body block is considered a root level.
> 
> Allowed types for variables are:
> 
> - integer!
> - byte!
> - float!
> - float32!
> - logic!
> - c-string!
> - struct!
> - pointer!

## 4. Datatypes

> All the following datatypes are [first-class citizens](http://en.wikipedia.org/wiki/First-class_citizen) of Red/System language.

### 4.1 Integer!

> #### 4.1.1 Literal format
> 
> ```
> decimal form          :  1234

decimal negative form : -1234

hexadecimal form      :  04D2h
> ```
> 
> The integer! datatype represents natural and negative natural numbers. The memory size of an integer is 32 bits, so the range of supported numbers is :
> 
> ```
> -2147483648 to 2147483647
> ```
> 
> **Hexadecimal format**
> 
> Hexadecimal integer representation is mostly used to represent memory addresses or binary data for bitwise operations. As for character, all hexadecimal literals found in sources are converted to their integer decimal value during lexical analysis. Allowed range is:
> 
> ```
> 00000000h to FFFFFFFFh
> ```
> 
> Hex letters have to be written in **uppercase** and only 2, 4 and 8 characters are allowed (prefixing with leading zeros is allowed).
> 
> Hex literal form design decision
> 
> The 0x prefix is often used to mark a literal hexadecimal value. It could have been used in Red/System too if the &lt;number&gt;x&lt;number&gt; literal form wasn't reserved in Red for the pair! datatype. As Red/System is a dialect of Red, it has to use the same representation for hex values, so **&lt;hexa&gt;h** was chosen instead.

### 4.2 Byte!

> The byte! datatype's purpose is to represent unsigned integers in the 0-255 range.
> 
> #### 4.2.1 Syntax
> 
> ```
> #"<character>"
#"^<character>"
#"^(hexadecimal)"
#"^(name)"
> ```
> 
> Examples:
> 
> ```
> #"a"
#"A"
#"5"
#"^A"
#"^(1A)"
#"^(back)"
> ```
> 
> See [http://www.rebol.com/docs/core23/rebolcore-16.html#section-3.1](http://www.rebol.com/docs/core23/rebolcore-16.html#section-3.1) for a more complete description of this format.
> 
> #### 4.2.2 Casting
> 
> Casting is allowed to some extent (see section "4.9 Type Casting").
> 
> ```
> foo: as integer! #"a"                  ;-- foo holds 97

bar: as byte! foo                      ;-- bar holds #"a"
> ```
> 
> Note: trying to cast an integer value greater than 255 to a byte! will result in a data loss or data corruption. *(The handling of this case might be changed in future revisions)*

### 4.3 Float!

> The float! datatype represents an IEEE-754 double precision floating point number. Float! memory size is 64-bit.
> 
> Note: **float64!** can be used as an alias to **float!**.
> 
> #### 4.3.1 Syntax
> 
> ```
> <sign><digits>.<digits>
> ```
> 
> or using scientific notation:
> 
> ```
> <sign><digits>E<exponent>
<sign><digits>.<digits>E<exponent>
> ```
> 
> where:
> 
> ```
> <sign>     : an optional + or - symbol
<digits>   : one or more digits
<exponent> : a positive or negative integer
> ```
> 
> Examples:
> 
> ```
> 0.0
1.0
-12345.6789
3.14159265358979
-1E3
+1.23456E-265
> ```
> 
> A maximum of 16 digits are accepted for literal float! values. If more are specified, they will be dropped.
> 
> *For more information on double precision floating point numbers, see [Wikipedia](http://en.wikipedia.org/wiki/Double-precision_floating-point_format)*.
> 
> #### 4.3.2 Casting
> 
> It is allowed to apply a type casting transformation on a float! value to convert it to a float32! value.
> 
> Examples:
> 
> ```
> pi: 3.14159265358979
pi-32: as float32! pi
print pi-32
> ```
> 
> will output
> 
> ```
> 3.1415927
> ```
> 
> #### 4.3.3 Math operations
> 
> All Red/System math operators (+, -, \*, /, //, %) are supported. The default rounding method on results is "rounding to nearest". Both operands need to be of float! types (no implicit casting).
> 
> The modulo (//) and remainder (%) operators are not defined for float! values (use the C \`fmod()\` function if such feature is needed).

### 4.4 Float32!

> The float32! datatype represents an IEEE-754 single precision floating point number. Float32! memory size is 32-bit.
> 
> Float32! purpose
> 
> The reason for having a single precision floating point type is for making the interfacing with popular libraries straightforward. For pure Red/System programs, **float!** should be the default choice.
> 
> #### 4.4.1 Syntax
> 
> There is no literal form for float32! datatype values. To load a float32! constant, the method consists of providing a float! literal and prefixing it with a type casting to float32!.
> 
> Example:
> 
> ```
> pi32: as float32! 3.1415927
> ```
> 
> *For more information on single precision floating point numbers, see [Wikipedia](http://en.wikipedia.org/wiki/Single-precision_floating-point_format)*.
> 
> #### 4.4.2 Casting
> 
> It is allowed to apply a type casting transformation on a float32! value to convert it to a float! value. Type casting to integer! is also allowed mainly for bits manipulation purpose (this is not a float32! number to integer! number conversion).
> 
> Examples:
> 
> ```
> s: as float32! 3.1415927
print [
   as float! s lf
   as integer! s
]
> ```
> 
> will output
> 
> ```
> 3.14159270000000
1518260631
> ```
> 
> #### 4.4.3 Math operations
> 
> All Red/System math operators (+, -, \*, /, //, %) are supported. The default rounding method on results is "rounding to nearest". Both operands need to be of float32! types (no implicit casting).
> 
> The modulo (//) and remainder (%) operators give the same results when used on float32! values.

### 4.5 Logic!

> The logic! datatype represents boolean values: **TRUE** and **FALSE**. Logic variables are initialized using a literal logic value or the result of a conditional expression.
> 
> As a first class datatype, you can pass logic values and variables as function arguments or use them as function's return value.
> 
> #### 4.5.1 Literal format
> 
> ```
> true
false
> ```
> 
> Using a literal to initialize a logic variable:
> 
> ```
> foo: true
either foo [print "true"][print "false"]
> ```
> 
> will output:
> 
> ```
> true
> ```
> 
> Using a conditional expression to initialize a logic variable:
> 
> ```
> bar: 2 > 5
either bar [print "true"][print "false"]
> ```
> 
> will output:
> 
> ```
> false
> ```

### 4.6 C-string!

> A c-string! value is a sequence of non-null bytes terminated by a null byte. A c-string variable holds the memory address of the first byte of the c-string, so it can be viewed as an implicit pointer to a variable of the byte! datatype. A c-string having a null character as first byte is an empty c-string.
> 
> #### 4.6.1 Syntax
> 
> Literal c-strings are defined using double quotes delimiters or a pair of matching curly braces:
> 
> ```
> foo: "I am a c-string"
bar: {I am
  a multiline
  c-string
}
> ```
> 
> C-string null byte ending
> 
> You don't have to add a null byte to literal c-strings. It is added automatically during compilation.
> 
> #### 4.6.2 C-string length
> 
> It is possible to retrieve the number of bytes (**excluding the null** end marker) in a c-string at runtime using the LENGTH? function:
> 
> ```
> a: length? "Hello"                     ;-- here length? will return 5
> ```
> 
> Length? vs Size?
> 
> Do not confuse the **length?** function with the **size?** function. **Size?** function will return the number of bytes in the c-string, including the ending null byte.
> 
> #### 4.6.3 C-string arithmetic
> 
> It is possible to apply some simple math operations on c-string variables like additions and subtractions. C-string address would be increased or decreased by the integer argument.
> 
> Syntax
> 
> ```
> <c-string> + <n>
<c-string> - <n>

<c-string> : c-string variable
<n>        : expression resulting in an integer! value
> ```
> 
> Example:
> 
> ```
> s: "hello"                             ;-- let's suppose s points to address 40000000h

s: s + 1                               ;-- now s points to address 40000001h
print s                                ;-- "ello" would be printed
s: s + 1                               ;-- now s points to address 40000002h   
print s                                ;-- "llo" would be printed
> ```
> 
> #### 4.6.4 Accessing bytes
> 
> It is possible to access individual bytes in a c-string using path notation:
> 
> ```
> <c-string>/integer!                    ;-- literal integer index provided
<c-string>/<index>                     ;-- index provided by a variable

<c-string> : a c-string variable
<index>    : an integer variable
> ```
> 
> The returned value will be of the type **byte!**.
> 
> Examples:
> 
> ```
> foo: "I am a c-string"
foo/1  =>  #"I"                        ;-- byte! value (73)
foo/2  =>  #" "                        ;-- byte! value (32)
...
foo/15 => #"g"                         ;-- byte! value (103)
foo/16 => #"^(00)"                     ;-- byte! value (0) (end marker)
> ```
> 
> Important notes
> 
> - In contrast to the C language, indexes in Red/System are **one-based**.
> - The behaviour of path with an index out of bounds is not yet defined. It is better to avoid it.
> 
> Example of a variable used as index:
> 
> ```
> c: 4
foo/c  => #"m"                         ;-- byte! value (109)
> ```
> 
> A simple way to traverse a c-string would be:
> 
> ```
> foo: "I am a c-string"
bar: foo

until [
     print bar/1                   
     bar: bar + 1
     bar/1 = null-byte
]
> ```
> 
> will output:
> 
> ```
> I am a c-string
> ```
> 
> Similarly, it is also possible to modify the c-string's bytes using path notation with an ending colon:
> 
> ```
> <c-string>/integer!:   <value>         ;-- literal integer index provided
<c-string>/<index>:    <value>         ;-- index provided by a variable

<c-string> : a c-string variable
<index>    : an integer variable
<value>    : a byte! value
> ```
> 
> For example:
> 
> ```
> foo: "I am a c-string"
foo/3: #"-"
c: 4
foo/c: #"-"
print foo
> ```
> 
> will output
> 
> ```
> I -- a c-string
> ```

### 4.7 Struct!

> Struct! datatype is roughly equivalent to C struct type. It is a record of one or several values, each value having its own datatype. A struct variable holds the memory address of a struct value.
> 
> Implementation notes:
> 
> - Struct! values members are padded in memory in order to preserve optimal alignment for each target (for example, it is aligned to 4 bytes for IA32 target). **Size?** function will return the size of the struct! value in memory including the padding bytes.
> - Structs declared as values do not hold any pointer as their content is inlined, so their memory location is fixed and cannot be changed by the user.
> 
> #### 4.7.1 Declaration
> 
> Declaring a struct! value is achieved by using the DECLARE STRUCT! sequence followed by a specification block. That block defines struct! value members using pairs of name and datatype definition.
> 
> ```
> declare struct! [
   <member> [<datatype>]
   ...
]
<member>   : a valid identifier
<datatype> : integer! | byte! | logic! | float! | float32! | c-string! |
             pointer! [integer! | byte! | float! | float64! | float32! | pointer!] |
             struct! [<members>] | struct! [<members>] value | function! [<spec>]
> ```
> 
> The returned value of DECLARE STRUCT! is the memory address of the newly created struct! value on the heap. Struct values declared as local variables in functions have their memory slots pre-reserved.
> 
> Note: Struct members are all initialized to zero when a new literal struct! is declared.
> 
> #### 4.7.2 Usage
> 
> ```
> s: declare struct! [
   a   [integer!]
   b   [c-string!]
   c   [struct! [d [integer!] e [float!]]]
]
> ```
> 
> In this example, the struct value has 3 members: a, b, c, each with a different datatype. The c member is a struct! value **pointer**, it needs to be assigned to a struct value to be used. So a correct initialization for the c member would be:
> 
> ```
> s/c: declare struct! [d [integer!]]
> ```
> 
> It is possible to nest struct values (and not just pointers to struct values) by adding the **value** keyword at the tail of a nested struct type specification:
> 
> ```
> s2: declare struct! [
   a   [integer!]
   b   [c-string!]
   c   [struct! [d [integer!] e [float!]] value]
]
> ```
> 
> In this case, the nested struct c storage space is reserved when allocating the space for the parent struct s2. The size of struct s2 is 20 bytes, while the size of s is 12 bytes.
> 
> Struct pointers and struct values can be arbitrarily nested and mixed together. But the assignment rules differ whether it is a struct pointer or a struct value:
> 
> - A struct! variable addressed by pointer can be changed to point to a different location, even if it was referring to a memory location reserved using \`declare\`.
> - A struct! variable addressed by value (contains \`value\` keyword) copies data on assignment from the argument location.
> 
> #### 4.7.3 Accessing members
> 
> Member access is achieved using path notation. Syntax is:
> 
> ```
> <struct>/<member>                      ;-- read access
<struct>/<member>: <value>             ;-- write access

<struct>  : a valid struct variable
<member>  : a valid member identifier in <struct>
<value>   : a value of same datatype as <member>
> ```
> 
> From last example, that would give:
> 
> ```
> foo: s/a                               ;-- reading member 'a in struct 's
s/a: 123                               ;-- writing 123 in member 'a in struct 's
s/b: "hello"
bar: s/c/d                             ;-- deep read/write access is also possible
> ```
> 
> Note: Accessing a function! pointer member will result in dereferencing the pointer.
> 
> It is also possible to acquire a pointer on a struct member using the get-path notation:
> 
> ```
> :<struct>/<member>

<struct>  : a valid struct variable
<member>  : a valid member identifier in <struct>
> ```
> 
> The returned type is always \`pointer! \[integer!]\` in such case. It can be freely type-casted to other pointer types.
> 
> ```
> p: :s/a
p/value                               ;-- returns the value of s/a
p/value: 456                          ;-- sets a new value in s/a
> ```
> 
> #### 4.7.4 Struct arithmetic
> 
> It is possible to apply some simple math operations on struct variables, like additions and subtractions. Struct address would be increased or decreased by the size of the pointed struct value multiplied by the integer argument.
> 
> **Syntax**
> 
> ```
> <struct> + <n>
<struct> - <n>

<struct>   : struct variable
<n>        : integer value
> ```
> 
> **Examples**
> 
> ```
> p: declare struct! [                   ;-- let suppose p = 40000000h
   a [integer!]
   b [pointer! [integer!]]
]                                      ;-- struct memory size would be 8 bytes
p: p + 1                               ;-- now p = 40000008h
> ```
> 
> Note: The struct value size is target and alignment dependent. In the above example, it is supposed to run on a 32-bit system with a struct alignment to 4 bytes.
> 
> #### 4.7.5 Aliases
> 
> Struct! values definitions tend to be quite long, so in some cases, when struct! definitions are required to be inserted in other struct! definitions or in functions specification block, it is possible to use an alias name to reference a struct! definition through the source code. It also allows the self-referencing case to be quite simply solved.
> 
> Notes:
> 
> - An alias is not a value, it doesn't take any space in memory, it can be seen as a *virtual datatype*. So, by convention, alias names should end with an exclamation mark, in order to distinguish them more easily from variables in the source code.
> - Aliased names live in their own namespace, so they cannot interfere with variable names.
> 
> Aliasing syntax:
> 
> ```
> <name>: alias struct! [
   <member> [<datatype>]
   ...
]
<name>     : the name to use as alias
<member>   : a valid identifier
<datatype> : integer! | byte! | pointer! [integer! | byte! | float! | float32! | pointer!] | logic! |
             float! | float32! | c-string! | struct! [<members>] |
             struct! [<members>] value | function! [<spec>]
> ```
> 
> Struct value declaration using an aliased definition:
> 
> ```
> <variable>: declare <alias>

<variable>  : a struct variable
<alias>     : a previously declared alias name
> ```
> 
> Struct usage example:
> 
> ```
> book!: alias struct! [                 ;-- defines a new aliased type
   title       [c-string!]
   author      [c-string!]
   year        [integer!]
   last-book   [book!]                 ;-- self-referenced definition
]

gift: declare struct! [
   first  [book!]                      ;-- reference to a book! struct
   second [book!]                      ;-- reference to a book! struct
]

gift/first: declare book!              ;-- book! struct allocation

gift/first/title:  "Contact"
gift/first/author: "Carl Sagan"
gift/first/year:   1985

gift2: declare struct! [
   first  [book! value]                ;-- inlined book! struct value
   second [book! value]                ;-- inlined book! struct value
]
> ```

### 4.8 Pointer!

> The purpose of the pointer datatype is to hold the memory address of another value. A pointer value is defined by the pointed value address and datatype. As c-string! and struct! are already implicit pointers, the only pointed datatypes allowed are integer!, float!, float32! and byte! (logic! pointer is not needed).
> 
> Byte! pointers are equivalent to c-string! references, the difference lies only in the interpretation of the pointed values. Byte! pointer is meant to point to a stream of byte without a specified bound, while c-string! references an array of bytes terminated by a null byte.
> 
> Implementation note: The memory size of a pointer is 4 bytes on 32-bit systems (and 8 bytes on 64-bit systems).
> 
> #### 4.8.1 Literal format
> 
> New pointers value can be created using the following syntax:
> 
> ```
> declare pointer! [<datatype>]

<datatype>: integer! | byte! | float! | float32! | pointer!
> ```
> 
> Possible syntactic sugar
> 
> The &amp; symbol used in previous revisions of this document has been removed due to the new limited pointer! datatype usage. It could be reintroduced again in the future if required.
> 
> Examples:
> 
> ```
> foo: declare pointer! [integer!]       ;-- equivalent to C's: int *foo;
bar: declare pointer! [byte!]          ;-- equivalent to C's: char *bar;
baz: declare pointer! [float!]         ;-- equivalent to C's: double *baz;
qux: declare pointer! [pointer!]       ;-- equivalent to C's: void **qux;
> ```
> 
> Pointer value initialization
> 
> Do not assume any default value for a pointer value until it is initialized properly. In the current implementation, global pointer variables are set to **null** by default while local pointer variables default value is undefined. This might change in the future to adopt a default value more suitable for debugging (like 0BADBAD0h or similar hex trick).
> 
> #### 4.8.2 Declaration
> 
> Pointer declaration is only required for arguments in functions' specification block. For local pointer variables, the datatype declaration can be omitted and left to the inferencer to guess. (See "Type inference" section)
> 
> ```
> pointer! [<datatype>]

<datatype>: integer! | byte! | float! | float32!
> ```
> 
> Global variables declaration examples (with C equivalents):
> 
> ```
> p: declare pointer! [integer!]         ;-- int *p;
p: declare pointer! [byte!]            ;-- char *p;
p: declare pointer! [float!]           ;-- double *p;
> ```
> 
> Same with local variables declaration examples (with C equivalents):
> 
> ```
> func [/local p [pointer! [integer!]]   ;-- int *p;
func [/local p [pointer! [byte!]]      ;-- char *p;
func [/local p [pointer! [float!]]     ;-- double *p;
> ```
> 
> Example of inferred pointer variable type:
> 
> ```
> foo: func [
   a [struct! [count [integer!]]]
   /local
       p [pointer! [integer!]]         ;-- explicit declaration
][
   foobar p                            ;-- foobar modifies p
   a/count: p/value
]

bar: func [
   a [struct! [count [integer!]]]
   /local p                            ;-- p datatype inferred
][
   p: declare pointer! [integer!]      ;-- p initialized (implicit declaration)
   foobar p
   a/count: p/value
]

bar2: func [
   a [struct! [count [integer!]]]
   /local p                            ;-- p datatype inferred
][
   p: GetPointer a                     ;-- datatype is guessed from return value
   foobar p
   a/count: p/value
]
> ```
> 
> #### 4.8.3 Dereferencing
> 
> Dereferencing a pointer is the operation allowing access to the pointed value. In Red/System, it is achieved by adding a **/value** refinement to the pointer variable (called more generally "path notation"):
> 
> ```
> <pointer>/value                        ;-- read access
<pointer>/value: <value>               ;-- write access

<pointer> : pointer variable
<value>   : a value of same type as in pointer's definition
> ```
> 
> Usage example
> 
> ```
> p:   declare pointer! [integer!]       ;-- declare a pointer on an integer
bar: declare pointer! [integer!]       ;-- declare another pointer on an integer

p: as [pointer! [integer!]] 40000000h  ;-- type cast an integer! to a pointer!
p/value: 1234                          ;-- write 1234 at address 40000000h
foo: p/value                           ;-- read pointed value back
bar: p                                 ;-- assign pointer address to 'bar
> ```
> 
> Note: Remember that a pointed value is undefined (can contain an arbitrary value) until you define it explicitly
> 
> #### 4.8.4 Pointer arithmetic
> 
> It is possible to apply some simple math operations on pointers, like additions and subtractions (as in C). A pointer address will be increased or decreased by the memory size of the pointed value multiplied by the amount to respectively add or subtract.
> 
> ```
> p: declare pointer! [integer!]         ;-- pointed value memory size is 4 bytes

p: as [pointer! [integer!]] 40000000h
p: p + 1                               ;-- p points now to 40000004h
p: p + 1                               ;-- p points now to 40000008h
q: declare pointer! [byte!]            ;-- pointed value memory size is 1 byte
q: as [pointer! [byte!]] 40000000h
q: q + 1                               ;-- p points now to 40000001h
q: q + 1                               ;-- p points now to 40000002h
> ```
> 
> Also, additions and subtractions between pointer addresses are allowed. The result value type is, as usual, the type of left operand.
> 
> ```
> offset: p - q                          ;-- would store 6 in offset
                                       ;-- type of offset is pointer! [integer!]
> ```
> 
> pointer/pointer math &lt;&gt; pointer/integer math
> 
> Unlike in C language, pointer/pointer arithmetics always treat the operands as byte pointers, while pointer/integer arithmetics scales the integer operand to the size of the pointed type.
> 
> #### 4.8.5 Pointer path notation
> 
> It is possible to use path notation to simulate an array with indexed access. Both reading and writing are possible. Indexes are **one-based**.
> 
> **Syntax**
> 
> ```
> <pointer>/<integer>                    ;-- literal integer index provided
<pointer>/<index>                      ;-- index provided by a variable

<pointer>  : a pointer variable
<integer>  : an integer literal value
<index>    : an integer variable
> ```
> 
> Examples:
> 
> ```
> p: declare pointer! [integer!]

p: as [pointer! [integer!]] 40000000h
a: p/1                                 ;-- reads an integer! from 40000000h
p/2: a                                 ;-- writes the integer! to 40000004h
> ```
> 
> Integer variable can also be used as index:
> 
> ```
> p: declare pointer! [integer!]

p: as [pointer! [integer!]] 40000000h
c: 2
p/c: 1234                              ;-- writes 1234 (4 bytes) at 40000004h
> ```
> 
> Note: Pointer's **/value** notation is strictly equivalent to **/1**. The **/value** notation can be considered as syntactic sugar.
> 
> #### 4.8.6 Literal arrays
> 
> A pointer can also point to a one-dimensional array of values literally specified.
> 
> **Syntax**
> 
> ```
> <variable>: [<items>]

<variable> : a pointer of same type as the array items.
<items>    : is a non-empty list of integer!, byte!, float!, logic!, c-string! literal values.
> ```
> 
> The array is statically allocated and can be accessed using pointer path notation or pointer arithmetic. Mixing the different allowed types in the same array is permitted (enumerations can also be used). In such case, the size of each array's slot is either 32-bit, or 64-bit if a float64! value is present.
> 
> The size of a literal array can be retrieved using **size?** keyword.
> 
> Examples:
> 
> ```
> list: [123 456 789]
probe size? list                       ;-- outputs 3
probe list/2                           ;-- outputs 456

s: [#"h" #"e" #"l" #"l" #"o"]
sz: as int-ptr! s
probe size? s                          ;-- outputs 5
probe s/5                              ;-- outputs o

a: ["hello" "Red" "world"]
probe size? a                          ;-- outputs 3
probe as-c-string a/2                  ;-- outputs Red

c: [456 "hello" "Red" "world" #"e" true]
probe size? c                          ;-- outputs 6
probe c/1                              ;-- outputs 456
probe as-c-string c/3                  ;-- outputs Red
probe as-byte c/5                      ;-- outputs e
probe as-logic c/6                     ;-- outputs true

e: [1.23e10 "Hello" 789 "World!" 3.14]
pf: as float-ptr! e
probe pf/1                             ;-- outputs 1.23e+010
probe as-c-string e/3                  ;-- outputs Hello
probe e/5                              ;-- outputs 789
probe as-c-string e/7                  ;-- outputs World!
probe pf/5                             ;-- outputs 3.14
> ```
> 
> Notes:
> 
> - In the second example, this literal array is not equivalent to its c-string! counterpart "hello", as the literal array does not add a NUL character at tail of the sequence.
> - In the last example, pay attention to the different pointer indexes used, depending on the size (32-bit or 64-bit) of referenced value.
> 
> Write access to arrays
> 
> Currently literal arrays allow write access, but there is no bound checking as it is planned to be a feature of a future **array!** first-class datatype.
> 
> #### 4.8.7 Binary arrays
> 
> Binary arrays are a type of literal array made out of bytes only.
> 
> **Syntax**
> 
> ```
> <variable>: #{...hex bytes...}

<variable> : a pointer of [pointer! [byte!] type.
> ```
> 
> The array is statically allocated and can be accessed using pointer path notation or pointer arithmetic. The size in bytes of a binary array can be retrieved using **size?** keyword.
> 
> Examples:
> 
> ```
> table: #{0042FA0100CAFE00AA}
probe size? table                      ;-- outputs 9
probe table/2                          ;-- outputs "B"
probe as integer! table/2              ;-- outputs 66
> ```
> 
> Note: whitespaces and comments are accepted inside binary arrays.
> 
> #### 4.8.8 Null value
> 
> A special **null** value is available to use for pointer! and other pointer-like (pass-by-reference) types (struct!, c-string!) and pseudo-type function!. **Null** does not have a specific type, but can be used to replace any other pointer-like value. So, **null** cannot be used as initializing value for a global variable or a local variable that does not have an explicit type specification.
> 
> **Null** is a first class value, so it can be assigned to a variable, passed as argument to a function or returned by a function.
> 
> Note: It is not possible to explicitly cast **null** to a given type, only implicit type casting automatically done by the compiler is allowed.
> 
> Examples:
> 
> ```
> a: declare pointer! [integer!]
a: null                                ;-- valid assignment, 'a type is defined
b: null                                ;-- invalid assignment, type of b cannot
                                       ;--  be deduced by the compiler

foo: func [s [c-string!] return: [c-string!]][
   if s = null [
       print "error"
       return null
   ]
   return uppercase s
]

b: foo "test"                          ;-- will set b to "TEST"
b: foo null                            ;-- will print "error" and set b to null
> ```
> 
> #### 4.8.9 C void pointer
> 
> There is no specific support in Red/System for C-like void pointers. The official way is to use a pointer! \[byte!] type to represent C void* pointers.
> 
> For pointers to c-string! or struct! variables, a pointer variable can be used then dereferenced and converted using type casting to the target type.
> 
> Example:
> 
> ```
> p-buffer!: alias struct! [buffer [c-string!]]

set-hello: function [
   s [p-buffer!]
][
   s/buffer: "hello"
   s                                   ;-- equivalent to C's char **
]

foo: func [
   /local
       c [p-buffer!]
][
   c: declare p-buffer!
   set-hello c
   print c/buffer
]

foo                                    ;-- call foo function
> ```
> 
> would print
> 
> ```
> hello
> ```
> 
> Runtime macro byte-ptr!
> 
> The runtime defines a byte-ptr! macro (just defined as: pointer! \[byte!]) to be used as an equivalent to C void* for raw memory accesses.
> 
> #### 4.8.10 Variable pointer
> 
> It is possible to get a pointer on an existing variable for the following datatypes:
> 
> - integer!
> - byte!
> - float!
> - float32!
> - pointer!
> 
> **Syntax**
> 
> ```
> :<variable>

<variable> : a variable name of allowed type.
> ```
> 
> This expression will return a pointer value which type depends on the variable type, so:
> 
> variable :variable integer! pointer! \[integer!] byte! pointer! \[byte!] float! pointer! \[float!] float32! pointer! \[float32!] pointer! pointer! \[pointer!]
> 
> Example:
> 
> ```
> s: declare pointer! [integer!]
a: 123
s: :a
print s/value       ;-- will output 123
> ```
> 
> Pointer on local variable
> 
> It is allowed to get a pointer on a local variable, however, special attention should be provided to avoid using such pointer once the function has returned, this would result in most cases in crashes caused by stack corruption!

### 4.9 Type Casting

> Casting is achieved using the \`**as**\` keyword followed by the target type and the value to cast.
> 
> Type casting is possible between value of compatible types. Compatible types are defined in the following type casting reference matrix. A run-time type conversion might be generated for some types combinations.
> 
> **Syntax**
> 
> ```
> as <new-type> <expr>
as [<new-type>] <expr>                 ;-- alternative syntax
as <new-type> keep <expr>

<expr>     : any valid R/S expression.
<new-type> : integer! | byte! |  logic! | c-string! | float! | float32! |
             pointer! [integer!] | struct! [<members>] |
             <alias-name>
> ```
> 
> Notes:
> 
> - The optional **keep** keyword ensures that all bits are preserved, and that only the type is changed.
> - Multiple nested type castings are not allowed and will raise a compilation error.
> - Trying to assign a value to a variable of different type without a proper type casting, will result in a compilation error.
> 
> Example:
> 
> ```
> foo: 0                                 ;-- foo is an integer variable
bar: declare pointer! [integer!]       ;-- bar is a pointer variable

foo: as integer! bar                   ;-- type casting
bar: as pointer! [integer!] foo
> ```
> 
> **Type casting reference matrix**
> 
> Keep in mind that pointer!, c-string!, struct! and function! are passed by reference, so the casting below for these datatypes is applied on their memory address value.
> 
> source&gt;&gt; byte! integer! logic! c-string! pointer! struct! float! float32! function! byte! WARNING as byte! ¹ true»#"^(01)"  
> false»#"^(00)" ERROR ERROR ERROR ERROR ERROR ERROR integer! as integer! WARNING true»1  
> false»0 as integer! as integer! as integer! to integer!³ to integer!³ as integer! logic! #"^(00)"»false  
> else»true 0»false  
> else»true WARNING null»false  
> else»true null»false  
> else»true null»false  
> else»true ERROR ERROR ERROR c-string! ERROR as c-string! ERROR WARNING as c-string! as c-string! ERROR ERROR ERROR pointer! ERROR as pointer! ERROR as pointer! WARNING as pointer! ERROR ERROR as pointer! struct! ERROR as struct! ERROR as struct! as struct! WARNING ERROR ERROR ERROR float! ERROR to float! ERROR ERROR ERROR ERROR WARNING as float! ² ERROR float32! ERROR to float32! ERROR ERROR ERROR ERROR as float32! ² WARNING ERROR function! ERROR as function! ERROR as function! as function! as function! ERROR ERROR as function!
> 
> ¹ Casting allowed, but integer values higher than 255 will be truncated, so beware!  
> ² A data modification can occur.  
> ³ Rounded towards zero.

### 4.10 Size?

> **Syntax**
> 
> ```
> size? <type>
size? "<string>"

<type>     : an valid type name.
"<string>" : a c-string literal value.
> ```
> 
> **Size?** returns the memory storage size in bytes required by a value of given type. When passed a c-string literal value, it will return the number of bytes in the c-string, including the ending null byte.
> 
> **Example**
> 
> ```
> size? byte!                ;-- will return 1
size? integer!             ;-- will return 4
s!: alias struct! [
   a [integer!]
   b [float32!]
]
size? s!                   ;-- will return 8
> ```
> 
> Dynamic string use cases
> 
> Size? can only be used on a literal c-string, when only a c-string pointer is available use **length?** function.

## 5. Expressions

> Expressions are the basic building blocks of a Red/System program. They are composed of:
> 
> - variables
> - literal values
> - function calls
> - operator calls
> - sub-expression in parentheses

### 5.1 Formal grammar rules

> The grammar rules are specified in [BNF](http://en.wikipedia.org/wiki/Backus%E2%80%93Naur_Form) format, except when using ... to mark a definition in native language.
> 
> ```
> <literal>       ::= ... any valid Red/System literal value ...
<variable>      ::= ... any valid Red/System variable name ...
<logic-call>    ::= ... function call that returns a value of logic! type ...
<func-call>     ::= ... function call that returns a value ...
<statement>     ::= ... statement or function without return value...

<logic-literal> ::= "true" | "false"

<math-op>       ::= "+" | "-" | "*" | "/" | "//" | "%"
<bitwise-op>    ::= "and" | "or" | "xor"
<comparison-op> ::= "=" | "<>" | "<" | "<=" | ">=" | ">"
<op>            ::= <math-op> | <bitwise-op>

<cond-expr>     ::= <value> <comparison-op> <expression>
<condition>     ::= <logic-literal> | <logic-call> | <cond-expr>

<all>           ::= "ALL" "[" <condition>+ "]"
<any>           ::= "ANY" "[" <condition>+ "]"
<short-circuit> ::= <all> | <any>

<paren>         ::= "(" <expression> ")"
<value>         ::= <variable> | <literal> | <paren> | "null"

<infix>         ::= <value> <op> <expression>
<prefix>        ::= <func-call> <expression>* | <statement> <expression>* 
<call>          ::= <prefix>+ | <infix> | <cond-expr>

<expression>    ::= <call> | <value> | <short-circuit>
> ```
> 
> An expression can be used standalone, after an assignment or as argument to some statements (RETURN, IF or EITHER used as statement).
> 
> **Examples**
> 
> ```
> a: 123
foo a + 1
0 < foo a + 1
any [(0 < foo a + 1) a > 0]

if all [(0 < foo a + 1) a > 0][print "ok"]
> ```

### 5.2 Evaluation order rule

> Expressions are evaluated from **left to right**. There is no operator precedence except for infix functions which do have precedence over prefix calls.
> 
> **Examples**
> 
> ```
> 1 + 2 * 3                              ;-- (1 + 2) * 3 returns 9
1 + 2 * 3 = 9                          ;-- ((1 + 2) * 3) = 9 returns TRUE
9 = 1 + 2 * 3                          ;-- ((9 = 1) + 2) * 3 raises an error!

1 + (2 * 3)                            ;-- 1 + (2 * 3) returns 7

foo 1 + 2                              ;-- foo (1 + 2)
1 + foo 2 * 3                          ;-- 1 + (foo (2 * 3))
> ```

## 6. Functions

> Function definition and usage is pretty straightforward in Red/System. The function specification block contains all the definitions required by the function. This includes:
> 
> - calling arguments
> - optional returned value type
> - declaration of local variables
> - special attributes
> 
> Dialects
> 
> The specification block is a Red/System dialect (DSL), so the words inside such block are interpreted specifically and relatively to this *function definition* dialect, they are not related or affected by other namespaces, like the global variables namespace. A consequence is that using the type names as variables names is possible, but not recommended in order to keep the source code more easily readable.

### 6.1 Declaration

> **Syntax**
> 
> ```
> <name>: func | function [
   [<attributes>]                      ;-- optional part
   "<function purpose>"                ;-- optional doc-string
   <argument> [<datatype>]
    "<argument description>"           ;-- optional doc-string
   ...
   return: [<datatype>]                ;-- returned value type (optional part)
   "<returned value description>"      ;-- optional doc-string
   /local                              ;-- local variables (optional part)
   <local> [<datatype>]
   ...
][
   <body>
]

<name>       : function's name
<attributes> : special attributes
<argument>   : function's argument indentifier
<datatype>   : integer! | byte! | logic! | 
               pointer! [integer! | byte! | float! | float32! | pointer!] |
               float! | float32! | c-string! | struct! [<members>] |
               struct! [<members>] value | <alias> | <alias> value
<local>      : local variable
<body>       : function's body code
<alias>      : struct alias
> ```
> 
> Doc-strings are just optional documentation that can be processed by any external tool, they have no runtime effect.
> 
> Func vs Function
> 
> Currently, **function** is a synonym for **func** in Red/System. In future, however, the behaviour of **function** in Red/System may be changed to match the behaviour of **function** in Red (i.e. all set-words are assumed locals). Until this change has been decided, it may be wise to use the **func** keyword instead of **function** in Red/System code, particularly in cases where its usage would be affected by such a change.
> 
> **Examples**
> 
> ```
> hello: func [][print "hello"]          ;-- no arguments, no locals, no return value

why?: func [return: [integer!]][42]    ;-- minimal function returning an integer

inc: func [                            ;-- increment an integer
   a [integer!]
   return: [integer!]
][
   a + 1                               ;-- last value is returned
]

percent?: func [                       ;-- return relative percentage of a / b
   a [integer!]
   b [integer!]
   return: [integer!]
   /local c                            ;-- declare local variables
][
   c: 100
   a * c / b
]
> ```
> 
> Grouping of arguments or local variables by type is also possible.
> 
> **Example**
> 
> ```
> percent?: func [
   a b [integer!]
   return: [integer!]
   /local
       c d [integer!]
][
   c: 20
   d: c + 80
   a * d / b
]
> ```
> 
> Arguments passing
> 
> In the current implementation, pointer!, integer!, byte!, float!, float32! and logic! arguments are passed by value, while c-string! and struct! arguments are passed by reference. Adding the \`value\` keyword after a struct! type specification, allows it to be passed by value (works also for returned value).

### 6.2 Return value

> Any function is able to return a value if necessary. This is trivially achieved as last expression in function's body will be automatically returned if:
> 
> - a RETURN: statement is present in function's spec block
> - the datatype of the function ending expression matches the one declared after the RETURN: statement
> 
> Returning struct by value
> 
> By default, a struct is returned by reference. To return a struct by value, a \`value\` keyword needs to be added in the return specification block. For example:
> 
> ```
> foo: func [return: [struct! [n [integer!] value]][...]
> ```
> 
> On the implementation side, Red/System follows the common ABI used by mainstream C compilers, so that passing structs to/from a C library should work fine.

### 6.3 Attributes

> It is possible to change how the function will behave at runtime using special attributes.
> 
> #### 6.3.1 Infix
> 
> Allow the function to be called using an infix syntax. The function must take two arguments exactly or else a compilation error will be raised. Example:
> 
> ```
> avg: func [[infix] a [integer!] b [integer!] return: [integer!]][
   (a + b) / 2
]

10 avg 6
> ```
> 
> will return:
> 
> ```
> 8
> ```
> 
> Notes:
> 
> - When the **infix** syntax is used, the prefix syntax is still allowed, but it will work only if there is no value on the left side of the function call. Example:
> 
> ```
> func [return: [integer!]][
   avg 10 6                            ;-- will return 8 as well               
]                      

print "ok" avg 10 6                    ;-- will produce a compilation error
> ```
> 
> - The left-to-right evaluation rule applies also for user-defined infix functions, so:
> 
> ```
> 10 avg 6 + 2                           ;-- avg is executed first, then +
> ```
> 
> is not equivalent to
> 
> ```
> 10 avg (6 + 2)                         ;-- + is executed first, then avg
> ```
> 
> #### 6.3.2 Cdecl
> 
> Changes function's calling convention to C convention. This allows to safely pass a Red/System function as argument to imported C functions.
> 
> Example:
> 
> ```
> #import [
    "foo.dll" cdecl [
        foo: "foo" [
            fun     [function! [a [integer!] b [integer!] return: [logic!]]]
            return: [integer!]
        ]
    ]
]

compare: func [
    [cdecl]                            ;-- use C calling convention
    left [integer!] right [integer!]
    return: [logic!]
][
    left <= right
]

foo :compare                           ;-- pass the function pointer
> ```
> 
> Stdcall support
> 
> The **stdcall** attribute is also accepted (it is already the default calling convention in Red/System), but will have no effect for internal functions. Imported functions with such attribute will be compiled as callbacks, but in such case, the more explicit **callback** attribute should be used.
> 
> #### 6.3.3 Callback
> 
> The purpose of the **callback** attribute is to manually force a callback compilation mode for a function that the compiler failed to infer as a callback. It can be used as a more meaningful replacement for **stdcall** when used on Windows.
> 
> The compiler can correctly infer callbacks when a function pointer is passed as a get-word to an imported function call. Other cases of passing a Red/System function pointer cannot be properly detected as external callbacks.
> 
> For example, if Red/System function pointers are passed to an external API in an indirect way (filling an array or a structure), and those functions will be later called by the external code (OS or a library), the **callback** attribute \*must* be used in order for correct code to be generated. Moreover, if the external caller is using C calling convention, then the additional **cdecl** is required.
> 
> #### 6.3.4 Variadic
> 
> Triggers the variable argument mode for native or imported functions. A native function using this attribute must provide two arguments in its specification block:
> 
> - an integer variable for the arguments count
> - a pointer for the argument list (pointer! \[integer!])
> 
> An imported function just needs the attribute without any other arguments declaration.
> 
> Examples of definition:
> 
> ```
> my-print: func [                      ;-- native function
  [variadic]
  count [integer!] list [int-ptr!]
][
  print ["count: " count lf]
  until [
      print [list/value lf]
      list: list + 1
      count: count - 1
      zero? count
  ]
]

#import [                              ;-- imported function
  LIBC-file cdecl [
      printf: "printf" [[variadic]]   ;-- no need to specify any argument here
  ]
]
> ```
> 
> Passing arguments to a variadic function is achieved by wrapping them in a block (squared brackets delimited list).
> 
> Example of calls:
> 
> ```
> my-print ["hello" 123 "world"]
> ```
> 
> will output:
> 
> ```
> count: 3
00402035                               ;-- pointer to "hello" c-string
0000007B                               ;-- 123 in hexadecimal
00402030                               ;-- pointer to "world" c-string
> ```
> 
> Calling an imported variadic function:
> 
> ```
> printf ["%s %i %s" "hello" 123 "world"]
> ```
> 
> will output:
> 
> ```
> hello 123 world
> ```
> 
> Compatibity with other attributes
> 
> **Variadic** attribute can only be used alone or with the **cdecl** attribute.
> 
> #### 6.3.5 Typed
> 
> Triggers the variable argument mode with type information for native functions. **Typed** is similar to the **variadic** attribute. A native function using this attribute must provide two arguments in its specification block:
> 
> - an integer variable for the arguments count
> - a pointer for the argument records (using the **typed-value!** alias)
> 
> The **typed-value!** alias is defined as
> 
> ```
> typed-value!: alias struct! [
   value   [integer!]                  ;-- argument value or pointer
   type    [integer!]                  ;-- argument type   
]
> ```
> 
> Types are defined by the runtime as:
> 
> ```
> #define type-logic!        1
#define type-integer!      2
#define type-byte!         3
#define type-float32!      4
#define type-float64!      5
#define type-float!        5
#define type-c-string!     6
#define type-byte-ptr!     7
#define type-int-ptr!      8
#define type-function!     9
#define type-struct!       1000
#define any-struct?        [1000 <=]
#define alias?             [1001 <=]
> ```
> 
> NULL value type ID is set by convention to type-int-ptr! ID (pointer! \[integer!]).
> 
> Typed and imported function
> 
> It is possible to use **typed** attribute for an imported function, but it needs to meet the specific stack layout required by this attribute, so should probably be reserved only for imported function written in Red/System.
> 
> Example of definition:
> 
> ```
> vprint: func [
  [typed]
  count [integer!] list [typed-value!]
][
  print ["count: " count lf]
  until [
      print [list/value " : "]
      print [form-type list/type lf]  ;-- form-type converts a type ID to a c-string
      list: list + 1
      count: count - 1
      zero? count
  ]
]
> ```
> 
> Passing arguments to a variadic function with type information is achieved by wrapping them in a block (squared brackets).
> 
> Example of calls:
> 
> ```
> vprint ["hello" 123 "world"]
> ```
> 
> will output:
> 
> ```
> count: 3
00402043 : c-string!                   ;-- pointer to "hello" c-string
0000007B : integer!                    ;-- 123 in hexadecimal
0040203E : c-string!                   ;-- pointer to "world" c-string
> ```
> 
> Compatibity with other attributes
> 
> **Typed** attribute can only be used on its own or with the **cdecl** attribute.
> 
> #### 6.3.6 Custom
> 
> It is sometimes desirable to have full control over the native stack layout of a function call, for example, when the function call needs to be dynamically constructed. The **custom** attribute allows you to manually **push** values on stack and still generate a correct function call with adequate stack cleanups. This is mostly useful with imported C functions that rely on **cdecl** convention, which requires the caller to clean-up the stack. The **custom** attribute will take care of it in a cross-platform way.
> 
> Example:
> 
> ```
> foo: as function! [[custom]] <imported-c-function>
push 123
push 0
foo 2                               ;-- custom call with 2 arguments
> ```
> 
> A custom call requires an integer number that is consumed internally by the compiler. That integer specifies the number of arguments pushed on stack (which will be cleaned up when the call returns).
> 
> Stack alignment
> 
> Stack alignment constraints are not enforced by the **custom** attribute, so be sure to respect the platform-specific conventions with regards to alignment (mainly concerns macOS and ARM-based platforms). In order to do it in a clean and cross-platform way, use the **system/stack/align** call.
> 
> #### 6.3.7 Catch
> 
> Allows the function to catch runtime exceptions. The execution will resume inside the function just after the call where the exception occured. See [Exceptions](#section-6.8) section for more info.
> 
> Compatibity with other attributes
> 
> **Catch** attribute can only be used on its own.

### 6.4 Type inference

> Functions offer a limited type inference possibility for local variables.
> 
> In practice, it means that it is allowed to omit a local variable type declaration as long as the variable is initialized properly.
> 
> Example:
> 
> ```
> foo: func [
   a [integer!]
   return: [integer!]
   /local c                            ;-- omitted local variable type
][
   c: 10                               ;-- variable type is integer!
   a + c
]
> ```

### 6.5 Calling a function

> Calling a function is achieved by writing its name followed by the required number of arguments.
> 
> *(from the previous examples)*
> 
> ```
> hello                                  ;-- will print "hello" in the standard output

answer: why?                           ;-- will return 42 in variable 'answer

foo: 4
foo: inc foo                           ;-- foo holds 5 after the call to 'inc

bar: percent? 3 4                      ;-- bar holds 75
> ```
> 
> It is also possible to pipe several function calls together:
> 
> ```
> foo: percent? 11 inc inc why?          ;-- will return 25 in foo
> ```

### 6.6 Function pointer

> It is possible to obtain a function address to pass it, for example, as an argument to external calls with callbacks.
> 
> **Syntax**
> 
> ```
> :<function name>
> ```
> 
> Example:
> 
> ```
> progress: func [[cdecl] count [integer!]][
   print "."                           ;-- make the user see some progress
]

get-file "bigfile.avi" :progress       ;-- blocking job would call 'progress
                                       ;-- periodically
> ```
> 
> A function pointer can be assigned to a variable for later use or dereferencing. Such a variable cannot be passed as an argument to other functions, nor returned by a function. Function pointer pseudo-type is not a first class datatype.
> 
> Note: Function address is returned as a function pointer pseudo-type, so it cannot be used as-is in expressions, but it can be safely casted to an integer! if required.
> 
> #### 6.6.1 Function definition alias
> 
> In order to avoid repeating function specification, it is possible to define aliases by using ALIAS keyword.
> 
> **Syntax**
> 
> ```
> <name>: alias function! [<spec>]

<name> : aliased identifier (by convention, a ! suffix is added)
<spec> : a function valid specification block
> ```
> 
> Example:
> 
> ```
> foo!: alias function! [n [integer!] return: [integer!]]
bar: func [f [foo!]][...]
> ```
> 
> #### 6.6.2 Function dereferencing
> 
> A function pointer can be dereferenced so that the function being pointed at will be called, like any other function. Correct number and type of arguments needs to be passed.
> 
> Example:
> 
> ```
> foo!: alias function! [n [integer!] return: [integer!]]
inc: func [n [integer!] return: [integer!]][
   n + 1
]

bar: as foo! :inc

print bar 2                            ;-- will output 3
> ```
> 
> Alternatively, you can dereference a function! pointer stored as a struct member by just accessing it.
> 
> ```
> s: declare struct! [
   inc [function! [n [integer!] return: [integer!]]]
]

s/inc: :inc

probe s/inc 3                          ;-- will output 4
> ```

### 6.7 Premature exiting

> Exiting at a function's end is not always desirable. Sometimes, conditional premature exiting from the function is required. This can be done using EXIT or RETURN special keywords.
> 
> #### 6.7.1 Exit
> 
> Immediatly quits the function.
> 
> ```
> test: func [a [integer!]][
   if zero? a [exit]                   ;-- exit the function here if a = 0
   ...                                 ;-- if a <> 0, continue processing...
]
> ```
> 
> #### 6.7.2 Return
> 
> Immediately quits the function and returns a value.
> 
> ```
> test: func [
   a [integer!]
   return: [c-string!]
][
   if zero? a [
       return "Not allowed"            ;-- exit the function here if a = 0
   ]
   "ok"                                ;-- return "ok" if a <> 0
]
> ```

### 6.8 Subroutines

> Subroutines are reusable code parts in a function's body that can be called from within the function where they are defined only.
> 
> **Syntax**
> 
> ```
> <name>: [<body>]

<name> : subroutine's name (local variable).
<body> : subroutine's code (regular R/S code).
> ```
> 
> A subroutine name is a local variable that needs to be defined as of type **subroutine!**, else a compilation error will occur. Once defined, a subroutine can be called by invoking its name from anywhere in the function code (but after its own definition). A subroutine returns its last value to the caller.
> 
> Example:
> 
> ```
> foo: func [
   a [integer!]
   return: [integer!]
   /local
       do-error [subroutine!]
][
   do-error: [print "Wrong number!" return err]
   switch a [
       0  [err: 10 do-error]
       5  [err: 20 do-error]
       10 [err: 30 do-error]
   ]
   print "Correct!"
]
> ```
> 
> The **subroutine!** type is currently a pseudo-type, not a first-class type, so it cannot be passed as argument or returned from a function.

## 7. Scoping

> In Red/System, variables are statically scoped. The place in source code where a variable is declared determines its scope.

### 7.1 Global Context

> Global context is defined as the global namespace where all global variables and functions are defined. This context is unique. As a simple rule, every variable not declared in a function is a global variable bound to global context.
> 
> Example:
> 
> ```
> foo: 123                               ;-- global variable

f: func [/local bar [integer!]][
   bar: 123                            ;-- locally scoped variable
]
> ```

### 7.2 Functions Contexts

> Each defined function has its own local context. Variables declared in a function's definition block are locally scoped and can't be accessed outside of the function's body. On the other hand, global variable can be referenced and modified from functions. If a local variable has the same name as a global one, the local one will take precedence in function's body. The value of the homonym global variable won't be affected by local redefinitions in functions contexts.
> 
> Example:
> 
> ```
> foo: 1                                 ;-- global variable
var: 2

f: func [
   return: [integer!]
   /local 
       bar [integer!]
][
   bar: 3
   foo + var + bar                     ;-- will return 6
]

f: func [
   return: [integer!]
   /local 
       bar [integer!]
       var [integer!]
][
   bar: 3
   var: 10                             ;-- 'var is a local variable here
   foo + var + bar                     ;-- will return 14
]
> ```
> 
> #### 7.2.1 USE keyword
> 
> Inside a function body, it is possible to create arbitrary local contexts, with additional local variables thanks to the USE keyword:
> 
> **Syntax**
> 
> ```
> use [<spec>][<code>]

<spec> : list of local variables followed by optional type specification
<code> : body block of code
> ```
> 
> This creates a local context where new variables are available in the body block. Those variables are freed on exiting the body block. Using a variable name already existing in the function specification will result in a compilation error.
> 
> Local variables listed in spec block follow the same syntax as local variables in function spec block. Variable names can be followed by a type specification, or let the compiler infer the type (except for structs by value, which must have a declared type). Local contexts created by USE can also be freely nested (as long as no variable names from outer local contexts are re-used).
> 
> Examples:
> 
> ```
> f: func [
   /local 
       foo [integer!]
][
   foo: 1
   use [bar][
       bar: 2
       use [baz][
           baz: 3
           print foo + bar + baz       ;-- will output 6
       ]
   ]
]

f: func [
   cond    [logic!]
   return: [integer!]
   /local 
       bar [integer!]
][
   bar: 3
   if cond [
       use [var][
           var: 10                     ;-- 'var is a local variable here
           bar: var + bar              ;-- will return 14
       ]
   ]
   bar
]
> ```

### 7.3 Namespaces

> It is possible to define local namespaces to provide local contexts able to encapsulate source code.
> 
> **Syntax**
> 
> ```
> <name>: context [<code>]

<name> : namespace identifier
<code> : body block of code
> ```
> 
> Any code is allowed in the body block including function definitions. All variables and functions created will have a local name that can be accessed locally or from outside using context name prefix in a path notation:
> 
> ```
> <name>/<variable>                       ;-- reading a variable from outside
<name>/<variable>:                      ;-- setting a variable from outside
<name>/<func-name>                      ;-- invoking a function from outside
> ```
> 
> The following elements are affected by namespace and become locally defined when declared in a context body block:
> 
> - variables
> - functions
> - imported functions
> - enumerations
> - aliases
> 
> Example:
> 
> ```
> b: 0
a: context [
   b: 123

   foo: func [/local b][
       b: 1
       print-line b
   ]

   print-line b                        ;-- will output 123
   foo                                 ;-- will output 1
]

print-line b                           ;-- will output 0
print-line a/b                         ;-- will output 123
a/foo                                  ;-- will output 1
a/b: a/b + 1
print-line a/b                         ;-- will output 124
> ```
> 
> Namespaces are not objects!
> 
> Even if they look like objects, namespaces only exist at compilation time, so they cannot be manipulated at run-time.
> 
> #### 7.3.1 Nested namespaces
> 
> Nesting namespaces is allowed. When conflicting names are used for variables or functions, the nearest definition is used.
> 
> Example:
> 
> ```
> a: context [
   b: 123

   c: context [
       #enum colors! [red green blue]
       b: "hello"
       foo: func [][print-line b]
   ]

   print-line b                        ;-- will output 123
   c/foo                               ;-- will output hello
]

print-line a/b                         ;-- will output 123
a/c/foo                                ;-- will output hello
print-line a/c/b/2                     ;-- will output e
print-line a/c/blue                    ;-- will output 2
> ```
> 
> #### 7.3.2 Global context access
> 
> From nested namespaces, in order to access an indentifier from global context when it is also defined locally, a special virtual path is provided to solve such cases:
> 
> **Syntax**
> 
> ```
> system/words/<name>                    ;-- calling a function, reading a variable
system/words/<name>:                   ;-- setting a variable

<name> : identifer or access path
> ```
> 
> Example:
> 
> ```
> b: 123
a: context [
   b: 0
   print-line system/words/b           ;-- will output 123
]
> ```
> 
> Any global context identifier can be retrieved this way.
> 
> #### 7.3.3 WITH keyword
> 
> In order to limit source code verbosity, the namespace prefix can be omitted if the source code is enclosed in a **with** body block.
> 
> **Syntax**
> 
> ```
> with <name>    [<code>]
with [<names>] [<code>]                ;-- alternative syntax for multiple names

<name>  : namespace identifier
<names> : list of namespace identifiers
<code>  : body block of code
> ```
> 
> Note: If multiple namespaces are specified and if they share same identifier(s), the last defined namespace (from the compiler point of view) takes precedence.
> 
> Example:
> 
> ```
> a: context [b: 0]
c: context [b: 1 d: 123]

with a [
   print-line b                        ;-- will output 0
   print-line a/b                      ;-- will output 0
]

with [a c][
   print-line d                        ;-- will output 123
   print-line b                        ;-- will output 1 ('c is defined after 'a)
]
> ```

## 8. Infix operators

> Infix operators take two arguments and are positioned between them.

### 8.1 Math operators

> The following math operations apply on integer or float values. When the operation results in an exceeded memory storage limit, *behaviour to be defined*.
> 
> **Addition**: +
> 
> ```
> value1 + value2
> ```
> 
> **Subtraction**: -
> 
> ```
> value1 - value2
> ```
> 
> **Multiplication**: *
> 
> ```
> value1 * value2
> ```
> 
> **Division**: /
> 
> ```
> value1 / value2
> ```
> 
> CPU-specific behaviors
> 
> For the two following edge cases:
> 
> - division by zero
> - division overflow (-2147483648 / -1)
> 
> The behavior depends on the compilation mode and CPU target:
> 
> IA-32:
> 
> - debug mode: runtime exception.
> - release mode: runtime exception.
> 
> ARM:
> 
> - debug mode: runtime exception.
> - release mode: returns 0 on division by zero, and -2147483648 on overflow.
> 
> **Remainder**: %
> 
> ```
> value1 % value2
> ```
> 
> Note: a remainder will be negative if the divisor is negative. Same as in C or // operator in REBOL. Float types are not supported.
> 
> **Modulo**: //
> 
> ```
> value1 // value2
> ```
> 
> Note: a positive result is always returned. Same as 'modulo function in REBOL. Float types are not supported.
> 
> where
> 
> ```
> value1 : an expression returning an integer!
value2 : expression of same (or compatible) datatype as <value1>
> ```
> 
> The resulting value type for math operators is the type of the left argument (an implicit type casting is operated when required).
> 
> Note: for + and - operators, a pointer!, struct! or c-string! value can be used for both arguments or as first argument with an integer expression as second argument (see "Pointer arithmetic").

### 8.2 Bitshift operators

> **Signed left shift**: &lt;&lt;
> 
> ```
> value1 << value2
> ```
> 
> **Signed right shift**: &gt;&gt;
> 
> ```
> value1 >> value2
> ```
> 
> **Unsigned right shift**: &gt;&gt;&gt;
> 
> ```
> value1 >>> value2
> ```
> 
> where
> 
> ```
> value1 : an expression returning an integer! or byte!
value2 : integer! expression restricted to 0-31 range only.
> ```
> 
> Note: There is no unsigned left shift operator as it is the same as the signed left shift one.

### 8.3 Bitwise operators

> **Bitwise OR**: or
> 
> ```
> value1 or value2
> ```
> 
> **Bitwise XOR**: xor
> 
> ```
> value1 xor value2
> ```
> 
> **Bitwise AND**: and
> 
> ```
> value1 and value2
> ```
> 
> **Bitwise / Logical NOT**: not
> 
> ```
> not value1
> ```
> 
> where
> 
> ```
> value1 : an expression returning an integer!, byte! or logic!
value2 : expression of same datatype as <value1>
> ```
> 
> Note: Logical NOT will return the opposite of the logic argument (TRUE&lt;=&gt;FALSE), while bitwise NOT will apply one's complement on the integer argument.

### 8.4 Comparison operators

> These operators can be used only where a condition is allowed. See "Control flow functions" section for a list of functions using conditions.
> 
> **Equal**: =
> 
> ```
> value1 = value2
> ```
> 
> **Not equal**: &lt;&gt;
> 
> ```
> value1 <> value2
> ```
> 
> **Greater than**: &gt;
> 
> ```
> value1 > value2
> ```
> 
> **Less than**: &lt;
> 
> ```
> value1 < value2
> ```
> 
> **Greater than or equal**: &gt;=
> 
> ```
> value1 >= value2
> ```
> 
> **Less than or equal**: &lt;=
> 
> ```
> value1 <= value2
> ```
> 
> where
> 
> ```
> value1 : an expression returning a integer!, byte!, float!, float32!, 
         c-string!, pointer! or struct!

value2 : expression of same datatype as <value1>
> ```
> 
> Note:
> 
> - = and &lt;&gt; can also be used to compare logic! values.
> - For c-string!, pointer! and struct!, comparisons are done on references, not on the value pointed at.

## 9. Control flow functions

### 9.1 if

> Execute a block of code if a given condition is true. IF does not return any value, so it cannot be used in an expression.
> 
> **Syntax**
> 
> ```
> if <condition> [<code>]

<condition> : a conditional expression
<code>      : code to execute if the condition is true
> ```
> 
> **Example**
> 
> ```
> if a < 0 [print "a is negative"]
> ```

### 9.2 either

> Execute a block of code if a given condition is true, else execute an alternative block of code. If last expressions in both blocks have the same type, EITHER can be used inside an expression.
> 
> **Syntax**
> 
> ```
> either <condition> [<code>][<alternative>]

<condition>   : a conditional expression
<code>        : code to execute if the condition is true
<alternative> : code to execute if the condition is false
> ```
> 
> **Examples**
> 
> ```
> either a < 0 [
   either a = 0 [
       msg: "zero"
   ][
       msg: "negative"
   ]
][
   msg: "positive"
]

print ["a is " msg lf]
> ```
> 
> An alternative way to write it (allowed because all code paths return a value of the same type):
> 
> ```
> msg: either a < 0 [
   either a = 0 [
       "zero"
   ][
       "negative"
   ]
 ][
   "positive"
]
prin ["a is " msg lf]
> ```

### 9.3 loop

> Loop over a block of code, decrementing a counter down to zero. LOOP does not return any value, so it cannot be used in an expression.
> 
> **Syntax**
> 
> ```
> loop <counter> [<code>]

<counter> : a valid expression returning a positive integer value
<code>    : code to execute while the condition is not met
> ```
> 
> **Examples**
> 
> ```
> loop 3 [print "o"]
> ```
> 
> will output:
> 
> ```
> ooo

a: 2
b: 3
loop a + b [print "o"]
> ```
> 
> will output:
> 
> ```
> ooooo
> ```

### 9.4 until

> Loop over a block of code until the condition at the end of the block, is met. UNTIL does not return any value, so it cannot be used in an expression.
> 
> **Syntax**
> 
> ```
> until [
   <code>
   <condition>
]

<code>      : code to execute while the condition is not met
<condition> : a conditional expression
> ```
> 
> Note: The loop will always be executed at least once, even if the condition is met from the beginning.
> 
> **Example**
> 
> ```
> c: 5
until [
   print "o"
   c: c - 1
   c = 0
]
> ```
> 
> will output:
> 
> ```
> ooooo
> ```

### 9.5 while

> While a given condition is met, execute a block of code. WHILE does not return any value, so it cannot be used in an expression.
> 
> **Syntax**
> 
> ```
> while [<condition>][<code>]

<condition> : a conditional expression
<code>      : code to execute if the condition is met
> ```
> 
> Note: It is possible to execute any code in the condition block as long as it ends with a conditional expression.
> 
> **Example**
> 
> ```
> c: 5
while [c > 0][
   print "o"
   c: c - 1
]
> ```
> 
> will output:
> 
> ```
> ooooo
> ```

### 9.6 break

> BREAK allows to break out of the nearest enclosing loop at once and resume execution after the loop.
> 
> **Syntax**
> 
> ```
> break
> ```
> 
> **Example**
> 
> ```
> c: 5
until [
   print "o"
   break
   c: c - 1
   c = 0
]
> ```
> 
> will output:
> 
> ```
> o
> ```

### 9.7 continue

> CONTINUE skips the remaining part of a body loop and resume execution at next loop iteration.
> 
> **Syntax**
> 
> ```
> continue
> ```
> 
> **Example**
> 
> ```
> c: 5
until [
   print "o"
   c: c - 1
   either c > 3 [continue][break]
   c = 0
]
> ```
> 
> will output:
> 
> ```
> oo
> ```

### 9.8 any

> Global condition is met if at least one of the sub-conditions is met. ANY returns a logic! value.
> 
> **Syntax**
> 
> ```
> any [<condition-1> <condition-2> ...]

<condition-*> : a conditional expression
> ```
> 
> **Example**
> 
> ```
> if any [foo > 5 bar = 0][
   print "true"                    ;-- reached if at least one condition is met
]
> ```

### 9.9 all

> Global condition is met if all the sub-conditions are met. ALL returns a logic! value.
> 
> **Syntax**
> 
> ```
> all [<condition-1> <condition-2> ...]

<condition-*> : a conditional expression
> ```
> 
> **Example**
> 
> ```
> if all [foo > 5 bar = 0][
   print "true"                    ;-- reached if both conditions are met
]
> ```

### 9.10 case

> Execute the block of code following the first condition that is met. If all blocks of code end with an expression of same type, then CASE can be used inside an expression. A catch-all rule can be written using a conditional expression that always results in true.
> 
> Note: if no value matches, a runtime error will be raised.
> 
> **Syntax**
> 
> ```
> case [<condition> [<body>] ...]

<condition> : a conditional expression
<body>      : code to execute if the condition is met
> ```
> 
> **Examples**
> 
> ```
> a: 3
case [
   zero? a [print "0"]
   a = 1   [print "1"]
   a > 2   [print "greater than 2"]
]
> ```
> 
> will output:
> 
> ```
> greater than 2
> ```
> 
> Example retrieving the returned value:
> 
> ```
> time: 8
msg: case [
   all [6 < time time < 11]["morning"]
   all [11 <= time time < 22]["evening"]
   time >= 22 ["night"]
]
print ["Good " msg]
> ```
> 
> will output:
> 
> ```
> Good morning
> ```

### 9.11 switch

> Execute the block of code following the first value matched, or the default block if present and no value matched. If all blocks of code end with an expression of same type, then SWITCH can be used inside an expression.
> 
> Note: if no value matched and no default block is provided, a runtime error will be raised.
> 
> **Syntax**
> 
> ```
> switch <expression> [<values> [<body>] ...]
switch <expression> [<values> [<body>] ... default [<default-body>]]

<expression>   : an expression resulting in byte! or integer! value
<values>       : one or several integer! or byte! literal values
<body>         : code to execute if one of the <values> is matched
<default-body> : code to execute if no value is matched
> ```
> 
> **Examples**
> 
> ```
> a: 2
switch a [
   0 [print "green"]
   1 [print "orange"]
   2 [print "red"]
]
> ```
> 
> will output:
> 
> ```
> red
> ```
> 
> Example using a default block:
> 
> ```
> a: 3
switch a [
  0 [print "green"]
  1 [print "orange"]
  2 [print "red"]
  default [print "white"]
]
> ```
> 
> will output:
> 
> ```
> white
> ```
> 
> Example retrieving the returned value:
> 
> ```
> a: 2
year: switch a [
   0 [2010]
   1 [2011]
   2 [2012]
]
print ["Red will rock in " year]
> ```
> 
> will output:
> 
> ```
> Red will rock in 2012
> ```
> 
> Example using multiple values for matching:
> 
> ```
> input: 3
switch input [
   0 2 4 6 8 [print "even"]
   1 3 5 7 9 [print "odd"]
]
> ```
> 
> will output:
> 
> ```
> odd
> ```

## 10. Exceptions

> Exit and Return are sometimes not enough when it is needed to interrupt current execution and go back through several parent calls before resuming execution. Exceptions are solving such case by providing a way to resume execution from a parent caller anywhere in the calling hierarchy, up to global code level.

### 10.1 Throw

> Raising a new exception is done by calling the **throw** function followed by an integer value used as the exception ID.
> 
> **Syntax**
> 
> ```
> throw <id>

<id> : integer value used as exception ID
> ```
> 
> **Throw** will produce an exception that will move up through the parent calls until:
> 
> - a **catch** statement is encountered and the exception filter value is greater or equal than the exception ID value.
> - a function with a **\[catch]** attribute is found.
> 
> If no **catch** is encountered, the exception, once reaching global code level, with exit the program with a runtime error.
> 
> Note: if **throw** is used from a function that has the **catch** attribute, the exception will still be raised and go through parent calls. This way, when a function with a **\[catch]** attribute catches an exception, it can re-**throw** it if required.
> 
> No callbacks support
> 
> The exception mechanism does not work across external calls, so a callback function must not use **throw**, else a crash will be the likely outcome. Nested exceptions are still possible as long as they are caught before the callback function returns.

### 10.2 Catch

> There are two ways to catch exceptions created using **throw**.
> 
> #### 10.2.1 Catch statement
> 
> **Syntax**
> 
> ```
> catch <filter> [<body>]

<filter> : integer value used to filter exceptions.
<body>   : arbitrary body of code to which this catch applies to.
> ```
> 
> An exception occuring in &lt;body&gt; block (including deeply nested ones that were uncaught) will be caught only if its ID value is less or equal than the &lt;filter&gt; value. Once an exception is being caught, the execution resumes after the **catch** body block.
> 
> Note: Once an exception is caught by **catch**, the exception value can be retrieved using **system/thrown**.
> 
> Example in global context:
> 
> ```
> catch 123 [
    print "hello"
    throw 10
    print "<hidden>"
]
print " world"
> ```
> 
> will output:
> 
> ```
> hello world
> ```
> 
> Example using a nested exception:
> 
> ```
> bar: does [
   print "hello"
   throw 123
   print "<hidden>"
]

foo: does [
   catch 5 [bar]                       ;-- exception 123 not catchable
   print "<hidden>"
]

catch 1000 [foo]                       ;-- exception will be caught here
> ```
> 
> will output:
> 
> ```
> hello
> ```
> 
> #### 10.2.2 Catch attribute
> 
> **Syntax**
> 
> ```
> func [[catch]...][...]
> ```
> 
> A **\[catch]** attribute will make the function catch all exceptions and resume at the next instruction. This attribute cannot be used in conjunction with other function attributes.
> 
> Implementation note
> 
> The internal threshold value for the \[catch] attribute is set to FFFFFFFEh. The FFFFFFFFh value is defined as the CATCH\_ALL macro and reserved for the internal catching sub-system at root level.
> 
> Example:
> 
> ```
> baz: does [
   print " "
   throw 123
   print "<hidden>"                    ;-- never executed
]
bar: does [
   print "hello"
   baz
   print "<hidden>"                    ;-- never executed
]
foo: func [[catch]][
   bar
   print "world"                       ;-- execution resumes there
]

foo
> ```
> 
> will output:
> 
> ```
> hello world
> ```

### 10.3 Exception value

> The integer argument passed to **throw** is propagated with the exception, it can be read using a system access path: **system/thrown**
> 
> **Syntax**
> 
> ```
> system/thrown                          ;-- read access (returns an integer)
system/thrown: <id>                    ;-- write access

<id> : integer value
> ```
> 
> The **system/thrown** path can be both read and written. It can be used to take different actions depending on the thrown value. The write access exists so that the value can be resetted manually when needed. It is recommended to reset it to 0 in such cases.
> 
> **Examples**
> 
> ```
> foo                                    ;-- taken from previous example
print system/thrown
> ```
> 
> will output:
> 
> ```
> 123
> ```
> 
> A dispatching use case would look like this:
> 
> ```
> foo: does [throw 10]
bar: does [throw 20]
baz: does [throw 30]

dispatch: func [[catch] n [integer!]][
   system/thrown: 0                    ;-- this is only useful if no exception occurs

   switch n [
       1 [foo]
       2 [bar]
       3 [baz]
       default [
           print-line "do nothing"
       ]
   ]
   switch system/thrown [
       0  [print "no exception occured"]
       10 [print "foo"]
       20 [print "bar"]
       30 [print "baz"]
   ]
]

dispatch 2
> ```
> 
> will output:
> 
> ```
> bar
> ```

## 11. Stack functions

### 11.1 push

> Push a value on top of execution stack. Stack pointer is modified.
> 
> **Syntax**
> 
> ```
> push <value>

<value>: expression of any type
> ```
> 
> **Examples**
> 
> ```
> push 123
push a
push "hello"
push p/value
> ```

### 11.2 pop

> Pop a value from top of execution stack. Stack pointer is modified.
> 
> **Syntax**
> 
> ```
> pop

return: an integer value
> ```

## 12. Debugging functions

### 12.1 assert

> Make a runtime assertion. If assertion fails, a runtime error will be raised.
> 
> **Syntax**
> 
> ```
> assert <conditional expression>
> ```
> 
> **Example**
> 
> ```
> Red/System []

assert 1 = 2
> ```
> 
> will produce if saved to %test.reds file and run:
> 
> ```
> *** Runtime Error 98: assertion failed at line 3
*** in file: %test.reds
> ```
> 
> Compiler debug mode
> 
> Assertion will only be compiled if the **debug?** compilation option is set to YES or if the **-g** command-line option is used, else the assertion will be ignored by the compiler.

## 13. System structure

> System structure is a special struct value, defined at run-time, that gives access to some core features of Red/System.

### 13.1 args-count

> Informs about the number of words passed on command-line. The executable itself is included in the count, so **args-count** is greater or equal to one.
> 
> **Syntax**
> 
> ```
> system/args-count

return: an integer value (>= 1)
> ```

### 13.2 args-list

> Pointer to an array of words passed on command-line (including the program name). The array's end is marked by a null pointer.
> 
> **Syntax**
> 
> ```
> system/args-list

return: a pointer value of type: str-array! (alias)
> ```
> 
> The pointer alias is defined as:
> 
> ```
> str-array!: alias struct! [
   item [c-string!]
]
> ```
> 
> **Example**
> 
> ```
> Red/System [purpose: "demo system/args-* info usage"]

print ["count: " system/args-count lf]
args: system/args-list 
c: 1 
until [ 
   print [c ": " args/item lf] 
   c: c + 1 
   args: args + 1 
   args/item = null 
]
> ```
> 
> If compiled as *show-args* executable, and called as:
> 
> ```
> show-args 123 -p hello
> ```
> 
> it would output:
> 
> ```
> count: 4
1: show-args
2: 123
3: -p
4: hello
> ```

### 13.3 env-vars

> Pointer to an array of shell environment variables with their value. The array's end is marked by a null pointer.
> 
> **Syntax**
> 
> ```
> system/env-vars

return: a pointer value of type: str-array! (alias)
> ```
> 
> The pointer alias is defined as:
> 
> ```
> str-array!: alias struct! [
   item [c-string!]
]
> ```
> 
> **Example**
> 
> ```
> Red/System [purpose: "demo system/env-vars usage"]

env: system/env-vars 
until [ 
   print [env/item lf] 
   env: env + 1 
   env/item = null 
]
> ```
> 
> would output (specific to your shell/OS):
> 
> ```
> ORBIT_SOCKETDIR=/tmp/orbit-root
SSH_AGENT_PID=2248
TERM=xterm
SHELL=/bin/bash
...                                ;-- rest of output omitted
> ```
> 
> Implementation note
> 
> On Windows platforms, system/env-vars is always set to null. This may change in future.

### 13.4 stack/top

> Set or retrieve execution stack top address.
> 
> **Syntax**
> 
> Getting stack top value:
> 
> ```
> system/stack/top

return: a pointer value of type: pointer! [integer!]
> ```
> 
> Setting stack top value:
> 
> ```
> system/stack/top: <address>

<address>: a pointer value of type: pointer! [integer!]
> ```
> 
> Stack pointer modification
> 
> Do not use it unless you know exactly what you are doing, else your program will most probably crash.

### 13.5 stack/frame

> Set or retrieve execution stack frame address.
> 
> **Syntax**
> 
> Getting stack frame value:
> 
> ```
> system/stack/frame

return: a pointer value of type: pointer! [integer!]
> ```
> 
> Setting stack frame value:
> 
> ```
> system/stack/frame: <address>

<address>: a pointer value of type: pointer! [integer!]
> ```
> 
> Stack pointer modification
> 
> Do not use it unless you know exactly what you are doing, else your program will most probably crash.

### 13.6 stack/align

> Ensures that native stack is properly aligned at the point of calling, according to target ABI requirements. It returns the newly aligned stack pointer.
> 
> **Syntax**
> 
> ```
> system/stack/align

return: a pointer value of type: pointer! [integer!]
> ```

### 13.7 stack/allocate

> Reserves a storage space on stack (in stack slots unit) and returns a pointer the beginning of that space. This can be used to allocate arbitrary space for data structure on native stack. Such space will be automatically freed on a function exit.
> 
> **Syntax**
> 
> ```
> <ptr>: system/stack/allocate <slots>
<ptr>: system/stack/allocate/zero <slots>

<ptr>  : variable of type: pointer! [integer!]
<slots>: expression returning an integer
> ```
> 
> The **/zero** option forces the allocated stack region to be zero-filled.
> 
> Stack slots unit
> 
> Stack slots unit are system-dependent, on IA-32 and ARM, a slot is equal to 4 bytes.

### 13.8 stack/free

> Frees a storage space on stack (in stack slots unit). This is useful for manually controlling the release of a stack storage space allocated with *system/stack/allocate*, or from outside a function.
> 
> **Syntax**
> 
> ```
> system/stack/free <slots>

<slots>: expression returning an integer
> ```
> 
> Manual stack manipulations and exceptions
> 
> Current exceptions implementation (catch/throw) cannot mix with manual stack manipulations, therefore all allocated spaces on stack **must** be freed before entering a *catch* body block, or using a *throw* keyword.

### 13.9 stack/push-all

> Saves all registers to stack.
> 
> **Syntax**
> 
> ```
> system/stack/push-all
> ```
> 
> The following registers are saved:
> 
> - IA-32: eax, ecx, edx, ebx, original esp, ebp, esi, edi, eflags, st0-7, xmm0-7.
> - ARM: r0-r12, r14, d0-15, CPSR.
> 
> Note that eax and r0 content is modified after this call (though original values are restored by \`pop-all\`).

### 13.10 stack/pop-all

> Restore all registers from stack.
> 
> **Syntax**
> 
> ```
> system/stack/pop-all
> ```
> 
> See \`stack/push-all\` section for complete list of registers affected.

### 13.11 pc

> Retrieve the CPU program counter value.
> 
> **Syntax**
> 
> ```
> system/pc
> ```
> 
> Platform-specific results
> 
> IA-32 target returns the value of the EIP register.
> 
> ARM target returns the value of the PC (r15) register.

### 13.12 cpu/&lt;reg&gt;

> Set or retrieve any of the CPU's registers value.
> 
> **Syntax**
> 
> Reading a register:
> 
> ```
> system/cpu/<register>

return: a value of type integer!.
> ```
> 
> Setting a register:
> 
> ```
> system/cpu/<register>: <value>
> ```
> 
> where:
> 
> ```
> <register>: valid name of a CPU register (platform-dependent)
<value>   : an integer! value
> ```
> 
> Register names
> 
> Currently supported names are:
> 
> - **IA-32**: eax, ecx, edx, ebx, esp, ebp, esi, edi
> - **ARM**: r0 to r15
> 
> Support for accessing more registers (like status registers) will be added in the future.

### 13.13 cpu/overflow?

> Checks if the last integer math operation has overflown.
> 
> **Syntax**
> 
> ```
> system/cpu/overflow?

return: a value of type logic!.
> ```
> 
> As many CPU operations can change this state, it is only reliable if used immediatly after a math operation.
> 
> Overflow cpu flag
> 
> This is not a direct check of the overflow flag, as some math operations on some CPUs are not setting that flag.

### 13.14 fpu/type

> Returns a unique ID for the currently used FPU.
> 
> **Syntax**
> 
> ```
> system/fpu/type
> ```
> 
> Possible returned values are currently:
> 
> - FPU\_TYPE\_X87: for x87 FPU.
> - FPU\_TYPE\_SSE: for SSE unit on Intel.
> - FPU\_TYPE\_VFP: for ARM VFP unit.

### 13.15 fpu/option

> #### 13.15.1 fpu/option/rounding
> 
> Set or retrieve the FPU rounding mode. The possible standard modes are:
> 
> - Nearest: (even) rounded result is the closest to the infinitely precise result
> - Down: (toward -INF) rounded result is the closest to but no greater than the infinitely precise result
> - Up: (toward +INF) rounded result is the closest to but no less than the infinitely precise result
> - Zero: (truncate) rounded result is the closest to but no greater in absolute value than the infinitely precise result
> 
> **Syntax**
> 
> Reading a register:
> 
> ```
> system/fpu/option/rounding
> ```
> 
> will return one of the following values:
> 
> **Intel**:
> 
> - FPU\_X87\_ROUNDING\_NEAREST
> - FPU\_X87\_ROUNDING\_DOWN
> - FPU\_X87\_ROUNDING\_UP
> - FPU\_X87\_ROUNDING\_ZERO
> 
> **ARM**:
> 
> - FPU\_VFP\_ROUNDING\_NEAREST
> - FPU\_VFP\_ROUNDING\_DOWN
> - FPU\_VFP\_ROUNDING\_UP
> - FPU\_VFP\_ROUNDING\_ZERO
> 
> Setting a register:
> 
> ```
> system/fpu/option/rounding: <value>
> ```
> 
> where:
> 
> ```
> <value>: is one of the valid values listed above.
> ```
> 
> #### 13.15.2 fpu/option/precision
> 
> ***(Intel only)***
> 
> Set or retrieve the FPU precision size.
> 
> **Syntax**
> 
> Reading a register:
> 
> ```
> system/fpu/option/precision
> ```
> 
> will return one of the following values:
> 
> - FPU\_X87\_PRECISION\_SINGLE     *(32-bit float, 24-bit mantissa)*
> - FPU\_X87\_PRECISION\_DOUBLE     *(64-bit float, 53-bit mantissa)*
> - FPU\_X87\_PRECISION\_DOUBLE\_EXT     *(80-bit float, 64-bit mantissa)*
> 
> Setting a register:
> 
> ```
> system/fpu/option/precision: <value>
> ```
> 
> where:
> 
> ```
> <value>: is one of the valid values listed above.
> ```
> 
> #### 13.15.3 fpu/option/flush-to-zero
> 
> ***(ARM only)***
> 
> Enable or disable the Flush-to-zero mode. See ARM [documentation](http://infocenter.arm.com/help/index.jsp?topic=%2Fcom.arm.doc.ddi0274h%2FBabffifj.html) for more info.
> 
> Testing if flush mode is enabled:
> 
> ```
> system/fpu/option/flush-to-zero

return: true (if mode is enable) | false
> ```
> 
> Enabling or disabling the flush mode:
> 
> ```
> system/fpu/option/flush-to-zero: true | false
> ```
> 
> #### 13.15.4 fpu/option/NaN-mode
> 
> ***(ARM only)***
> 
> Enable or disable the default NaN mode. See ARM [documentation](http://infocenter.arm.com/help/index.jsp?topic=%2Fcom.arm.doc.ddi0274h%2FBabffifj.html) for more info.
> 
> Testing if default mode is enabled:
> 
> ```
> system/fpu/option/NaN-mode

return: true (if mode is enable) | false
> ```
> 
> Enabling or disabling the default mode:
> 
> ```
> system/fpu/option/NaN-mode: true | false
> ```

### 13.16 fpu/mask

> Set the FPU exception masks. The following exceptions are available:
> 
> - precision
> - underflow
> - overflow
> - zero-divide
> - denormal
> - invalid-op
> 
> **Syntax**
> 
> Reading an exception mask state:
> 
> ```
> system/fpu/mask/<exception>

return: true (exception is masked) | false
> ```
> 
> Masking or unmasking an exception:
> 
> ```
> system/fpu/mask/<exception>: <value>
> ```
> 
> where:
> 
> ```
> <exception> : is one of the above exception name
<value>     : an integer! value
> ```

### 13.17 fpu/status

> Retrieve the FPU exception bits status.
> 
> **Syntax**
> 
> ```
> system/fpu/status

return: a value of type integer!.
> ```
> 
> The resulting status bits layout depends on the architecture:
> 
> **IA-32:**
> 
> ```
> P|U|O|Z|D|I

   P: Precision
   U: Underflow
   O: Overflow
   Z: Zero Divide
   D: Denormalized operand
   I: Invalid Operation
> ```
> 
> **ARM:**
> 
> ```
> ID|0|IX|UF|OF|DZ|IO

   ID: Input Denormal
   IX: Inexact (Precision)
   UF: Underflow
   OF: Overflow
   DZ: Division by Zero
   IO: Invalid Operation
> ```

### 13.18 fpu/control-word

> Set or retrieve the full FPU control register.
> 
> **Syntax**
> 
> Reading the control value:
> 
> ```
> system/fpu/control-word

return: a value of type integer!.
> ```
> 
> Setting a register:
> 
> ```
> system/fpu/control-word: <value>
> ```
> 
> where:
> 
> ```
> <value> : an integer! value
> ```
> 
> Warning for ARM backend
> 
> Setting the control-word on ARM can have side-effects, as the same register is used for status flags.

### 13.19 fpu/epsilon

> *Not implemented yet.*

### 13.20 fpu/update

> Effectively update the FPU with the last options set.
> 
> **Syntax**
> 
> ```
> system/fpu/update
> ```
> 
> All the changes to the FPU are pending until this command is sent.
> 
> ARM backend
> 
> On ARM backend, the changes are immediate and this command does nothing, but it is still useful for writing platform-independent code. This will be changed in the future to allow staging options and this command will be then enabled.

### 13.21 fpu/init

> Initialize the FPU.
> 
> **Syntax**
> 
> ```
> system/fpu/init
> ```
> 
> Intel-only
> 
> Only needed for Intel platforms, does nothing on ARM (for now).

### 13.22 io/read

> Read a value from a low-level I/O port.
> 
> **Syntax**
> 
> ```
> system/io/read <port>

return: byte! | integer!
> ```
> 
> where:
> 
> ```
> <port> : I/O port address (pointer! [byte! | integer!])
> ```
> 
> The returned value type depends on the type of pointer used for the port argument.
> 
> Hardware vs memory-mapped I/O
> 
> On some platforms (like ARM), such I/O operations are simply memory-mapped I/O.

### 13.23 io/write

> Write a value to a low-level I/O port.
> 
> **Syntax**
> 
> ```
> system/io/write <port> <value>
> ```
> 
> where:
> 
> ```
> <port> : I/O port address (pointer! [byte! | integer!])
<value>: written data of same type as port pointed value.
> ```
> 
> The written value has to be consistent with the port's pointer type, otherwise a compilation error occurs.
> 
> Hardware vs memory-mapped I/O
> 
> On some platforms (like ARM), such I/O operations are simply memory-mapped I/O.

### 13.24 atomic/fence

> Generate a read/write data [memory barrier](https://en.wikipedia.org/wiki/Memory_barrier), using the sequentially consistent (\`seq\_cst\`) [memory order](https://en.wikipedia.org/wiki/Memory_ordering).
> 
> **Syntax**
> 
> ```
> system/atomic/fence
> ```

### 13.25 atomic/load

> Performs a thread-safe atomic read from a given memory location.
> 
> **Syntax**
> 
> ```
> system/atomic/load <ptr>

return: integer! value read from <ptr> memory location.
> ```
> 
> where:
> 
> ```
> <ptr> : memory location to load from (pointer! [integer!])
> ```

### 13.26 atomic/store

> Performs a thread-safe atomic write to a given memory location.
> 
> **Syntax**
> 
> ```
> system/atomic/store <ptr> <value>
> ```
> 
> where:
> 
> ```
> <ptr>   : memory location to write to (pointer! [integer!])
<value> : integer value to store (integer!)
> ```

### 13.27 atomic/cas

> Performs a thread-safe atomic compare &amp; swap to a given memory location.
> 
> **Syntax**
> 
> ```
> system/atomic/cas <ptr> <old> <new>

return: TRUE on success, otherwise FALSE (logic!)
> ```
> 
> where:
> 
> ```
> <ptr> : memory location to read/write to (pointer! [integer!])
<old> : integer value to compare to (integer!)
<new> : integer value to write if comparison succeeded (integer!)
> ```
> 
> The compare &amp; swap semantics are described [here](https://en.wikipedia.org/wiki/Compare-and-swap). The memory location is read and the value is compared to the **old** value. If equal, the **new** value is written and it returns \`true\`, otherwise it aborts and returns \`false\`.

### 13.28 atomic/&lt;math-op&gt;

> Performs a thread-safe atomic math or bitwise operation to a given memory location.
> 
> **Syntax**
> 
> ```
> system/atomic/<op> <ptr> <value>
system/atomic/<op>/old <ptr> <value>

return: the new value, or the old value if /old refinement is present.
> ```
> 
> where:
> 
> ```
> <op>    : add, sub, or, xor, and
<ptr>   : memory location to write to (pointer! [integer!])
<value> : operand value (integer!)
> ```

### 13.29 image/base

> Returns the base address of the executable image in memory.
> 
> **Syntax**
> 
> ```
> system/image/base

return: a value of type pointer! [integer!].
> ```

### 13.30 image/code

> Returns the CODE segment offset from image's base.
> 
> **Syntax**
> 
> ```
> system/image/code

return: a value of type integer!.
> ```

### 13.31 image/code-size

> Returns the CODE segment size.
> 
> **Syntax**
> 
> ```
> system/image/code-size
return: a value of type integer!.
> ```

### 13.32 image/data

> Returns the DATA segment offset from image's base.
> 
> **Syntax**
> 
> ```
> system/image/data

return: a value of type integer!.
> ```

### 13.33 image/data-size

> Returns the DATA segment size.
> 
> **Syntax**
> 
> ```
> system/image/data-size

return: a value of type integer!.
> ```

### 13.34 alias

> Get the ID value of an alias. This is required in typed functions in order to distinguish different struct! values.
> 
> **Syntax**
> 
> ```
> system/alias/<name>

where
   <name> : existing alias name
> ```
> 
> This expression returns an **integer!** value that can be used to test at runtime, the type of an argument in a typed function.
> 
> Example:
> 
> ```
> foo!: alias struct! [a [byte!]]
s: declare foo!

probe: func [
    [typed] count [integer!] list [typed-value!]
][
    until [
       if list/type = system/alias/foo! [
           print "foo! alias detected"
       ]
       list: list + 1
       count: count - 1
       zero? count
    ]
]

probe [1 "r" s 123]
> ```
> 
> will output:
> 
> ```
> foo! alias detected
> ```

### 13.35 words

> Access an indentifier from global context when it is also defined locally.
> 
> **Syntax**
> 
> ```
> system/words/<name>                    ;-- calling a function, reading a variable
system/words/<name>:                   ;-- setting a variable

<name> : identifer or access path
> ```
> 
> See also "Namespaces" section.

## 14. Compiler directives

> Some features of Red/System need to be processed at compile-time rather than at run-time. This is especially true for features related to the linking phase that builds the executable file. In order to distinguish such compile-time commands or options, compiler directive are introduced. Their syntax is:
> 
> ```
> #<directive> <argument-1> <argument-2> ...

<directive>  : a valid identifier
<argument-*> : argument can be any Red valid datatype
> ```
> 
> The number of arguments is specific to each compiler directive.
> 
> As compiler directives apply globally to programs, they are not allowed inside code blocks (this restriction might be removed if local directives are introduced in the future).
> 
> Implementation note: The directive arguments datatype set, is the one provided by REBOL during the bootstrapping phase only. Once the Red layer has been implemented, the allowed datatypes will be Red ones.

## 15. Importing External Libraries

### 15.1 #import

> Red/System is able to load external shared libraries at the time a Red/System executable is loaded by the operating system. This requires that the programmer gives instructions to the compiler about which library to load and how to map library's functions and variables to Red/System current context. This feature is called "library import" in Red/System and it is supported by a specific compiler directive: **#import**. This directive can be used anywhere in the global or local contexts of your Red/System program, but be sure to put it *before* you use one of the mapped functions, else a compiler error will be raised. This directive can be used multiple times in your source code if it makes it more readable. If there is a huge number of functions to imports, putting them in separate includes files would be considered as good practice.
> 
> Note: this is not the same as dynamically loading a shared library from your Red/System code after your program has started. Such approach allows you to delay the loading of your libraries and to free them. Imports cannot be freed.
> 
> **Syntax**
> 
> ```
> #import [
   "<library>" <convention> [
       <function name>: "<ID>" [
           <argument> [<datatype>]
           ...
           return: [<datatype>]        ;-- optional part
       ]
       ...                             ;-- more functions mappings
       <variable name>: "<VAR>" [
           <datatype>
       ]
       ...                             ;-- more variables mappings
   ]
   ...                                 ;-- more libraries to load
]

<library>       : shared library file name (with extension)
<convention>    : calling convention of the library (stdcall | cdecl)
<function name> : name of the mapped function in current context
<variable name> : name of the mapped variable in current context
<ID>            : identifier of the function in the shared library
<VAR>           : identifier of the variable in the shared library
<argument>      : function's argument indentifier
<datatype>      : integer! | byte! | pointer! [integer! | byte! | float! | float32! | logic!] |
                  float! | float32! | c-string! | struct! [<members>] |
                  function! [<spec>] | <alias>
> ```
> 
> Notes:
> 
> - An absolute path to the library can be provided in OS-specific format.
> - The **RETURN:** statement indicates that the mapped function has a return value.
> - There's no limitation on the number of libraries or functions that can be declared this way.
> 
> Supported calling conventions are:
> 
> - [stdcall](http://en.wikipedia.org/wiki/X86_calling_conventions#stdcall): used mostly by Windows API (but can be also used by third-party DLLs)
> - [cdecl](http://en.wikipedia.org/wiki/X86_calling_conventions#cdecl): default calling convention used by C shared libraries.
> 
> **Usage**
> 
> The following example is Windows-specific.
> 
> ```
> #import [
   "kernel32.dll" stdcall [
       process-id?: "GetCurrentProcessId" [
           return: [integer!]
       ]
       get-env: "GetEnvironmentVariableA" [
           name    [c-string!]
           buffer  [c-string!]
           size    [integer!]
           return: [integer!]
       ]
   ]
   "msvcrt.dll" cdecl [
       malloc: "malloc" [
           size    [integer!]
           return: [c-string!]
       ]
       release: "free" [
           block   [c-string!]
       ]
   ]
]

pid: process-id?

max-size: 128
buf: malloc  max-size                  ;-- allocate space for 127 characters

get-env "windir" buf  max-size

print buf
release buf
> ```
> 
> would output:
> 
> ```
> C:\Windows
> ```

### 15.2 #syscall

> As Red/System is destined to be used mostly for low-level system programming, [syscalls](http://en.wikipedia.org/wiki/System_call) mappings are also supported using the **#syscall** compiler directive.
> 
> **Syntax**
> 
> ```
> #syscall [
   <function name>: <ID> [
       <argument> [<datatype>]
       ...
       return: [<datatype>]            ;-- optional part
   ]
   ...                                 ;-- more functions mappings
]
<function name> : name of the mapped function in global context
<ID>            : syscall integer ID
<argument>      : syscall's argument indentifier
<datatype>      : integer! | byte! | pointer! [integer! | byte!] |
                  float! | float32! | c-string! | struct! [<members>]
> ```
> 
> The **RETURN:** statement indicates that the mapped syscall has a return value.
> 
> There's no limitation on the number of syscalls that can be declared this way.
> 
> **Usage**
> 
> The following example is Linux-specific, but should work with most UNIX systems.
> 
> ```
> #syscall [
   write: 4 [
       fd      [integer!]              ;-- file descriptor, STDOUT = 1
       buffer  [c-string!]
       count   [integer!]
       return: [integer!]
   ]
   quit: 1 [                           ;-- "exit" syscall, no return value
       status  [integer!]
   ]
]

msg: "Hello World"
result: write 1 msg length? msg
if negative? result [
   print "Error: write failed" 
   quit 3                              ;-- exit and return an error code
]
quit 0                                 ;-- no error
> ```
> 
> will output (if no error):
> 
> ```
> Hello World
> ```

## 16. Source Processing

> Red/System relies on a preprocessor to make compile-time modifications of the source code in order to provide syntactic sugars, like hexadecimal and character literal forms for integers. Some features are user controlled through compiler directives like **#define** or **#include**.

### 16.1 #define

> The **#define** compiler directive is a rudimentary macro system that can be used to:
> 
> - define constant values
> - make simple macro expressions
> 
> The name matching method is exact word matching. This ensures that no accidental source code corruption can occur.
> 
> **Syntax**
> 
> ```
> #define <name> <value>

<name>  : identifier to use in the source code
<value> : single value or block of values to replace in the source code
> ```
> 
> **Usage**
> 
> ```
> #define R_PART 00FF0000h               ;-- simple constants definitions
#define G_PART 0000FF00h
#define B_PART 000000FFh
#define zero?  [0 =]                   ;-- simple test expression macro

color: 00550063h

if zero? (R_PART and color) [
   print "Red not found"
]
if zero? (G_PART and color) [
   print "Green not found"
]
if zero? (B_PART and color) [
   print "Blue not found"
]
> ```
> 
> will output:
> 
> ```
> Green not found
> ```
> 
> Note: Parens are required in this example on test expressions so that the compiler performs the second infix expression (the and operator) before the first (the equal operator).
> 
> #### 16.1.1 Parametrized macros
> 
> A more powerful macro version is possible, taking one or several parameters as input that get replaced in the emitted template.
> 
> **Syntax (declaration)**
> 
> ```
> #define <name>(arg1 arg2 ...) <body>

<name> : macro identifier
<body> : macro body (block! or paren! value)
> ```
> 
> **Syntax (usage)**
> 
> ```
> <name>(value1 value2 ...)
> ```
> 
> If the body is a block! value, its content replaces the name and parameters passed in the source code. If the body is a paren! value, the parens are kept after replacement in source code.
> 
> Notes:
> 
> - The replacement process in the body block is done deeply in all series found, including paths.
> - Nested macros are fully supported.
> 
> Examples:
> 
> ```
> #define MAX(a b) (either a > b [a][b])

print MAX(3 4)                         ;-- will print 4

#define SW(identifier) [system/words/identifier]

a: 123
print SW(a)                            ;-- will print 123
> ```
> 
> Naming convention
> 
> By convention, such parametrized macro names should be capitalized, so they can be more easily spotted in source code.

### 16.2 #enum

> The **#enum** compiler directive allows to declare enumerations using labels. A list of integers is assign to a list labels. These labels could then be used anywhere in the source code and will be converted to their integer value when needed by the compiler.
> 
> **Syntax**
> 
> ```
> #enum <name>! [
   <label> | <label>: <value>
   ...
]

<name>!  : enumeration name (ending with a ! by convention)
<label>  : label to which an integer value is assigned to
<label>: : one or several label(s) set to a given integer value
<value>  : integer value
> ```
> 
> The enumeration starts from 0 by default. It is possible to assign a starting value using a label name with a ending colon, followed by an integer. It is also possible to assign several labels to the same value.
> 
> Notes:
> 
> - labels syntactic rules are the same as for variable identifiers.
> - enumeration names are pseudo-types that can be used in any local or global variable declaration in place of a real type.
> - labels can be used in place of integer variables or literal integer values.
> - ambiguous enum or label names that could conflict with other existing names will raise a compilation error.
> 
> **Examples**
> 
> ```
> #enum colors! [A B C D E]
print-wide [A E]
> ```
> 
> will output
> 
> ```
> 0 4
> ```
> 
> Using in place of literal integers:
> 
> ```
> #enum colors! [red blue green yellow]

a: red

print switch a [
   red    ["Red"]
   blue   ["Blue"]
   yellow ["Yellow"]
]
> ```
> 
> will output
> 
> ```
> Red
> ```
> 
> Defining labels with user-selected value:
> 
> ```
> #enum values! [a: 1 b c d: e: 10]

print-wide [a b c d e]
> ```
> 
> will output
> 
> ```
> 1 2 3 10 10
> ```

### 16.3 #include

> The **#include** compiler directive will insert the target source file at the current position in the calling source code.
> 
> This directive helps split the source code in several files, allowing for example, to put common functions or definitions in a single place and including them where required, across several source files or across different projects.
> 
> **Syntax**
> 
> ```
> #include %<file>

<file> : relative or full path to a Red/System source file
> ```
> 
> Filename format
> 
> The filename must be written using the OS-independent [REBOL file! format](http://www.rebol.com/docs/core23/rebolcore-12.html#section-2).
> 
> **Usage**
> 
> Rewriting the example from *#define* section:
> 
> ```
> definitions.reds file:

    #define R_PART 00FF0000h
    #define G_PART 0000FF00h
    #define B_PART 000000FFh
    #define zero?  [0 =]

    test-primary: func [
       color [integer!]
       mask  [integer!]
       msg   [c-string!]
    ][
       if zero? (color and mask) [
           print msg
       ]
    ]

main.reds file:

    #include %definitions.reds

    color: 00550063h

    test-primary color R_PART "no Red found"
    test-primary color G_PART "no Green found"
    test-primary color B_PART "no Blue found"
> ```

### 16.4 #if

> The **#if** compiler directive goal is to allow conditional compilation based on a simple conditional expression limited to a few compilation options. If the expression result is TRUE, the following block of code is compiled.
> 
> **Syntax**
> 
> ```
> #if <option> <op> <value> [
   <body>
]

<option> : compiler option name (case-insensitive)
<op>     : =, <>, <, >, <= or >=
<value>  : any value accepted by the property
<body>   : Red/System source code
> ```
> 
> Valid option names and allowed values are listed in %config.r file, in a comment section. For words value, both word! and lit-word! syntaxes will be accepted.
> 
> **Example**
> 
> ```
> #if OS = 'Windows [
    print "Running on Windows"
]
> ```
> 
> Note: if the argument is a word and not a value (like an integer! or a logic!), it needs to be prefixed with ' character to avoid being evaluated (as in normal REBOL expressions).

### 16.5 #either

> The **#either** compiler directive allows conditional compilation based on a simple conditional expression limited to a few compilation options. If the expression result is TRUE, the first block of code is compiled, else the second one is compiled.
> 
> **Syntax**
> 
> ```
> #either <option> <op> <value> [
   <body-TRUE>
][
   <body-FALSE>
]

<option> : compiler option name (case-insensitive)
<op>     : =, <>, <, >, <= or >=
<value>  : any value accepted by the property
<body-*> : Red/System source code
> ```
> 
> Valid option names and allowed values are listed in %config.r file, in a comment section. For words value, both word! and lit-word! syntaxes will be accepted.
> 
> **Example**
> 
> ```
> #either OS = 'Windows [
    print "Running on Windows"
][
    print "Running probably on a UNIX platform"
]
> ```
> 
> Note: if the argument is a word and not a value (like an integer! or a logic!), it needs to be prefixed with ' character to avoid being evaluated (as in normal REBOL expressions).

### 16.6 #switch

> The **#switch** compiler directive allows to define several conditionally compiled block of codes, depending on the value of a compilation option. The block following the option name is searched for a matching value and the following block of code is compiled.
> 
> **Syntax**
> 
> ```
> #switch <option> [
   <value-1> [
       <body-1>
    ]
   <value-2> [
       <body-2>
   ]
   ...
   #default [                          ;-- optional default clause
       <body-N>
   ]
]

<option>  : compiler option name (case-insensitive)
<value-*> : any value accepted by the property
<body-*>  : Red/System source code
> ```
> 
> Valid option names and allowed values are listed in %config.r file, in a comment section. For words value, both word! and lit-word! syntaxes will be accepted.
> 
> Note: the #default clause is optional. If present, it acts as a default catch-all value if none other is matched.
> 
> **Example**
> 
> ```
> #switch type [
    exe [print "Building an executable"]
    dll [print "Building a dynamically linked library"]
    obj [print "Building an object file"]
    lib [print "Building a statically linked library"]
]
> ```
> 
> Note: if the argument is a word, it does not need to be prefixed with ' character in a #switch block.

### 16.7 #verbose

> This directive allows to locally change or overwrite the verbosity compilation option.
> 
> **Syntax**
> 
> ```
> #verbose <level>

<level> : integer value from 0 (no logs) to 11 (exhaustive logs).
> ```
> 
> It is mostly used for local debugging of the compilation process by framing the source lines to log between two #verbose directives.
> 
> Example:
> 
> ```
> #verbose 9
print "hello"                          ;-- maximum logs emitted
#verbose 0
print "world"                          ;-- no logs emitted
> ```

### 16.8 #call

> As a dialect of Red, Red/System can call back a Red-level function, passing arguments, using a compiler directive.
> 
> **Syntax**
> 
> ```
> #call [<Red-call> <arg1>...<argn>]

<Red-call>      : a Red word, or path (for refinements), referring to a function! value.
<arg1>...<argn> : list of arguments.
> ```
> 
> The arguments should be passed as pointers to Red values of the expected type, except for integer! and logic! datatypes, that can be passed inlined, without requiring any boxing. When required, for pointer arguments, a simple type casting is allowed.
> 
> Once the Red function returns, the normal execution of Red/System code continues. The Red return value cannot be directly retrieved currently, but it should be accessible from Red arguments stack. The Red function **must** have all arguments typed, else a compilation error will occur.
> 
> When a path is used as the function call, it refers to the function name, followed by refinements. The eventual refinements arguments are then, expected to be provided, following the mandatory ones.
> 
> **Example**
> 
> ```
> Red []

inc: func [n [integer!]][n + 1]

#system [
   #call [inc 123]
   int: as red-integer! stack/arguments
   print int/value                     ;-- will print 124
]
> ```
> 
> Requires Red compiler
> 
> The **#call** directive needs to be processed by the Red compiler, so it cannot be used in Red/System standalone applications. The legal places to use it are:
> 
> - a Red routine
> - in a #system directive
> - in a #system-global directive

### 16.9 #export

> When generating a shared library, the Red/System toolchain needs to know which identifiers will be exposed to third-party users of the library. This is achieved using the **#export** compiler directive.
> 
> **Syntax**
> 
> ```
> #export [<symbols>]
#export <cconv> [<symbols>]

<symbols> : one or several function or global variable name
<cconv>   : optional calling convention word (stdcall or cdecl)
> ```
> 
> One or several #export directives can be used in the same Red/System library code.

### 16.10 #u16

> Converts a literal string to UTF-16LE format. The string is stored in memory in that new format with a terminal UTF-16 NUL character.
> 
> **Syntax**
> 
> ```
> #u16 <string>

<string> : a literal c-string!
> ```
> 
> Only literal strings can be statically processed by this directive.

### 16.11 #inline

> Injects CPU-specific machine code at current position in code. Both standalone statements and nested statements are supported.
> 
> **Syntax**
> 
> ```
> #inline <binary>
#inline [<binary> return: [<type>]]

<binary> : a literal binary containing the machine code
<type>   : any valid Red/System type
> ```
> 
> The second syntax is used to nest the machine code in an R/S expression. The returned type specification is then mandatory.
> 
> CPU-specific implementation details
> 
> The returned value needs to be stored in EAX register on IA-32, and R0 register on ARM. For floating point values, they need to be returned in FPU base registers (ST0 for Intel, S0/D0 for ARM).
> 
> **Examples**
> 
> ```
> #inline #{83C410}        ;-- ADD esp, 16

a: #inline [
   #{B82A000000}         ;-- MOV eax, 42
   return: [integer!]
]
> ```

## 17. Source code organization

### 17.1 Source files suffix

> The official Red/System source file suffix to use is: **.reds**

### 17.2 Header

> Red/System enforces the usage of a standard header for all sources (one of the great ideas in REBOL), to both identify a valid Red/System program and document it.
> 
> **Syntax**
> 
> A valid Red/System source file will need this header:
> 
> ```
> Red/System [
 <name>: <value>
 ...                                   ;-- more attributes...
]

<name>  : valid identifier
<value> : any Red valid datatype
> ```
> 
> There is no minimum or maximum number of entries that a valid header can contain, so an empty block will also be valid (but bad practice).
> 
> Implementation note
> 
> Header values types are the ones provided by REBOL during the bootstrapping phase only. Once the Red layer will be implemented, the allowed datatypes will be Red ones.
> 
> The attribute that you can specify are not limited, you can add whatever you want/need. Anyway, some attribute names are used by convention:
> 
> - **Title**: application title
> - **Purpose**: short description of the application purpose
> - **Author**: source code author name
> - **File**: name of the source file
> - **Version**: source code version (usually using a [tuple! literal](http://www.rebol.com/docs/core23/rebolcore-16.html#section-3.9))
> - **Date**: date of last version
> - **Rights**: copyrights
> - **License**: source license (URL or full text)
> - **History**: source modifications history
> - **Note(s)**: any special notice
> 
> **Example**
> 
> ```
> Red/System [
   Title:   "Red/System small demo app"
   Author:  "Nenad Rakocevic"
   File:    %hello.reds
   Rights:  "Copyright (C) 2011 Nenad Rakocevic. All rights reserved."
   License: "BSD-3 - https://github.com/dockimbel/Red/blob/master/COPYING"
]
> ```

### 17.3 Code flow layout

> A typical Red/System program is a mix of function definitions and global code (meaning executable code that is not in a function). There is no concept of "main" function in Red/System. The only entry point is the beginning of the source code and the exit point is at the end of the source code, or at a QUIT call if encountered before.
> 
> Example:
> 
> ```
> foo: 123
print "hello"

bar: func [a [integer!]][foo * 2]
foo-twice: bar foo

either foo < 100 [
   print "less than 100"
][
   print "more than 100"
]

bye: func [][print "goodbye"]

bye
> ```
> 
> So, it is possible to mix functions and global code providing that functions are defined before they are called from global context. Such restrictions don't apply if the call is made from a function context, so cross-references like these:
> 
> ```
> foo: func [...][...bar...]
bar: func [...][...foo...]
> ```
> 
> can be processed without issues.

### 17.4 Coding guidelines

> *TBD*

### 17.5 Shared library program

> You can use global code in your shared library program, but this is not recommended, as it might be unsupported in the future. All your code should be in functions.
> 
> Note: All shared library programs need to export at least one symbol using the **#export** directive or a compilation error will occur.
> 
> A shared library might implement one or several of the callbacks below:
> 
> - **on-load** : called when the library is loaded by the host
> - **on-unload** : called when the library is freed by the host
> 
> The specifications for these callbacks are system-specific:
> 
> **Windows**
> 
> ```
> on-load:        func [hModule [integer!]][...]
on-unload:      func [hModule [integer!]][...]
on-new-thread:  func [hModule [integer!]][...] ;-- Windows-specific callback
on-exit-thread: func [hModule [integer!]][...] ;-- Windows-specific callback
> ```
> 
> **MacOS X**
> 
> ```
> on-load: func [
   argc    [integer!]
   argv    [struct! [s [c-string!]]]
   envp    [struct! [s [c-string!]]]
   apple   [struct! [s [c-string!]]]
   pvars   [program-vars!]
][...]
on-unload: func [[cdecl]][...]
> ```
> 
> **Others**
> 
> ```
> on-load:   func [][...]
on-unload: func [][...]
> ```

### 17.6 Driver program (experimental)

> It is possible to generate kernel drivers with Red/System. The same remarks as for shared library programs apply to a driver program.
> 
> The driver entry point is a **on-load** function in Red/System that has the following specification:
> 
> ```
> on-load: func [
   DriverObject [driver-object!]   ;-- predefined type (empty struct for now)
   RegistryPath [byte-ptr!]        ;-- Unicode string (UTF-16LE)
   return: [integer!]
][...]
> ```
> 
> A minimal Windows driver would look like:
> 
> ```
> Red/System []

#enum NTSTATUS! [
   STATUS_SUCCESS
]

on-load: func [
   DriverObject [driver-object!]   ;-- predefined type (empty struct for now)
   RegistryPath [byte-ptr!]        ;-- Unicode string (UTF-16LE)
   return: [NTSTATUS!]
][
   STATUS_SUCCESS
]
> ```
> 
> Experimental support
> 
> Currently it is only supported on Windows platforms.

## 18. Reserved keywords

> The list of following symbols and keywords are reserved, they cannot be used as variable or function name:
> 
> ```
> %           &           * 
+           -           -**
/           //          ///
<           <<          <= 
<>          =           >
>>          >=          >>>
??          alias       all
and         any         as
assert      break       case
catch       comment     context
continue    declare     either
exit        false       func
function    if          loop
not         null        or
pop         push        return
size?       switch      throw
true        until       use
while       with        xor
> ```
> 
> Bootstrap constraints
> 
> Both -\** (internal representation for &gt;&gt;&gt;) and /// (internal representation for %) are required to workaround REBOL's lexical scanner limitations. Those symbols will be removed from the reserved keywords list once the bootstrap phase will end.

## 19. Possible Evolutions

### 19.1 Variables

> - Add support for multiple assignments, like a: b: c: 0

### 19.2 Pointers

> - Remove pointer! datatype (struct! is able to do the same job) ***REJECTED***
> - Accept boolean operations on pointers: OR, XOR, AND (nice but use-cases would be rare?)

### 19.3 Struct

> - Add support for specifying struct memory alignment and padding. Default structure and members alignment would be the one specified in target object (per target). Per struct specific rules should be possible using the following syntax:
> 
> ```
> #align <integer>               ;-- change memory alignment for all subsequent
                               ;-- c-strings, pointers and structs.

struct [
   [align <n> <little|big>]    ;-- change members alignment and endianess
   <members>
]

<n>      : number of bytes to align members to
<little> : little endian (optional)
<big>    : big endian (optional)
> ```
> 
> - Add support for passing struct! by value when required.

### 19.4 C-strings

> - Add a FOREACH control flow function to traverse c-strings (or even array! values): A simple way to traverse a c-string could be:
> 
> ```
> foo: "I am a c-string"
foreach c foo [prin c]
> ```
> 
> will output:
> 
> ```
> I am a c-string
> ```

### 19.5 Logic!

> - Add logic! support for OR, XOR, AND operators (if it provides any advantage over ANY/ALL).

### 19.6 Integer!

> - Bind the integer! type to int32! or int64! depending on the target platform. It needs some further investigations to determine if it can be a real advantage or not.

### 19.7 Functions

> - Add support for functions refinements (same as in REBOL)
> - Infer functions return value datatype
> - Accept an integer parameter for \[catch] attribute to set manually the catching level (to avoid manual exception re-throwing).
> - Distinguish the behaviour of **function** from **func** to assume all set-words are locals (as in Red).

### 19.8 New datatypes

> - **Array!**: this datatype would allow declaring arrays of values that could be accessed with an integer index (similar to C arrays). Redundancy with c-string! datatype would need to be considered. Here is a draft of possible syntax and usage:
> 
> ```
> ---- C ------               --------- Red/System ----------
int p[20] = 0;              p: array [20 integer!]
p[4] = 123;                 p/4: 123
p[i] = 123;                 p/i: 123
> ```
> 
> - Add a uint8! datatype
> - Add a uint16! (or short!) datatype
> - Add a uint64! (or long!) datatype
> - **Binary!**: this datatype was reserved early in the compiler's datatypes list, but not implemented. Its purpose was just to provide literal input/output forms in hexadecimal for c-string values. A standalone datatype for such purpose might be avoidable, hence the delayed implementation. ***REJECTED***
> - **Logic!**: add a boolean datatype, so that booleans resulting from conditional expressions become first class citizens.

### 19.9 New functions

> - Add a FORM function (convert any datatype to c-string!)
> - Add a SWITCH function: branch on different code blocks depending on a input value
> - Add a INLINE function to inline machine code: inline #{1234...} and/or assembler
> - Add a NOT function that would return the boolean opposite of argument value. As booleans are not really supported in the current specs, NOT addition is postponed.
> - Add a REPEAT function to be able to loop with a counter:
> 
> ```
> total: 0
repeat c 10 [total: total + c]
> ```
> 
> - Add a TYPE? function returning the argument's type as integer! (should use defines to name them)

### 19.10 Misc

> - Add a module system (per-file contexts for example)
> - Support 0 and 1 as valid boolean results ***REJECTED***
> - Extend the get-word! syntax to integer! variables.
> - Support multiple nested type castings.

## 20. Document History

> - **08/09/2022 - revision 60**
>   
>   - Adds pointer! to pointer! mentions.
> - **05/09/2022 - revision 59**
>   
>   - Improves struct by value description.
> - **23/02/2022 - revision 58**
>   
>   - Removes EITHER from expression rules, as the current compiler can't handle it properly.
> - **14/08/2020 - revision 57**
>   
>   - Adds subroutines description.
>   - Adds binary! arrays description.
>   - Adds multiple assignments and variable grouping mentions.
>   - Adds system/stack/allocate/zero description.
>   - Adds system/fpu/status description.
> - **05/09/2019 - revision 56**
>   
>   - Fixes issues #3301, #3303, #3305.
> - **27/08/2019 - revision 55**
>   
>   - Adds system/atomic/* intrinsics description.
> - **25/06/2019 - revision 54**
>   
>   - Adds a #INLINE directive to inline machine code.
>   - Drop support for % and // operators on float types.
>   - Adds system/io/* intrinsics.
>   - Adds system/stack/\*-all intrinsics.
>   - Document the division specific behaviors.
> - **13/09/2017 - revision 53**
>   
>   - Extends the description of literal arrays to heterogeneous arrays.
>   - Adds \`keep\` option description to \`as\`.
>   - Allow function! to pointer! in the type casting matrix.
> - **01/05/2017 - revision 52**
>   
>   - Adds description of nested structs values.
>   - Adds stack/allocate and stack/free sections.
> - **20/04/2017 - revision 51**
>   
>   - Adds description of structs by value passing/returning.
>   - Adds USE keyword description.
> - **31/03/2017 - revision 50**
>   
>   - Adds description of get-path to get struct member address.
> - **29/03/2017 - revision 49**
>   
>   - Adds description for variables importing from external libraries.
>   - Updates #call description to include refinements.
>   - Adds a section for \`size?\` description.
> - **11/03/2017 - revision 48**
>   
>   - Additional explanations for \`callback\` attribute usage.
> - **10/10/2016 - revision 47**
>   
>   - Allows integer to floats, and floats to integer direct type casting (using FPU for conversions).
>   - Adds description of system/cpu/overflow? accessor.
>   - Minor improvement of type casting matrix, "to" removed to avoid confusion.
> - **09/03/2016 - revision 46**
>   
>   - Added #u16 directive description.
> - **12/05/2015 - revision 45**
>   
>   - Added BREAK and CONTINUE descriptions.
>   - Added LOOP description.
>   - Updated keywords section.
> - **13/03/2015 - revision 44**
>   
>   - Move exceptions description to its own separate section and upgraded it with the new CATCH statement description.
>   - Fixed C void pointer bad code example
> - **13/10/2014 - revision 43**
>   
>   - Added notes about the possible future distinction between **function** and **func**.
>   - Fixed 2 misleading statements about whether or not the condition is met in **until**.
>   - Minor grammar cleanups.
> - **29/07/2014 - revision 42**
>   
>   - Removed the note about ELF backend not calling on-load/on-unload.
>   - Added system/cpu et system/fpu sections.
> - **26/04/2014 - revision 41**
>   
>   - Added literal arrays section.
>   - Type matrix adjustments on AS/TO meaning
> - **14/02/2014 - revision 40**
>   
>   - Function! to function! type casting now allowed.
> - **09/08/2013 - revision 39**
>   
>   - Extended function! pointer description to struct members. Updated type casting matrix accordingly.
>   - Added function! as valid struct member.
>   - Added back the **callback** attribut description.
>   - Added **custom** attribut description.
>   - Added **system/stack/align** description.
>   - Added **#call** compiler directive description.
>   - Added **#export** compiler directive description.
>   - Added shared library and driver programs layouts sections.
> - **18/04/2013 - revision 38**
>   
>   - Added "Exceptions" section.
>   - Added "Catch" attribute entry in "Attributes" section.
>   - Added "throw" to keywords list.
> - **24/11/2012 - revision 37**
>   
>   - Issue #280 fixed (missing function! as possible target in type casting matrix)
>   - Issue #283 fixed (uint8! mentions removed from document, only kept as possible evolutions)
>   - Issue #286 fixed (missing \`null\` keyword in reserved keywords list)
>   - Changed precedence order in WITH namespaces list
>   - Changed description of modulo/remainder for floats, now they give the same result.
> - **24/10/2012 - revision 36**
>   
>   - Added docstrings in function syntax.
>   - NULL type ID note added.
>   - Added Function pointers alias and dereferencing descriptions.
>   - Added parametrized macros description.
>   - Added #verbose directive description.
> - **24/08/2012 - revision 35**
>   
>   - Added namespaces description
>   - Added CONTEXT and WITH to keywords list.
>   - Improved pointer! declaration description (section 4.8.2)
>   - Added mention of first-class nature of datatypes.
> - **25/07/2012 - revision 34**
>   
>   - Added description for variable pointer (get-word extended).
>   - Removed items already implemented from "Possible Evolutions" section.
> - **26/02/2012 - revision 33**
>   
>   - Removed misleading float32! syntax description and replaced by a simple explanation on how to form float32! literal values.
>   - Fixed code example in section 4.4.2, the \`as float32!\` type casting was missing.
> - **04/02/2012 - revision 32**
>   
>   - Added float! and float32! datatypes.
>   - Type casting matrix updated with float! and float32!
>   - Updated list of runtime type IDs.
>   - Added #enum description
> - **03/01/2012 - revision 31**
>   
>   - Completed CASE description
>   - Added SWITCH description
>   - Added SWITCH to keywords list
>   - Changed the casing of the function names used as section headers.
> - **29/12/2011 - revision 30**
>   
>   - Added CASE description.
>   - Update keywords list.
>   - Minor typo fixed.
>   - "API Reference" level removed, all sub-sections are moved up and placed after "Scoping" chapter.
>   - Literal struct members default zero value mention added.
> - **21/09/2011 - revision 29**
>   
>   - Added description for system/alias/... special path.
> - **20/09/2011 - revision 28**
>   
>   - Typed attribute ID values and macros updated.
>   - Callback attribute removed and replaced by 'cdecl attribute.
> - **17/09/2011 - revision 27**
>   
>   - Added missing bitshift operators in reserved keywords list.
>   - Improve variadic function names in examples to avoid confusion with C function names.
> - **01/09/2011 - revision 26**
>   
>   - Added system/pc description.
> - **12/08/2011 - revision 25**
>   
>   - Fixed invalid hex values in some code examples.
>   - Minor code example improvement for typed attributes.
>   - Minor editing changes
>   - Updated examples to use variadic print function
> - **09/08/2011 - revision 24**
>   
>   - Typeinfo function attribute renamed to typed.
>   - Added a note about imported library path format.
>   - Special 'system structure fully documented
>   - Added push and pop as reserved keywords
> - **08/08/2011 - revision 23**
>   
>   - Variadic and typeinfo function attributes added.
>   - Get-stack and set-stack functions removed.
>   - Added system/stack/* descriptions.
> - **04/08/2011 - revision 22**
>   
>   - Stack manipulation functions added.
> - **24/07/2011 - revision 21**
>   
>   - Pointers arithmetic extended to allow addition and subtraction of pointer arguments.
> - **07/07/2011 - revision 20**
>   
>   - Added ASSERT keyword description
> - **05/07/2011 - draft 19**
>   
>   - Fixed #if and #either examples. Note added about lit-words arguments
>   - Delimiters and free-form syntax descriptions added
>   - Various small fixes and cleanups
> - **04/07/2011 - draft 18**
>   
>   - Added a note about alias names living in their own namespace.
>   - Added % operator and notes to help distinguish % and // operators.
>   - Added a mention for global variables initialization restriction in Null description.
>   - Added -\*\*, &gt;&gt;&gt;, %, /// in reserved keywords list.
>   - Added bitshift operators section.
>   - Propagated "struct" and "pointer" replacement by "declare "
> - **23/06/2011 - draft 17**
>   
>   - Updated type casting description to match the new relaxed syntax implemented.
>   - Added null keyword description.
>   - Upgraded pointer! type reference to take byte! into account
>   - C void pointers now mapped to pointer! \[byte!] and byte-ptr!
> - **22/06/2011 - draft 16**
>   
>   - Added missing 'comment word in keywords list
>   - Added variable initialization at root level restriction description.
>   - Note added to warn about transparent statements after a function ending expression.
>   - Minor code example cleanup (local type declaration removed)
>   - Added a function! column in the type casting matrix.
>   - Added missing Expression chapter.
> - **12/06/2011 - draft 15**
>   
>   - Added #either directive
>   - #if and #either now accept any comparison operator
> - **11/06/2011 - draft 14**
>   
>   - Added #if and #switch directives description
> - **07/06/2011 - draft 13**
>   
>   - Keywords list updated, only symbols and keywords built in the compiler are retained.
>   - Function pointer description and example updated wrt recent implementation changes.
>   - Added &amp; as a reserved keyword (for future use)
>   - Keyword list updated and cleaned up
>   - Fixed non-confirming hex literals in examples (thanks Kaj)
>   - Minor fixes
> - **05/06/2011 - draft 12**
>   
>   - Callback description rewrote entirely to match the new behaviour.
>   - Function! type added to imported functions specification rules
> - **04/06/2011 - draft 11**
>   
>   - Multi-line comments restriction added.
>   - Compiler directives usage inside code blocks is now forbidden explicitly.
>   - Multiple type castings explicitly forbidden and added as possible evolution.
>   - Type inference for return value removed.
>   - Added new function attribute: callback
> - **23/05/2011 - draft 10**
>   
>   - Added type casting combinations matrix
>   - Fixed uncomplete code example for ALIAS (thanks to Kaj)
>   - Fixed list of allowed characters in variables ([issue #48](https://github.com/dockimbel/Red/issues/48))
>   - Minor other fixes
> - **20/05/2011 - draft 9**
>   
>   - Added missing type casting syntax description for compound types (thanks to Andreas).
> - **19/05/2011 - draft 8**
>   
>   - Added logic! datatype to struct members and type casting allowed types.
>   - Added a note about evaluation rule for user-defined infix functions.
>   - Added missing types supporting math and comparison operations.
>   - Explained condition permitting that EITHER function be used inside expression.
>   - Mention about not possible inclusion in expressions for IF, UNTIL, WHILE.
>   - Returned type for ANY and ALL precised.
> - **05/05/2011 - draft 7**
>   
>   - Removed mentions for c-string variables acting as constants.
> - **27/04/2011 - draft 6**
>   
>   - Added 'infix attribute support in functions spec block.
>   - Added missing logic! datatype in functions spec block definition.
> - **15/04/2011 - draft 5**
>   
>   - Letters in hex integers are restricted to uppercase only. Warning added for variable names that could be mistaken for hex integers.
>   - Logic! support for OR, XOR, AND operators withdrawn from specifications and put in the "Possible Evolution" section. (They can be replaced by ANY/ALL/NOT to compose logic expressions)
>   - 'Comment added as reserved keyword
>   - Added a note for = and &lt;&gt; operators for use with logic! values. C-string! values comparisons restricted to those two operators only (c-string! was wrongly allowed for all comparison operators).
> - **10/04/2011 - draft 4**
>   
>   - Struct arguments are passed by reference now again. STRUCT returns a reference to the struct value.
>   - Syntax now precised for STRUCT keyword followed by an alias name
>   - Struct! arithmetic added
>   - C-string! arithmetic added
>   - Pointer! now restricted to \[integer!] only. It is more consistent with c-string! and struct! which are both (implicit) pointers already.
>   - Pointer! section moved after c-string! and struct! (because it is less important now)
> - **08/04/2011 - draft 3**
>   
>   - Added get-word! syntax for getting struct variable address
>   - New Possible Evolution: extend get-word! syntax to all variable types
>   - Added "pointer" as reserved keyword
>   - Renamed "alias-type" keyword to "alias"
>   - Byte! added to definitions
>   - Pointer syntax and declaration improved and extended to support paths with indexes
>   - String! type renamed to c-string!
>   - C-string path accesses now uses byte! values for reading and writing
>   - Added type inference for functions local variables and return value
>   - Function address can be returned using get-word! syntax
>   - New "Nested functions" section added to be completed later
>   - Added byte! datatype, character specific syntax moved from integer! to byte!
>   - Added logic! datatype (boolean values)
>   - Added TRUE and FALSE keywords
>   - Added NOT operator
>   - Old "Logical" operators renamed to the more appropriate "Bitwise" operators
>   - Bitwise ops completed with boolean counterparts
>   - More accurate syntax description for all infix operators
>   - Functions local variables type is now optional if the variables are properly initialized
>   - Added an empty "Type Conversion" to be completed later
>   - Removed functions and macros defined in runtime from keywords, they can be redefined by user code if required
>   - New Possible Evolution: integer! as a platform-specific type
>   - Minor corrections and additions
> - **29/03/2011 - draft 2**
>   
>   - Added missing array! datatype proposition in Evolutions
>   - Added missing EXIT and RETURN in reserved keywords list
> - **28/03/2011 - draft 1**
>   
>   - First public release

[MakeDoc2 by REBOL](http://www.rebol.com) - 17-Sep-2022
