
#620: COPY in PARSE will corrupt string when its length is 16
================================================================================
Issue is closed, was reported by qtxie and has 18 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/620>

```
Red []
chars: charset "abcdefghijklmnopqrstuvwxyz0123456789"
str-16: "0123456789abcdef"
parse str-16 [(s: copy "") copy ss some chars (print ss append s ss print ss)]

output:
0123456789abcdef
Error: unknown string encoding: 0
```

When string length is 16, the second `PRINT` will output error.
But remove the first `COPY`, it works.

```
Red []
chars: charset "abcdefghijklmnopqrstuvwxyz0123456789"
str-16: "0123456789abcdef"
parse str-16 [(s: "") copy ss some chars (print ss append s ss print ss)]

output:
0123456789abcdef
0123456789abcdef
```

Both compiler and interpreter have this issue.



Comments:
--------------------------------------------------------------------------------

On 2013-12-17T16:21:31Z, kealist, commented:
<https://github.com/red/red/issues/620#issuecomment-30765202>

    Tested and confirmed that it works fine with strings of length 15, 17, 18, but not 16.  That is one bizarre one.  Great catch @qtxie 

--------------------------------------------------------------------------------

On 2013-12-17T20:09:07Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/620#issuecomment-30786049>

    Is it PARSE COPY, COPY or APPEND which does the corrupting?

--------------------------------------------------------------------------------

On 2013-12-17T23:17:48Z, kealist, commented:
<https://github.com/red/red/issues/620#issuecomment-30801769>

    This is the case where PARSE-TRACE gives different output than PARSE:
    
    parse-trace:
    
    ```
    match: [(s: copy "") copy ss some chars (print ss append
    input: "0123456789abcdef"
    match: [copy ss some chars (print ss append s ss print ss
    input: "0123456789abcdef"
    -->
      -->
        ==> matched
      <--
    <--
    match: [some chars (print ss append s ss print ss)]
    input: ""
    0123456789abcdef
    0123456789abcdef
    return: true
    ```
    
    parse:
    
    ```
    0123456789abcdef
    Error: unknown string encoding: 0
    ```

--------------------------------------------------------------------------------

On 2013-12-18T02:30:43Z, qtxie, commented:
<https://github.com/red/red/issues/620#issuecomment-30811429>

    It's `APPEND`'s bug. but can only reproduce it in compiler, interpreter works fine.
    
    ```
    Red []
    str-16: "0123456789abcdef"
    s: copy ""
    ss: copy str-16
    print ss
    append s ss
    print ss
    
    output:
    0123456789abcdef
    Error: unknown string encoding: 0
    ```

--------------------------------------------------------------------------------

On 2013-12-18T02:51:11Z, PeterWAWood, commented:
<https://github.com/red/red/issues/620#issuecomment-30812200>

    Perhaps the issue is with 'COPY:
    
    Code 
    
    ```
    Red []
    
    str-16: "0123456789abcdef"
    s: ""
    ss: str-16
    print ss
    append s ss
    print ss
    
    cstr-16: "0123456789abcdef"
    cs: copy ""
    css: copy cstr-16
    print css
    append cs css
    print css
    ```
    
    Output
    
    ```
    Schulz:Tests peter$ ./test
    0123456789abcdef
    0123456789abcdef
    
    *** Runtime Error 101: no value matched in SWITCH
    *** at: 00017267h
    ```

--------------------------------------------------------------------------------

On 2013-12-18T02:57:58Z, PeterWAWood, commented:
<https://github.com/red/red/issues/620#issuecomment-30812431>

    Actually, it seems that it is a memory related problem as there is no error when adding more debug prints:
    
    Code
    
    ```
    Red []
    
    str-16: "0123456789abcdef"
    s: ""
    ss: str-16
    print ["ss: " ss]
    append s ss
    print ["s: " s]
    
    cstr-16: "0123456789abcdef"
    cs: copy ""
    print ["cs: " cs]
    css: copy cstr-16
    print ["css: " css]
    append cs css
    print ["cs: " cs]
    
    Output
    ```
    
    Schulz:Tests peter$ ./test
    ss: 0123456789abcdef
    s: 0123456789abcdef
    cs: 
    css: 0123456789abcdef
    cs: 0123456789abcdef
    
    ```
    ```

--------------------------------------------------------------------------------

On 2013-12-18T03:31:25Z, qtxie, commented:
<https://github.com/red/red/issues/620#issuecomment-30813557>

    Thanks @PeterWAWood ! You are right, it is a memory related problem. I have make a PR to fix it.

--------------------------------------------------------------------------------

On 2013-12-18T16:53:17Z, dockimbel, commented:
<https://github.com/red/red/issues/620#issuecomment-30858700>

    Thank you very much for the fix @qtxie!

--------------------------------------------------------------------------------

On 2013-12-18T20:47:04Z, kealist, commented:
<https://github.com/red/red/issues/620#issuecomment-30879110>

    This fixed all of the problems I was having with parse. Thank you so much @qtxie !

