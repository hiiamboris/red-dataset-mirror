
#2610: request-dir/title "^" and "&" characters not displayed
================================================================================
Issue is closed, was reported by 9214 and has 12 comment(s).
<https://github.com/red/red/issues/2610>

Playing around with file I/O I discovered this:

`request-dir/title {Usual title, nothing criminal}`

![default](https://cloud.githubusercontent.com/assets/15716466/25293921/524964ea-26f6-11e7-86c9-a8c0fadb7462.png) 

Everything's fine, but see what happens then I use **^** and **&**:
`request-dir/title {Nietzsche rocks! ^_^ He wrote "Beyond Good & Evil"}`

![default](https://cloud.githubusercontent.com/assets/15716466/25294140/490cd5fa-26f7-11e7-9667-ebbec1dc8d24.png)

I don't know `View` that much to test it with similar GUI elements, perhaps it's not only `request-dir`-related. 😕 
Also, there might be more such glitchy characters out there.


Comments:
--------------------------------------------------------------------------------

On 2017-04-22T04:42:39Z, qtxie, commented:
<https://github.com/red/red/issues/2610#issuecomment-296347180>

    @9214 
    - `^` has special meaning in Rebol/Red string, you need to type `^^` to insert a caret. [More details here](http://www.rebol.com/r3/docs/datatypes/string.html).
    - `&` is used for underline the character on Windows. We'll see how to deal with it as the other platforms no such feature.

--------------------------------------------------------------------------------

On 2017-04-22T12:05:57Z, 9214, commented:
<https://github.com/red/red/issues/2610#issuecomment-296368845>

    Thanks for clarifying @qtxie !
    
    `request-dir/title "^^ &Underline"`
    
    ![default](https://cloud.githubusercontent.com/assets/15716466/25304276/9beb03ec-277d-11e7-8160-d31f6ebc8daf.png)
    
    Meanwhile I'll stick to `and` instead of `&` :^)

--------------------------------------------------------------------------------

On 2017-04-28T07:33:51Z, DideC, commented:
<https://github.com/red/red/issues/2610#issuecomment-297929333>

    You can display an & by doubling it in the string:
    `request-dir/title "You && Me ^^_^^"`

--------------------------------------------------------------------------------

On 2017-04-28T10:45:23Z, 9214, commented:
<https://github.com/red/red/issues/2610#issuecomment-297967639>

    Guess it can be marked as resolved, thanks @DideC .

--------------------------------------------------------------------------------

On 2018-05-30T22:49:34Z, endo64, commented:
<https://github.com/red/red/issues/2610#issuecomment-393344504>

    I noted this on Wiki [Request-file-and-Request-dir](https://github.com/red/red/wiki/%5BDOC%5D-Request-file-and-Request-dir), this issue can be closed.

--------------------------------------------------------------------------------

On 2018-05-31T00:56:42Z, greggirwin, commented:
<https://github.com/red/red/issues/2610#issuecomment-393366761>

    Thanks @endo64 !

