
#1055: ROUTINE cannot be put inside a context.
================================================================================
Issue is closed, was reported by JerryTsai and has 22 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1055>

After compile the following code:

``` Red
Red [
]

my-context: context [
    do-something: routine [ 
        num     [integer!] 
        return: [integer!]
        /local
        ret
    ] [
        ret: num + 1
        ret
    ]
]

print my-context/do-something 1
```

I got this:

``` Red
*** Red Compiler Internal Error: Script Error : process-routine-calls expected obj argument of type: object 
*** Where: comp-routine 
*** Near:  [process-routine-calls body ctx/1 spec select] 
```



Comments:
--------------------------------------------------------------------------------

On 2015-03-12T16:54:43Z, dockimbel, commented:
<https://github.com/red/red/issues/1055#issuecomment-78525873>

    Routines are not yet fully supported in objects, but that code example should have worked fine, so it deserved a fix.
    
    Dynamic calls with routines in objects don't work yet, for example the following code pattern is not supported yet:
    
    ```
    foo: func [o [object!]][
        o/do-something 1
    ]
    ```

--------------------------------------------------------------------------------

On 2018-12-04T18:31:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/1055#issuecomment-444206962>

    This reports `1` when compiled with `-c`/`-r` but reports an error with `-e` added or in the interpreter itself:
    ```
    *** Script Error: cannot access do-something in path my-context/do-something
    *** Where: print
    *** Stack:
    ```

--------------------------------------------------------------------------------

On 2018-12-05T00:35:54Z, greggirwin, commented:
<https://github.com/red/red/issues/1055#issuecomment-444313056>

    @hiiamboris this seems a wider issue, which would affect any code that prevents routines from being compiled. May be something we just need to doc as a limitation. If the compiler can catch these and give helpful error messages, that would be great, but doesn't seem like a high priority. Good tooling and code analysis exercise though.

--------------------------------------------------------------------------------

On 2018-12-05T09:47:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/1055#issuecomment-444423780>

    @greggirwin I would agree if it was a compiler limitation. This time it is an _interpreter limitation_, while compiler does just fine. Priority or not, if it's unsolved it should be open. No?

--------------------------------------------------------------------------------

On 2018-12-05T17:50:51Z, greggirwin, commented:
<https://github.com/red/red/issues/1055#issuecomment-444578876>

    How can it be solved? Routines have to be compiled, so the interpreter can never handle them. All it can do is provide a nicer error message.

--------------------------------------------------------------------------------

On 2018-12-05T18:24:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/1055#issuecomment-444589962>

    @greggirwin There may be a little misunderstanding here. Indeed it cannot work in the interpreter itself. However it should work in the encapping mode. Why not? I can't really say if it's the compiler who doesn't properly detect routines inside a context, or if it's the interpreter who can't properly call these routines.
    
    But my line of thinking is this. `-e` option is described in the help message as "... Avoids compiler issues. Required for some dynamic code." If I get things right, `-c` may fail sometimes, but `-e` should never. In this scenario it's the opposite. `-c` works, but `-e` doesn't.

--------------------------------------------------------------------------------

On 2018-12-05T18:37:03Z, greggirwin, commented:
<https://github.com/red/red/issues/1055#issuecomment-444594239>

    Thanks for clarifying. What needs to be improved is the description for encapping. In encap mode, *no* user code should be compiled, so you encap is incompatible with R/S in any form.

--------------------------------------------------------------------------------

On 2018-12-05T18:49:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/1055#issuecomment-444598304>

    You sure? So far encapping always worked for me. Compiled the R/S stuff I mean. Except this one case.

--------------------------------------------------------------------------------

On 2018-12-05T19:16:06Z, greggirwin, commented:
<https://github.com/red/red/issues/1055#issuecomment-444607586>

    I could be wrong. There are checks for `routine` and for straight R/S files, so this is likely a compiler limitation, as you suggest. See `encap-preprocess` in %compiler.r.

--------------------------------------------------------------------------------

On 2019-05-09T19:22:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/1055#issuecomment-491033186>

    It's up to @dockimbel to sort this out, but I'm going to leave some more specific info.
    
    In encapping mode the compiled object (even if the word `object` is used instead of `context`) does not contain the routines (I've added the `?? my-context` line to the original snippet before `print`):
    ```
    root size: 2172, root max: 4142, cycles: 0
    root size: 2172, root max: 4142, cycles: 1
    root size: 2172, root max: 4142, cycles: 2
    my-context: make object! []         ;)  <-- note this is empty
    
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/datatypes/object.reds
    *** at line: 97
    ***
    ***   stack: red/object/rs-select 02ACD364h 038DDBC8h
    ***   stack: red/error/reduce 02ACD384h 02ACD364h
    ***   stack: red/error/form 02ACD364h 02ACD374h 02ACD354h -18
    ***   stack: red/actions/form 02ACD364h 02ACD374h 02ACD354h 0
    ***   stack: red/actions/form* -1
    ***   stack: red/natives/prin* false
    ***   stack: red/natives/print* false
    ***   stack: red/stack/throw-error 02ACD394h
    ***   stack: red/fire 0 0018FCC4h
    ***   stack: red/object/eval-path 02BD2E34h 02C7C634h 00000000h 02C7C5CCh false
    ***   stack: red/actions/eval-path 02BD2E34h 02C7C634h 00000000h 02C7C5CCh false
    ***   stack: red/interpreter/eval-path 02C7C634h 02C7C5DCh 02C7C5ECh false false true false
    ***   stack: red/interpreter/eval-expression 02C7C5DCh 02C7C5ECh false true false
    ***   stack: red/interpreter/eval-arguments 02BD0494h 02C7C5CCh 02C7C5ECh 00000000h 00000000h
    ***   stack: red/interpreter/eval-code 02BD0494h 02C7C5CCh 02C7C5ECh false 00000000h 00000000h 02BD0494h
    ***   stack: red/interpreter/eval-expression 02C7C5CCh 02C7C5ECh false false false
    ***   stack: red/interpreter/eval 02ACD364h true
    ***   stack: red/natives/do* true -1 -1 -1
    ```
    The output shows that the error happens when `object/eval-path` is called with a word that the object does not contain, so it `fire`s: https://github.com/red/red/blob/8d712e4ba1b16e1b7a339006d1154aebc9cb7ce4/runtime/datatypes/object.reds#L1158
    
    The routine itself is bound to the system/words, as it works (in `-e` mode only) if the last line is replaced by `print do-something 1` (removing the context name prefix)

--------------------------------------------------------------------------------

On 2019-08-15T11:45:17Z, dockimbel, commented:
<https://github.com/red/red/issues/1055#issuecomment-521613780>

    Encapped mode does not compile Red code, therefore the compiler cannot identify Red "contexts". Routines can be compiled in Encapped mode only if they are in the global space and not nested, as contexts cannot be identified in such mode.

