
#646: First FOREACH crashes on empty workload
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 18 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/646>

-=== Red Console alpha version ===-
(only ASCII input supported)

red>> foreach x [] []

**\* Script error: action 6 not defined for type: 0

-=== Red Console alpha version ===-
(only ASCII input supported)

red>> foreach x [1] []
red>> foreach x [] []
red>>



Comments:
--------------------------------------------------------------------------------

On 2014-01-08T14:40:06Z, qtxie, commented:
<https://github.com/red/red/issues/646#issuecomment-31837188>

    On Windows no crash:
    
    ```
    red>> foreach x [] []
    == #"^/"
    ```

--------------------------------------------------------------------------------

On 2014-01-08T15:05:33Z, meijeru, commented:
<https://github.com/red/red/issues/646#issuecomment-31840291>

    On my Windows the result is 2 ! This would seem to indicate an arbitrary result (bad stack addressing?).

--------------------------------------------------------------------------------

On 2014-01-09T01:11:47Z, qtxie, commented:
<https://github.com/red/red/issues/646#issuecomment-31893895>

    @meijeru I think the version which you used is v0.4.1. The automated build version seems no this issue.

--------------------------------------------------------------------------------

On 2014-01-09T01:51:32Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/646#issuecomment-31895944>

    I tested with the latest or almost latest Red source, on Linux.

--------------------------------------------------------------------------------

On 2014-01-10T12:19:00Z, iArnold, commented:
<https://github.com/red/red/issues/646#issuecomment-32023074>

    Nice to have would be the version mentioned in or after/under the header 
    -=== Red Console alpha version ===-
    And a mention of the OS version too.

--------------------------------------------------------------------------------

On 2014-01-13T01:16:03Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/646#issuecomment-32140476>

    You can do ABOUT for that in my console versions.

--------------------------------------------------------------------------------

On 2014-01-13T07:19:13Z, iArnold, commented:
<https://github.com/red/red/issues/646#issuecomment-32149222>

    Good to know. Such useful features should be brought to the mainline imho.

--------------------------------------------------------------------------------

On 2014-02-07T11:31:39Z, dockimbel, commented:
<https://github.com/red/red/issues/646#issuecomment-34428521>

    @iArnold you can type `system/version` in console to get the version and build date.

--------------------------------------------------------------------------------

On 2014-02-07T13:29:49Z, dockimbel, commented:
<https://github.com/red/red/issues/646#issuecomment-34436267>

    I cannot reproduce the crash on Linux (Ubuntu 12.04) using the latest version from `master` branch.
    
    I made a simple fix to ensure that the last value returned is preset to `unset` instead of arbitrary value from stack.

