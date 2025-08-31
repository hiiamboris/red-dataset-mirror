
#26: Chaining of function calls does not seem to work 
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.tested]
<https://github.com/red/red/issues/26>

I am continuing my work on a 'form function, and have a working version (could share with you if interested, although it is very primitive). But, ... the following calling sequence crashes the compiler in Windows with error code 0xc0000005:

```
print form length? form -21474
```

(should give 6, and it does if I store intermediate results in separate variables before calling the "next" function)



Comments:
--------------------------------------------------------------------------------

On 2011-05-01T14:46:23Z, dockimbel, commented:
<https://github.com/red/red/issues/26#issuecomment-1083351>

    Length? has some issues since the changes on global variables and literals storage yesterday, as it expects 2 levels of indirection and is fed with only one when taking a function call as argument.

--------------------------------------------------------------------------------

On 2011-05-01T15:23:38Z, dockimbel, commented:
<https://github.com/red/red/issues/26#issuecomment-1083434>

    About the FORM function, currently I haven't decided yet if I want it polymorphic (and hence, built-in the compiler), or working for integers only and part of runtime. Also, once the c-string! arithmetic will be supported (in the next days), it will make implementation of any c-string! modifying function simpler and shorter.
    
    You can publish your FORM function here if you want. If you publish it on the web, I can add a link from red-lang.org to your page.

--------------------------------------------------------------------------------

On 2011-05-01T16:03:56Z, meijeru, commented:
<https://github.com/red/red/issues/26#issuecomment-1083529>

    I cannot publish my 'form yet, since it uses a number of kludges:
    - for lack of a unary minus and an 'abs function, it has to do
      
      ```
      if i < 0 [i: 0 - i]
      ```
    - it also has to compute individual digits like so:
      
      ```
      d: i // 10 (store) as byte! (d + 48)
      ```
      
      because the following does not work:
      
      ```
      (store) as byte ((i // 10) + 48)
      ```
      
      which is another issue that I have to report
    - it has to take a "substring" by inserting a 0 or #"^(00)" in the result string (this works, but is not tidy)

--------------------------------------------------------------------------------

On 2011-05-03T08:23:18Z, meijeru, commented:
<https://github.com/red/red/issues/26#issuecomment-1092601>

    I have seen that the [as byte! ((1 // 10) + 48)] issue is now solved so I published the form,reds function as
    https://gist.github.com/952998

--------------------------------------------------------------------------------

On 2011-05-09T11:45:32Z, dockimbel, commented:
<https://github.com/red/red/issues/26#issuecomment-1122374>

    Tested OK.

