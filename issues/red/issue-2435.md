
#2435: help object! needs to be formatted for readable output.
================================================================================
Issue is closed, was reported by gltewalt and has 16 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2435>

`help` needs to specifically format the output for object! to show object-name => description, or object-name and attributes => description.
Currently `help object!` appears to emit the source for all objects in the global context.


Comments:
--------------------------------------------------------------------------------

On 2017-02-27T01:37:09Z, gltewalt, commented:
<https://github.com/red/red/issues/2435#issuecomment-282607889>

    Line 87 can be changed to:
    `print-out out [tab pad form :w 15 ": " mold words-of get/any w]`
    
    `help object!`
    
    ```
    ed>> help object!
         deep-reactor!   :  [on-change* on-deep-change*] 
         preprocessor    :  [exec protos macros stack syms depth active? trace? s do-quit throw-error syntax-error do-safe do-code count-args func-arity? fetch-next eval do-macro register-macro reset expand] 
         reactor!        :  [on-change*] 
         System          :  [version build words platform catalog state modules codecs schemes ports locale options script standard lexer console view reactivity] 
         system          :  [version build words platform catalog state modules codecs schemes ports locale options script standard lexer console view reactivity] 
    object! is a datatype! of value: object! 
    ```
    
    `help system` emits:
    
    ```
    red>> help system
    `system` is an object! of value:
         version          string!   0.6.1 
         build            object!   [date config] 
         words            object!   [datatype! unset! none! logic! block! paren!... 
         platform         function! Return a word identifying the operating system 
         catalog          object!   [datatypes actions natives errors] 
         state            object!   [interpreted? last-error trace?] 
         modules          block!    [] 
         codecs           map!      #(png: make object! [title: "" name: 'PNG mi... 
         schemes          object!   [] 
         ports            object!   [] 
         locale           object!   [language language* locale locale* months da... 
         options          object!   [boot home path script args do-arg debug sec... 
         script           object!   [title header parent path args] 
         standard         object!   [header error] 
         lexer            object!   [throw-error make-hm make-msf make-hms make-... 
         console          object!   [prompt history limit catch? count ws gui? r... 
         view             none!     none 
         reactivity       object!   [relations stack queue debug? do-safe eval-r... 
    ```
    
    Although, the results are then truncated with "..." by Lines 209 through 211

--------------------------------------------------------------------------------

On 2017-02-27T10:10:30Z, dockimbel, commented:
<https://github.com/red/red/issues/2435#issuecomment-282679188>

    @gltewalt Feel free to submit a PR.

--------------------------------------------------------------------------------

On 2017-02-27T19:28:07Z, greggirwin, commented:
<https://github.com/red/red/issues/2435#issuecomment-282825111>

    The above change won't work, as it applies to all other types, which don't all support `reflect`. We could add a case at line ~85 to handle objects
    ```
    object? get/any w [
        print-out out [tab pad form :w 15 mold words-of get/any w]
    ]
    ```
    But maps also support words-of, which might be nice. And if we want it to optimize for 80-char width, as later code in help does (`emit` + ...), that should be a clear decision.

--------------------------------------------------------------------------------

On 2017-02-27T19:45:50Z, greggirwin, commented:
<https://github.com/red/red/issues/2435#issuecomment-282830738>

    ```
    any [object? get/any w  map? get/any w] [
        print-out out [tab pad form :w 15 mold words-of get/any w]
    ]
    ```

--------------------------------------------------------------------------------

On 2017-02-27T19:48:42Z, greggirwin, commented:
<https://github.com/red/red/issues/2435#issuecomment-282831617>

    Hmmm, the `tab*` vars are not /local in `fetch-help`, though others are. `Fucntion` is used, so they're still captured, but that means the `/local` line isn't needed at all. Worth cleaning up?

--------------------------------------------------------------------------------

On 2017-02-27T19:55:47Z, greggirwin, commented:
<https://github.com/red/red/issues/2435#issuecomment-282833630>

    Quick PR done for that /local bit. Seems worth it, since it confused me at a glance.

--------------------------------------------------------------------------------

On 2017-02-27T20:19:34Z, gltewalt, commented:
<https://github.com/red/red/issues/2435#issuecomment-282840719>

    Thanks, Gregg Irwin

--------------------------------------------------------------------------------

On 2017-03-01T10:57:24Z, dockimbel, commented:
<https://github.com/red/red/issues/2435#issuecomment-283309748>

    @gltewalt Congrats for your first PR and issue fixing! ;-)

