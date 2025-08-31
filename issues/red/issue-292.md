
#292: #""" is accepted as character literal in Red
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/292>

The Red lexer just copies the character following `#"` without checking if it is perhaps a closing quote. I checked that a literal line-feed is also accepted without problems between the two quotes.



