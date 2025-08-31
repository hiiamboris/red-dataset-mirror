# How to debug RED code?

**Link:**
<https://stackoverflow.com/questions/47675928/how-to-debug-red-code>

**Asked:** 2017-12-06 13:50:12 UTC

------------------------------------------------------------------------

What is the preferred way to debug the RED prog lang code? Is there a
RED debugger?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by rebolek

There\'s no debugger AFAIK, but there are functions that can help you
with debugging. Take a look at these two articles, they should help you:

-   [https://github.com/red/red/wiki/Debugging](https://github.com/red/red/wiki/Debugging){rel="nofollow noreferrer"}
-   [https://github.com/red/red/wiki/How-to-Debug:-A-use-case-by-@DocKimbel](https://github.com/red/red/wiki/How-to-Debug:-A-use-case-by-@DocKimbel){rel="nofollow noreferrer"}

Basically you should use inbuilt functions like `probe`, `??`, `dump4`,
`stack/dump` or `print-symbol`.

You can also turn various debugging info with
`system/preprocessor/debug?: on`, `system/view/debug?: on` and
`system/reactivity/debug?: on`.

*Comment by user310291:* these pages point to nowhere: it\' shows create
a new page

------------------------------------------------------------------------

## Comments on question
