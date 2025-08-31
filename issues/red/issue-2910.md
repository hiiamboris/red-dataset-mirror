
#2910: returned value from function defined in context differs during compiled app execution
================================================================================
Issue is closed, was reported by 9214 and has 10 comment(s).
[status.resolved] [type.compiler]
<https://github.com/red/red/issues/2910>

Another tricky bug which boils down to something like this:
```Red
my-ctx: context [
    my-other-ctx: context [
        f: func [c][
            object [x: 100 * c y: 100 / c]
        ]
    ]

    foo: func [c][my-other-ctx/f c]
]

probe my-ctx/foo 3

view []
```
`my-ctx/foo <arg>` should always return `object!` and that's exactly what happening in interpreter:
```Red
make object! [
    x: 300
    y: 33
]
```
But If I'll compile this script and launch app, `my-ctx/foo 3` for some reason returns `3`.

Another example which is more similar to my original situation:
```Red
with: func [
    contexts [block!]
    body     [block!]
][  
    forall contexts [bind body reduce first contexts]
]

my-ctx*: context [
    my-other-ctx: context [
        f: func [c][
            object [x: 100 * c y: 100 / c]
        ]
    ]

    some-other-ctx: context [field: 'whatever] ;<-- if I'll comment out this line compiled app will silently crash

    foo-body: with [some-other-ctx][my-other-ctx/f c]
    foo: func [c] foo-body
]

probe my-ctx*/foo 3

view []
```
Again, in interpreter it's good ol' `object!`, but once compiled probe returns
```Red
func [c][some-other-ctx]
```
Alternatively, if I wrap up `my-ctx*/foo 3` call inside `view` block like this:
```Red
view [do [probe my-ctx*/foo 3]]
```
I'll get `object!` in interpreter (as usual), and, uhm, `object!` in compiler, but not the one I expected
```Red
make object! [
    field: 'whatever
]
```
Further if I want to access, say, `x` field of returned` object!` I'll get an error, since there's no `x` field! (because it's not *that* object) :worried:


Comments:
--------------------------------------------------------------------------------

On 2017-07-25T11:34:30Z, 9214, commented:
<https://github.com/red/red/issues/2910#issuecomment-317710495>

    I'm not sure if `context` has something to do with it, because I've caught similar bug in a script with functions only (though there were *a lot* of sophisticated and interleaved function calls).

--------------------------------------------------------------------------------

On 2017-07-25T11:48:43Z, geekyi, commented:
<https://github.com/red/red/issues/2910#issuecomment-317713305>

    Is https://github.com/red/red/issues/2542 related? I ask because`context`s are used there too.
    
    Then again, *function* also create context when you think about it

--------------------------------------------------------------------------------

On 2017-07-25T11:55:11Z, 9214, commented:
<https://github.com/red/red/issues/2910#issuecomment-317714780>

    Perhaps, though I didn't used nested functions anythere, only functions wrapped inside contexts for modularity.

--------------------------------------------------------------------------------

On 2017-07-25T12:21:44Z, dockimbel, commented:
<https://github.com/red/red/issues/2910#issuecomment-317720511>

    @9214 At this line: 
    ```
    foo-body: with [some-other-ctx][my-other-ctx/f c]
    ```
    The two blocks are seen as *data* by the compiler, there is no way it can guess that the second one is evaluated. So in order for that to work with the compiler, you need to replace it with:
    ```
    foo-body: with [some-other-ctx][do [my-other-ctx/f c]]
    ```
    
    We have a general solution for this class of compiler limitations, that will require a re-design of the Red internal stack. The work on that is in the `dyn-stack` branch, but it's stalled since a while as we have many other higher priority tasks...

--------------------------------------------------------------------------------

On 2017-07-25T12:24:01Z, 9214, commented:
<https://github.com/red/red/issues/2910#issuecomment-317721002>

    Wrapping code inside `do` or `do/expand` fixed everything.

