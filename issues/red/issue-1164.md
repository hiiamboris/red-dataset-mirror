
#1164: Console: tab behaviour when pasting from clipboard
================================================================================
Issue is closed, was reported by x8x and has 20 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1164>

Could the tab autocompletion differentiate between typed TAB key and pasted text form clipboard containing tabs? If yes, tab autocompletion should probably always be turned off in such cases.

Currently, pasting this text `sys(TAB)123` will return:
`red>> system123`
I'm not sure what would be the best solution, I think if pasting outside a string definition, tabs should be converted to spaces, so in the case above I should get:
`red>> sys 123`
with tab autocomplete turned off.

When pasting text containing tabs into a string definition (after an open `{` or an open `"`) tab autocompleting should be turned off and tabs converted to `^-`, same treatment as CR and LF currently get.
So it would be great if after:
`red>> {`
pasting a string like `sys(TAB)is(TAB)(LF)great}` would return:
`red>> {sys^-is^-^/great}`



Comments:
--------------------------------------------------------------------------------

On 2015-05-15T07:10:33Z, x8x, commented:
<https://github.com/red/red/issues/1164#issuecomment-102294734>

    It can be dangerous!! check this example:
    
    ``` rebol
    killme: does [q]
    
    f: func [][
    ki: 1
    ki(TAB);comment
    ]
    ```
    
    pasting above code in the console:
    
    ``` rebol
      killme: does [q]
    ;   func [][q]
    
      f: func [][
    [    ki: 1
    [    killme;comment
    [    ]
    ;   func [][ki: 1 killme]
    ```
    
    Calling the harmless 'f function! will call the could be evil 'killme function!
    In this case it will luckily just quit.

--------------------------------------------------------------------------------

On 2016-05-10T07:53:34Z, dockimbel, commented:
<https://github.com/red/red/issues/1164#issuecomment-218084287>

    Fixed by commit [7ee272a5](https://github.com/red/red/commit/f07e0bafd3100e265f0af8fa86bbfdf67ee272a5).

--------------------------------------------------------------------------------

On 2016-05-10T12:51:01Z, x8x, commented:
<https://github.com/red/red/issues/1164#issuecomment-218147497>

    Not fixed, at least not on MacOS and Linux

--------------------------------------------------------------------------------

On 2016-05-10T13:02:20Z, qtxie, commented:
<https://github.com/red/red/issues/1164#issuecomment-218150239>

    Yes. CLI console still has this issue.

--------------------------------------------------------------------------------

On 2016-05-10T13:51:36Z, qtxie, commented:
<https://github.com/red/red/issues/1164#issuecomment-218163374>

    Actually in CLI console I cannot distinguish between the text from keyboard, and the text from clipboard.
    So maybe we should provide a way to disable autocompletion, something like: `system/console/auto-completion?: off`.

--------------------------------------------------------------------------------

On 2016-05-10T17:47:03Z, x8x, commented:
<https://github.com/red/red/issues/1164#issuecomment-218235670>

    nodejs has the same issue, probably because they also can't differentiate between typed vs pasted.
    In node REPL, pasting `conso(TAB)//123` will print `console//123`
    I will do some research about this.

--------------------------------------------------------------------------------

On 2016-05-10T19:24:05Z, x8x, commented:
<https://github.com/red/red/issues/1164#issuecomment-218263255>

    There is a nice solution working on MacOS and Linux: "Bracketed paste mode".
    Quoting: "it enables something very cool: programs can tell the difference between stuff you type manually and stuff you pasted".
    Have a look https://cirw.in/blog/bracketed-paste

--------------------------------------------------------------------------------

On 2016-05-12T08:24:42Z, x8x, commented:
<https://github.com/red/red/issues/1164#issuecomment-218691706>

    Please reopen this one. 8-)

--------------------------------------------------------------------------------

On 2016-06-16T11:12:27Z, dockimbel, commented:
<https://github.com/red/red/issues/1164#issuecomment-226456167>

    @qtxie We can try that proposed solution, though it works probably only on Unix terminals, not in Windows DOS console.

--------------------------------------------------------------------------------

On 2016-06-16T19:18:54Z, x8x, commented:
<https://github.com/red/red/issues/1164#issuecomment-226586061>

    👍 

