
#832: Length? of c-string incorrect in routine!
================================================================================
Issue is closed, was reported by PeterWAWood and has 8 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/832>

A four byte UTF-8 string inside a routine is either created as an eight byte or length? returns the incorrect length.

Code

```
Red[]

r: routine: [
    /local expected [c-string!]
][
    expected: {^(F0)^(9D)^(84)^(A2)}
    print [length? expected lf]
]

r
```

Output

```
-=== Red Compiler 0.4.2 ===- 

Compiling /Users/peter/VMShare/Code/Red/test.red ...
...compilation time : 334 ms

Compiling to native code...
...compilation time : 18396 ms
...linking time     : 193 ms
...output file size : 331776 bytes
...output file      : /Users/peter/VMShare/Code/Red/test

Schulz:Red peter$ ./test
8
```



Comments:
--------------------------------------------------------------------------------

On 2014-05-24T12:19:32Z, qtxie, commented:
<https://github.com/red/red/issues/832#issuecomment-44085550>

    This caused by the lexer.r treat ^(XX) as an Unicode code-point, then encode it to UTF-8. So finally the string become larger. But I don't know why we have to this?

--------------------------------------------------------------------------------

On 2014-05-24T12:52:57Z, PeterWAWood, commented:
<https://github.com/red/red/issues/832#issuecomment-44086200>

    Treating ^(XX) as a Unicode code-point is the correct behaviour for a Red string literal but, unfortunately not for a Red/System string literal. 
    
    Code
    
    ```
    Red/System []
    expected: {^(F0)^(9D)^(84)^(A2)}
    print [length? expected lf]
    ```
    
    Result
    
    ```
    Compiling to native code...
    ...compilation time : 203 ms
    ...linking time     : 11 ms
    ...output file size : 16384 bytes
    ...output file      : /Users/peter/VMShare/Code/Red-system/test
    
    4
    ```
    
    It seems that we need to introduce a way for the lexer to distinguish between the two types of string literal unless it can be made to interpret strings inside a routine differently from Red strings.

--------------------------------------------------------------------------------

On 2014-06-09T10:07:25Z, dockimbel, commented:
<https://github.com/red/red/issues/832#issuecomment-45476915>

    Agreed with Peter, it looks like we need a "Red/System mode" for the Red lexer.

--------------------------------------------------------------------------------

On 2014-06-12T07:40:29Z, dockimbel, commented:
<https://github.com/red/red/issues/832#issuecomment-45838580>

    _This caused by the lexer.r treat ^(XX) as an Unicode code-point, then encode it to UTF-8. So finally the string become larger. But I don't know why we have to this?_
    
    This is a workaround for Rebol2 lack of Unicode support (char! => 1 byte only).

