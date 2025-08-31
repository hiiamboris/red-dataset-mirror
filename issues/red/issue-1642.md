
#1642: Wish: float! literals should include 1. etc
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[type.wish]
<https://github.com/red/red/issues/1642>

Both R2 and R3 allow this and interpret `1.` as `1.0`    .



Comments:
--------------------------------------------------------------------------------

On 2016-02-17T14:34:43Z, ghost, commented:
<https://github.com/red/red/issues/1642#issuecomment-185230589>

    I don't know why it was there in R2 and R3 but I vote against it's inclusion in Red. I see no advantage of typing `1.0` as `1.` . On the other hand it would only lead to confusions amongst newcomers. 
    
    My personal belief is that any kind of syntactic sugar should be provided only if it improves readability and not degrades it.

--------------------------------------------------------------------------------

On 2016-02-17T15:10:48Z, dockimbel, commented:
<https://github.com/red/red/issues/1642#issuecomment-185245085>

    It is not allowed in Red lexer for the reasons expressed by @nc-x. I see no advantage of allowing it, just introducing some awkward syntax that Rebol should have never allowed in the first place.

--------------------------------------------------------------------------------

On 2016-02-17T15:14:24Z, meijeru, commented:
<https://github.com/red/red/issues/1642#issuecomment-185246907>

    It probably is in Rebol because it is a widely accepted notation for writing numbers. MS Excel accepts it too, and so does the Windows calculator as well as my Casio pocket calculator. But it is true that it only saves the typeing of one digit `0`...

--------------------------------------------------------------------------------

On 2016-02-18T09:21:57Z, meijeru, commented:
<https://github.com/red/red/issues/1642#issuecomment-185620750>

    Interestingly, Red accepts `.5` for `0.5` just like both Rebols do...
    .

--------------------------------------------------------------------------------

On 2018-04-25T04:42:11Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1642#issuecomment-384158917>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

