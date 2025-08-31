
#152: Problem using Null? in Until Loop
================================================================================
Issue is closed, was reported by PeterWAWood and has 10 comment(s).
[status.built]
<https://github.com/red/red/issues/152>

The following short program and output demonstrates the problem:

PROGRAM

```
   Red/System []

s: ""
either null? s/1 [print "null? is correct"][print "not null? is incorrect"]
print lf

foo: "I am a c-string"
bar: foo

print ["using bar/1 = null-byte" lf]

until [
   print bar/1                    
   bar: bar + 1
   bar/1 = null-byte
]

print [lf "using null? bar/1" lf]

bar: foo
until [
   print bar/1                    
   bar: bar + 1
   null? bar/1 
]
```

OUTPUT

```
Rodney:builds peter$ ./test
null? is correct
using bar/1 = null-byte
I am a c-string
using null? bar/1
I am a c-string? using bar/1 = null-byteusing null? bar/1logic!integer!byte!c-string!pointer! [byte!]pointer! [integer!]struct!function!%i%08Xtruefalse 
*** Runtime Error : access violationinvalid alignmentbreakpointsingle stepbounds exceededfloat denormal operanfloat divide by zerofloat inexact resultfloat invalid operationfloat overflowfloat stack checkfloat underflowinteger divide by zerointeger overflowprivileged instructioninvalid virtual addressillegal instructionnon-continuable exceptionstack error or overflowinvalid dispositionguard pageinvalid handleillegal operandillegal addressing modeillegal trapcoprocessor errornon-existant physical addressobject specific hardware errorhardware memory error consumed ARhardware memory error consumed AOprivileged registervirtual memory release failedout of memoryassertion failed at line unknown error
*** at: h?
          ???????????:?
exit_putchar_printf_sigaction
*** Runtime Error 1: access violation
*** at: 00005000h
```



Comments:
--------------------------------------------------------------------------------

On 2011-08-11T11:26:38Z, dockimbel, commented:
<https://github.com/red/red/issues/152#issuecomment-1781011>

    `null?` is a macro defined as `null =`. As `null` is reserved for pointers only (struct!, pointer!, c-string!), it should not be used for comparing with a byte! value. The different widths of both values lead to indeterminate result (usually wrong result).
    
    So `null? bar/1` is incorrect and leads to memory corruption, as showed by the output. You should use `null-byte` for comparison with byte! values.

--------------------------------------------------------------------------------

On 2011-08-11T14:41:34Z, PeterWAWood, commented:
<https://github.com/red/red/issues/152#issuecomment-1782333>

    I came across this "non-problem" when updating an example in the Red/System specification. The old example code was:
    
    ```
    zero? bar/c
    ```
    
    which no longer compiles. I then tried with an explicit type cast 
    
    ```
     zero? as integer! bar/1
    ```
    
    It also  returns false and leads to a memory error.
    
    I settled on `bar/1 = null-byte` as you've suggested.

--------------------------------------------------------------------------------

On 2011-08-11T21:05:10Z, dockimbel, commented:
<https://github.com/red/red/issues/152#issuecomment-1785932>

    Thanks for fixing and updating examples in specification document, that is something I often forgot to do.

--------------------------------------------------------------------------------

On 2011-08-12T00:56:05Z, PeterWAWood, commented:
<https://github.com/red/red/issues/152#issuecomment-1787379>

    By the way, a compilation error would be nice in the case of `null? my-byte-variable`. Not a high priority though.

--------------------------------------------------------------------------------

On 2012-01-05T16:00:16Z, dockimbel, commented:
<https://github.com/red/red/issues/152#issuecomment-3371619>

    Tested with version 0.2.3, it doesn't produce any crashes anymore. Anyway, I agree about the need for a compilation error in such case.

