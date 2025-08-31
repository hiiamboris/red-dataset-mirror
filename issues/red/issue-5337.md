
#5337: Return-position in Parse
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5337>

I have a wish: parse has powerful commands to move inside series. Their sequence is also very readable. I think it could be used as a great linear navigation system, you just need to implement a `return-position` keyword to return the series at the place where the keyword has been encountered.

Actually, if you have the following series:
```
data: [a b c x [f g c s f e] z]
```
If you want to move to the first block and then to the second element after the letter `g` you must write:

```
skip find pick find data block! 1 'g 2
= [s f e]
```
Which is readable for fluent Red coders but unreadable for all the others. 

Using parse, you could express it linearly and in a readable way using this sequence:

```
parse data [to block! into [to 'g 2 skip pos:]]
probe pos
= [s f e]
```

Instead of using a set-word, my proposal is to implement a `return-position` keyword. So, when ecountering it, parse returns the series at the current internal index, instead of `true/false`.

The final result would be:

```
parse data [to block! into [to 'g 2 skip return-position]]
= [s f e]
```




Comments:
--------------------------------------------------------------------------------

On 2023-06-21T06:58:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5337#issuecomment-1600286610>

    Wrong place for this as usual. Also you haven't demonstrated the rationale for the new keyword, since set-word already works.

--------------------------------------------------------------------------------

On 2023-06-21T08:54:21Z, dockimbel, commented:
<https://github.com/red/red/issues/5337#issuecomment-1600453515>

    > Which is readable for fluent Red coders but unreadable for all the others.
    
    You did make it unreadable, but it does not have to:
    ```
    pos: first find data block!
    pos: find pos 'g
    pos: skip pos 2
    ```
    
    > Instead of using a set-word, my proposal is to implement a return-position keyword. So, when ecountering it, parse returns the series at the current internal index, instead of true/false.
    
    That does not fit well with Parse's purpose. Moreover, as said by Boris, a set-word rule will already give you the position if needed.
    

