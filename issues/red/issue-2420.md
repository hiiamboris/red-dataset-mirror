
#2420: In tab-panel, on-change event reports face/selected BEFORE change
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [type.documentation]
<https://github.com/red/red/issues/2420>

This occurs both with on-change and with on-select and it impedes handling multiple tabs correctly.


Comments:
--------------------------------------------------------------------------------

On 2017-01-23T08:43:41Z, meijeru, commented:
<https://github.com/red/red/issues/2420#issuecomment-274429126>

    By analogy with text-list, there could be made a difference between on-change and on-select. That way no information is lost.

--------------------------------------------------------------------------------

On 2017-01-28T16:00:24Z, meijeru, commented:
<https://github.com/red/red/issues/2420#issuecomment-275856247>

    I also tried event/picked, but that seems to yield more or less random numbers.

--------------------------------------------------------------------------------

On 2017-02-12T11:37:16Z, dockimbel, commented:
<https://github.com/red/red/issues/2420#issuecomment-279212548>

    `on-select` should be working for tab-panels... Trying with this test script:
    ```
    view [
        tab-panel ["one" [] "two" []]
            on-select [print ["on-select:" face/selected event/picked]]
            on-change [print ["on-change:" face/selected event/picked]]
    ]
    ```
    Clicking alternatively on the tabs gives me:
    ```
    on-select: 1 2
    on-change: 1 2
    on-select: 2 3
    on-change: 2 1
    on-select: 1 2
    on-change: 1 2
    on-select: 2 3
    on-change: 2 1
    on-select: 1 2
    on-change: 1 2
    on-select: 2 3
    on-change: 2 1
    ```
    which show that `on-select` is not giving the right values.

--------------------------------------------------------------------------------

On 2017-02-13T08:21:52Z, dockimbel, commented:
<https://github.com/red/red/issues/2420#issuecomment-279321181>

    After some tests, `on-select` would not be useful there (Windows OS does not provide any information for such event), `on-change` is enough anyway.
    
    So to answer your query, in `on-change`, the `face/selected` property contains the previously selected tab index, while `event/picked` contains the new one (and it's not random, as you can see from the test above). I will add that missing information to the documentation for `tab-panel`.

