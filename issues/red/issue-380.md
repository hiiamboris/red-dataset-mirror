
#380: Retain issue!-as-string when not conflicting with keyword! type
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/380>

From AltME:

My brain came up with a solution for issue! while I was sleeping. It's a notational problem, so how about having both issue! and keyword! start with a # but when the next character is alphabetic, it's a keyword, and otherwise, it's an issue!.

This is consistent with both issue notation in American English and preprocessor keywords in C-like languages.

It's an easy rule for the lexer, and a relatively easy rule for humans, that is intuitively clear.

It optimises keyword use for speed, while preventing memory leaking into the symbol table for almost all issue notations.

Many issues will not start with an alphabet character, but when they do, most cases will be transparent. In other cases, only little code needs to be added to handle them as keyword!.



Comments:
--------------------------------------------------------------------------------

On 2018-04-25T04:30:03Z, PeterWAWood, commented:
<https://github.com/red/red/issues/380#issuecomment-384157441>

    Following the introduction the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

