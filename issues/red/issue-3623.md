
#3623: [Suggestion] Font weight
================================================================================
Issue is closed, was reported by EricKotato and has 4 comment(s).
<https://github.com/red/red/issues/3623>

Some fonts are using custom font weights: "Semibold", "Black", "Thin", etc. But you can set only bold.
My suggestion is: add "weight" parameter to Font object or just parse it from font name (e.g. "Black" from "IBM Plex Sans Black" or "SemiBold" from "Segoe UI Semibold"). It would be good either way.


Comments:
--------------------------------------------------------------------------------

On 2018-12-01T05:02:41Z, greggirwin, commented:
<https://github.com/red/red/issues/3623#issuecomment-443400185>

    There is no need for a separate `weight` facet. The `style` facet holds all font attributes. Currently `['bold | 'italic | 'underline | 'strike]` are supported. Internally they have to be mapped to OS font attributes. e.g., on Windows, bold assigns a weight of 700, while on MacOS it applies NSBoldFontMask. 
    
    If you would like to research the various words and their mappings on Win/Mac/Android (and GTK for future would be nice), that would help. If you do, please open a ticket on the red/REP repo, which is where we're tracking wish tickets now. Thanks!

--------------------------------------------------------------------------------

On 2018-12-01T17:41:40Z, EricKotato, commented:
<https://github.com/red/red/issues/3623#issuecomment-443443935>

    I've found that it's already working for font name. I think it negates the problem, so I think that ticket isn't needed. Thanks.

