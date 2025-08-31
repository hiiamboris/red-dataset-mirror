
#3002: `<]` inside `[<]` block is treated as an unclosed `tag!`
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3002>

```Red
>> [<]
*** Syntax Error: invalid tag! at "<]"
*** Where: do
*** Stack: load 
>> [ <]
*** Syntax Error: invalid tag! at "<]"
*** Where: do
*** Stack: load 
>> [< ]
== [<]


Comments:
--------------------------------------------------------------------------------

On 2017-08-28T22:12:57Z, geekyi, commented:
<https://github.com/red/red/issues/3002#issuecomment-325498317>

    ```red
    >> [<]>]
    == [<]>]
    >> <]>
    == <]>
    >> <[>
    [    ]     ; need to close `]` in interpreter
    *** Syntax Error: invalid value at "]"
    *** Where: do
    *** Stack: load
    ```
    What should it be interpreted as? 😉
    I think this is a question of which of `tag!` or `block!` can contain each other? 🤔

--------------------------------------------------------------------------------

On 2017-08-28T23:18:57Z, geekyi, commented:
<https://github.com/red/red/issues/3002#issuecomment-325509609>

    How to debug without looking at sources? 😝
    ```red
    >> [<]
    *** Syntax Error: invalid tag! at "<]"
    *** Where: do
    *** Stack: load 
    >> system/state/trace: 2
    == 2
    >> [<]
    *** Syntax Error: invalid tag! at "<]"
    *** Where: do
    *** Stack: launch launch either run while eval-command if either switch either do-command if print = type? load set case transcode either if do 
    >> load "[<]"
    *** Syntax Error: invalid tag! at "<]"
    *** Where: do
    *** Stack: launch launch either run while eval-command if either switch either do-command unless case print type? try either = set catch load set case transcode either if do  
    
    ;; load set case transcode
    
    >> find body-of :load 'case
    == [case [
        part [system/lexer/transcode/part source out trap length] 
        next [set position system/le...
    
    >> ? system/lexer/transcode
    USAGE:
         SYSTEM/LEXER/TRANSCODE src dst trap...
    
    >> a: [] system/lexer/transcode "<]" a off
    *** Syntax Error: invalid tag! at "<]"
    *** Where: do
    *** Stack: launch launch either run while eval-command if either switch either do-command unless case print type? try either = set catch transcode either if do
    
    >> find body-of :system/lexer/transcode 'either
    == [
        either trap [
            reduce [stack/1 pos :err]
        ] [
            if error? :err [do :err]       ;; trace is here, but not so helpful in this case
           ...
    >> find body-of :system/lexer/transcode 'tag
    == none
    >> find form body-of :system/lexer/transcode 'tag
    == {tag-rule < not = | > | < | ws type tag! s some " thru " | ' thru ' | e > break | skip if e/1 <> > thro...
    
    ```
    And this where I miss `find/deep`, and I have to resort to searching in the source:
    https://github.com/red/red/blob/master/environment/lexer.red#L616
    ```red
    tag-rule: [
    	#"<" not [#"=" | #">" | #"<" | ws] (type: tag!)         ; (1)
    	 s: some [#"^"" thru #"^"" | #"'" thru #"'" | e: #">" break | skip]
    	(if e/1 <> #">" [throw-error [tag! back s]])
    ]
    ```
    So, if this was to be fixed, (1) should include `| #"]"` whew! 😄 

--------------------------------------------------------------------------------

On 2017-08-29T07:36:21Z, 9214, commented:
<https://github.com/red/red/issues/3002#issuecomment-325580551>

    @geekyi almost! I believe `| #")"` is needed too
    ```Red
    >> (<)
    *** Syntax Error: invalid tag! at "<)"
    *** Where: do
    *** Stack: load 
    >> [(<)]
    *** Syntax Error: invalid tag! at "<)]"
    *** Where: do
    *** Stack: load 
    ```

