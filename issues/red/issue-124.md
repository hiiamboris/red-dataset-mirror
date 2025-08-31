
#124: Consecutive #defines don't compile
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 14 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/124>

This works:

```
#define curl-read-function-abort            10000000h

#define curl-read-function-pause            10000001h  ; cURL >= 7.18
```

but

```
#define curl-read-function-abort            10000000h
#define curl-read-function-pause            10000001h  ; cURL >= 7.18
```

doesn't compile:

```
*** Compilation Error: undefined symbol: curl-read-function-pause 
*** in file: %/users/administrator/Red/Red-cURL/examples/test.reds 
*** at:  [curl-read-function-pause 268435457 
    #import ["libcurl.so.4" cdecl [
```

The #import is actually quite a bit further in the source.



Comments:
--------------------------------------------------------------------------------

On 2011-07-02T13:05:44Z, dockimbel, commented:
<https://github.com/red/red/issues/124#issuecomment-1489294>

    I cannot reproduce this error. I have used:
    
    ```
    Red/System []
    
    #define curl-read-function-abort 10000000h
    #define curl-read-function-pause 10000001h ; cURL >= 7.18
    
    prin-hex curl-read-function-pause
    ```
    
    Compiles correctly and outputs `10000001`.

--------------------------------------------------------------------------------

On 2011-07-02T14:47:06Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/124#issuecomment-1489538>

    I've reduced it to this:
    
    ```
    Red/System []
    
    #define x 10000000h
    #define y 10000001h
    
    #define unlisted-stuff blah
    
    #switch OS [
        Windows     [#define cURL-library "libcurl.dll"]
        MacOSX      [#define cURL-library "libcurl.dylib"]
        #default    [#define cURL-library "libcurl.so.4"]
    ]
    #import [cURL-library cdecl [
    ]]
    ```
    
    Error:
    
    ```
    *** Compilation Error: undefined symbol: y 
    *** in file: %/users/administrator/Red/Red-cURL/examples/bug.reds 
    *** at:  [y 268435457 
        #import ["libcurl.so.4" cdecl [
            ]]
    ]
    ```
    
    When I shorten the values:
    
    ```
    #define x 1000000h
    #define y 10000001h
    ```
    
    I get:
    
    ```
    Compiling /users/administrator/Red/Red-cURL/examples/bug.reds ...
    *** Loading Error: invalid hex literal: 1000000h
    #define y 10000001h
    
    #define un 
    *** in file: %/users/administrator/Red/Red-cURL/examples/bug.reds 
    *** at:  []
    ```
    
    Note that the disappeared part of the source is partly listed now.

--------------------------------------------------------------------------------

On 2011-07-02T20:07:48Z, dockimbel, commented:
<https://github.com/red/red/issues/124#issuecomment-1490375>

    Still cannot reproduce your error. Saving your code snippet in a file and compiling it with the latest revision gives me:
    
    ```
    -= Red/System Compiler =-
    Compiling tests/bug.reds ...
    *** Compilation Error: invalid import specification at:
    *** in file: %tests/bug.reds
    *** at:  [
        #import ["libcurl.dll" cdecl [
            ]]
    ]
    ```
    
    If I provide a syntactically correct import specification (like `foo: "foo" []`), it compiles without any error.

--------------------------------------------------------------------------------

On 2011-07-02T20:48:41Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/124#issuecomment-1490463>

    Have you tried on Linux? I'm thinking it could be related to one-byte LF line endings. In any case, it seems to have to do with hex value parsing.
    
    There doesn't seem to be a way to upload an attachment here?

--------------------------------------------------------------------------------

On 2011-07-02T21:56:04Z, dockimbel, commented:
<https://github.com/red/red/issues/124#issuecomment-1490687>

    I tried cross-compiling for Linux, no difference. I am using REBOL 2.7.6, I will try with 2.7.8, just in case.
    
    EDIT: same thing with 2.7.8, I get the import spec error only.

--------------------------------------------------------------------------------

On 2011-07-02T22:05:03Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/124#issuecomment-1490698>

    When cross-compiling you probably don't have your source using LF only.

--------------------------------------------------------------------------------

On 2011-07-02T22:25:32Z, dockimbel, commented:
<https://github.com/red/red/issues/124#issuecomment-1490767>

    Ok, converted the file to LF endings, and I can now see the error.

