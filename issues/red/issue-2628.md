
#2628: In making an error based on the integer code, the error number seems off by 2
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2628>

`make error! <integer>` indexes `system/catalog/errors` as follows: the integer value divided by 100 gives a 0-origin index in the fields of `system/catalog/errors` (`0 = throw`, `1 = note` etc.), and the value modulo 100 gives an index in the fields of the sub-object (`system/catalog/errors/throw` etc). However, every such sub-object has two fixed fields `code` and `type`, and  these are counted for the 0-origin index. Thus `make error! 503` is the _second_ error in group `500`, whereas one would think it should be nr. `501`.


Comments:
--------------------------------------------------------------------------------

On 2017-04-26T06:59:00Z, meijeru, commented:
<https://github.com/red/red/issues/2628#issuecomment-297258118>

    Related: when the system produces an error, the code is not filled in.
    ```
    >> probe try [1 / 0]
    make error! [
        code: none            ; should be 400 (or 402???)
        type: 'math
        id: 'zero-divide
        arg1: none
        arg2: none
        arg3: none
        near: none
        where: '/
        stack: 44467008
    ]```

--------------------------------------------------------------------------------

On 2017-05-25T15:45:02Z, meijeru, commented:
<https://github.com/red/red/issues/2628#issuecomment-304044323>

    Also related: `make error! <integer>`  when the integer value is a multiple of `100` crashes.

--------------------------------------------------------------------------------

On 2017-05-25T19:19:20Z, greggirwin, commented:
<https://github.com/red/red/issues/2628#issuecomment-304099176>

    Up to 700 it seems. That's a funny one.

--------------------------------------------------------------------------------

On 2017-07-28T13:00:26Z, dockimbel, commented:
<https://github.com/red/red/issues/2628#issuecomment-318645502>

    All the above issues should be fixed now.

