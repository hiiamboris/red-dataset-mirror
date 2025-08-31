
#881: console crash on stringB: stringA + 1
================================================================================
Issue is closed, was reported by gunnarahlberg and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/881>

red>> stringA: "test"
== "test"
red>> stringB: do [stringA + 1]

**\* Script error: action 11 not defined for type: 6
bash>

Actual result - Repl crashed



Comments:
--------------------------------------------------------------------------------

On 2014-07-08T01:52:48Z, PeterWAWood, commented:
<https://github.com/red/red/issues/881#issuecomment-48263472>

    You cannot add an integer to a string in Red (or Rebol). Your code will work if you use 'APPEND to concatenate the string and the integer:
    
    ```
    red>> stringA: "test"
    == "test"
    red>> stringB: do [append stringA 1]
    == "test1"
    ```
    
    Incidentally, you don't need the use 'DO to evaluate the concatenation: 
    
    ```
    red>> stringC: "test"
    == "test"
    red>> stringD: append stringA 1
    == "test1"
    ```
    
    The current Alpha of Red does not include error handling so when an error occurs it cannot be trapped, hence the console crashing and the error messages are a little cryptic.
    
    It would be helpful if you could check on any future problems on the [Red Google Group](https://groups.google.com/forum/#!forum/red-lang) before submitting issues on Github.

