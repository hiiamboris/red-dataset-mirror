
#561: same? broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/561>

red>> a: b: []
== []
red>> equal? a b
== true
red>> same? a b
== []
red>> same? a a
== []
red>> same? 0 1
== 0
red>> same? 0 0
== 0



Comments:
--------------------------------------------------------------------------------

On 2013-11-09T11:03:47Z, PeterWAWood, commented:
<https://github.com/red/red/issues/561#issuecomment-28124735>

    I realised that there were no same? and == tests so I've quickly created some based on the existing equal? and = tests.  Examples of the failing tests are:
    
    ```
    --assert not same? #"z" #"Z"
    --assert not same? #"e" #"è"
    --assert same? false false
    --assert not same? true false
    --assert same? none none
    ea-result: same? 1 1
    --assert ea-result = true
    --assert not same? #"0" 48
    ```

--------------------------------------------------------------------------------

On 2013-11-09T13:50:43Z, PeterWAWood, commented:
<https://github.com/red/red/issues/561#issuecomment-28127454>

    I mistakenly thought that same? was the prefix equivalent of == but having checked the REBOL docs now realise that it is not. I will separate the same? and == tests.

--------------------------------------------------------------------------------

On 2013-11-09T15:08:26Z, PeterWAWood, commented:
<https://github.com/red/red/issues/561#issuecomment-28129082>

    I've committed the separate same? and == tests (on the parse branch). There are a lot of negative tests for same? but insufficient positive tests. I will try to write some more over the next few days.

--------------------------------------------------------------------------------

On 2013-11-09T15:14:56Z, dockimbel, commented:
<https://github.com/red/red/issues/561#issuecomment-28129208>

    SAME? is not implemented yet, there is just a placeholder in %natives.reds file:
    
    ```
    same?*: does []
    ```

--------------------------------------------------------------------------------

On 2013-11-09T16:35:58Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/561#issuecomment-28130916>

    It would be better to not include unimplemented functionality. It's quite confusing this way.

