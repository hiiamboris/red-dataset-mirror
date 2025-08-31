
#2773: Dehex error on hex values in URL
================================================================================
Issue is closed, was reported by dockimbel and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2773>

```
dehex http://%E1%E9%ED%F3%FA
*** Access Error: invalid UTF-8 encoding: #{E1E9ED00}
*** Where: do
*** Stack: load 
```


Comments:
--------------------------------------------------------------------------------

On 2017-06-10T01:56:51Z, qtxie, commented:
<https://github.com/red/red/issues/2773#issuecomment-307534763>

    What's the expect result? It cannot be decoded in [this website](https://www.urldecoder.org/). 
    ```
    Malformed input... :(
    ````

--------------------------------------------------------------------------------

On 2017-06-10T02:10:04Z, qtxie, commented:
<https://github.com/red/red/issues/2773#issuecomment-307535393>

    Actually `dehex` does not support URL.
    ```
    >> dehex http://google.com
    *** Script Error: dehex does not allow url! for its value argument
    *** Where: dehex
    ```
    It the lexer fires the error:
    ```
    >> http://%E1%E9%ED%F3%FA
    *** Access Error: invalid UTF-8 encoding: #{E1E9ED00}
    *** Where: do
    *** Stack: load
    ```

--------------------------------------------------------------------------------

On 2017-06-10T07:34:38Z, dockimbel, commented:
<https://github.com/red/red/issues/2773#issuecomment-307549007>

    Ok, the hex values in URLs have to be UTF-8 encoded, so no issue here.

