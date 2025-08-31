
#183: Which non-ASCII characters are allowed in Red words?
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/183>

Since the lexer apparently aims to accept all Unicode characters, through their UTF-8 encoding, the question arises what characters will be allowed in Red words. It is clear which ones below U+007F are NOT allowed, but it would seem that the C1 controls (U+0080 - U+009F) should also not be allowed. Above U+00A0 (itself a whitespace) there is a huge range of characters from virtually all scripts of the world, but also many signs and "dingbats". What will the policy be?  



Comments:
--------------------------------------------------------------------------------

On 2011-10-13T22:18:06Z, dockimbel, commented:
<https://github.com/red/red/issues/183#issuecomment-2400940>

    Could you please re-post that question rather on the Red mailing-list? I would prefer keeping tickets for issues that require actions on repository files (including documentation files).
    
    Also, the mailing-list gives more exposure to such questions, so others might be interested to participate.
    
    Thanks in advance.

--------------------------------------------------------------------------------

On 2011-10-14T20:57:25Z, meijeru, commented:
<https://github.com/red/red/issues/183#issuecomment-2411338>

    Will do.

