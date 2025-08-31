
#608: Unclosed quotation causes hard crash during compilation
================================================================================
Issue is closed, was reported by kealist and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/608>

Compiling the following script (missing quotation mark after `"hello`) causes a hard crash to encap window.  This should be handled more smoothly.

```
Red []

a: "hello 
```

Screenshot of hard crash:  

[Crash](http://i.imgur.com/Bgcd9KQ.jpg)

(edited to make clearer in body of Issue)



Comments:
--------------------------------------------------------------------------------

On 2013-12-16T17:54:02Z, kealist, commented:
<https://github.com/red/red/issues/608#issuecomment-30683142>

    The same happens with an unopened closing parenthesis:
    
    ```
    Red []
    
    a: "hello") 
    ```

--------------------------------------------------------------------------------

On 2013-12-18T13:55:07Z, dockimbel, commented:
<https://github.com/red/red/issues/608#issuecomment-30842838>

    I cannot reproduce it with latest version, a recent commit has probably fixed the issue:
    
    ```
    C:\Dev\Red>red bug.red
    *** Load Error: string ending delimiter " not found!
    *** Error: word has no value!
    ```
    
    Can you confim that the crash is gone for you too now?

--------------------------------------------------------------------------------

On 2013-12-18T15:02:39Z, kealist, commented:
<https://github.com/red/red/issues/608#issuecomment-30848164>

    This happens during compilation.  It is not resolved.  I have tested with the latest build.  Running the interpreter handles it correctly.

--------------------------------------------------------------------------------

On 2013-12-18T15:06:06Z, kealist, commented:
<https://github.com/red/red/issues/608#issuecomment-30848456>

    My title was accurate, but I used the word "running" in the description, so I changed it to "compiling"

--------------------------------------------------------------------------------

On 2013-12-18T15:08:45Z, dockimbel, commented:
<https://github.com/red/red/issues/608#issuecomment-30848679>

    Thanks, I have reproduced it now.

--------------------------------------------------------------------------------

On 2013-12-18T15:16:29Z, kealist, commented:
<https://github.com/red/red/issues/608#issuecomment-30849306>

    confirmed fixed

