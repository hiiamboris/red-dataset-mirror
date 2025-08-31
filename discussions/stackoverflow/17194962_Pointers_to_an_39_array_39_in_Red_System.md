# Pointers to an &#39;array&#39; in Red/System

**Link:**
<https://stackoverflow.com/questions/17194962/pointers-to-an-array-in-red-system>

**Asked:** 2013-06-19 15:14:15 UTC

------------------------------------------------------------------------

How do I make a pointer to the first element in an array in Red/System?

Assigning an address to a pointer is no problem:

    my-integer: 1
    ptr: declare pointer! [integer!]
    ptr: :my-integer

The array is declared.

    buffer: as int-ptr! allocate 1009 * size? integer!

but.

    ptr: :buffer 

is not the way, nor is.

    ptr: ::buffer
    ptr: :buffer/1
    ptr: :(buffer/1)

Anyone knows how to do this?

Regards,

Arnold

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by Peter W A Wood

As both ptr and buffer are pointers to integer data, you simply assign
one to the other:

    ptr: buffer

The `:variable` syntax is only required to get the address of what would
be called \"primitive\" types in Java. That equates to byte!, integer!,
float!, float32! and logic! in the current version of Red/System.
Without the leading `:`, the compiler will provide the value stored in
the variable.

All other types such as c-string! and struct! (and hence alias!) are in
fact pointers. So the compiler provides their value when they are
referenced, which is a memory address.

When you reference a word, the Red/System compiler provides the value
stored in it:

    print i             ;; will print the value stored in i

When you use a set-word (a variable with a `:` appended to the name),
the compiler stores a value in it:

    i: 1                ;; stores 1 in variable i

When you use a get-word (a variable with a `:` inserted at the beginning
of the name), the compiler provides the address of the variable.

    int-ptr: :i         ;; stores the address of i in int-ptr

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* Note that `:` is NOT a *get
\"operator\"*. It isn\'t an operator at all. Hence you cannot combine
colons to achieve a get-of-a-get (`::buffer`) nor can you put a space
(`: buffer`). This ties into why Rebol and Red are so very unlike other
languages. A leading \':\' is a signal which means the symbol you are
decorating is \"flavored\" as a GET-WORD!. Despite the availability of
these \"flavors\" (more than Lisp has, by far) it\'s still just
something that gets processed symbolically. Rebol/Red process them in a
way that\'s dressed up like a \"normal\" language, but your own dialects
can do otherwise!
