
#1936: Passing a function to another function causes compiler error
================================================================================
Issue is open, was reported by philipyi and has 8 comment(s).
[status.deferred] [type.review] [type.compiler]
<https://github.com/red/red/issues/1936>

The following code works as expected in the console but causes compiler error
**\* Script error: hello has no value
**\* Where: say
**\* Stack: greet say
```
Red []
greetings: object [
    hello: func [thing [string!]][print ["Hello" thing]]
    goodbye: func [thing [string!]][print ["Goodbye" thing]]
    say: func [f [function!] thing [string!]][f thing]
]
test: object [
    greeting: :greetings/hello 
    greet: func [who [string!]][greetings/say :greeting who]
]
test/greet "World"
```


Comments:
--------------------------------------------------------------------------------

On 2016-05-26T08:41:06Z, dockimbel, commented:
<https://github.com/red/red/issues/1936#issuecomment-221811859>

    The compiler does not yet support this `greeting: :greetings/hello` form of function definition. As I said in #1934, support for functional style of programming is currently limited in the compiler. This will be improved later, once we pass v0.8.0.

--------------------------------------------------------------------------------

On 2016-05-26T13:16:05Z, philipyi, commented:
<https://github.com/red/red/issues/1936#issuecomment-221867289>

    Thanks for clarifying the situation ! I really appreciate it.

--------------------------------------------------------------------------------

On 2020-07-17T15:34:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/1936#issuecomment-660173842>

    In the current builds there's no error. Just `[f thing]` doesn't call `f` and simply returns `thing`.

--------------------------------------------------------------------------------

On 2021-09-19T18:43:25Z, dockimbel, commented:
<https://github.com/red/red/issues/1936#issuecomment-922518269>

    Same class of compilation errors as usual, the compiler cannot recognize dynamic function calls.

