
#735: THEN fails to fail
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 14 comment(s).
[status.resolved]
<https://github.com/red/red/issues/735>

```
red>> parse [0] [integer! then [integer! (print 'integers)] | [(print 'skip) skip]]
skip
== true
```



Comments:
--------------------------------------------------------------------------------

On 2014-03-25T01:18:22Z, PeterWAWood, commented:
<https://github.com/red/red/issues/735#issuecomment-38521382>

    Your parse rule seems a little ambiguous, did you mean:
    
    ```
    red>> parse [0] [integer! then [[integer! (print 'integers)] | [(print 'skip) skip]]]
    skip
    == false
    ```
    
    or
    
    ```
    red>> parse [0] [[integer! then [integer! (print 'integers)]] | [(print 'skip) skip]]
    skip
    == true
    ```

--------------------------------------------------------------------------------

On 2014-03-25T03:03:09Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/735#issuecomment-38526347>

    Well, I meant what I wrote. R3 evaluates it to FALSE without invoking SKIP. Your examples mean something else and make the use of THEN ineffective.

--------------------------------------------------------------------------------

On 2014-03-25T11:22:12Z, dockimbel, commented:
<https://github.com/red/red/issues/735#issuecomment-38553089>

    I had a quick review of THEN [description](http://www.rebol.net/wiki/Parse_Project#THEN) on the Parse project page. THEN does not implement the same behavior in Red. Though, I find both approaches not satisfying for different reasons, so I need to review the purpose and usage of THEN again, and decide what to do with it.

--------------------------------------------------------------------------------

On 2014-03-25T20:16:04Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/735#issuecomment-38614765>

    I agree that it feels fairly frustrating to use. How does THEN in Red currently implement anything other than | ?

--------------------------------------------------------------------------------

On 2014-03-25T20:32:00Z, iArnold, commented:
<https://github.com/red/red/issues/735#issuecomment-38616661>

    would FOLLOW be a good alternative keyword?

--------------------------------------------------------------------------------

On 2014-03-26T01:57:01Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/735#issuecomment-38642697>

    It's not so much the word that's unsatisfying, but the working.

--------------------------------------------------------------------------------

On 2019-04-18T16:02:04Z, dockimbel, commented:
<https://github.com/red/red/issues/735#issuecomment-484573669>

    `then` has been removed, so I am closing this ticket.

