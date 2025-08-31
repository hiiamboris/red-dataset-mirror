
#504: Macro identifier is not processed in paths
================================================================================
Issue is closed, was reported by iArnold and has 14 comment(s).
[status.built] [status.tested] [type.wish] [Red/System] [test.written]
<https://github.com/red/red/issues/504>

# define MAX-SIZE 100

my-array: as int-ptr! allocate MAX-SIZE \* size? integer!
then using  
my-array/MAX-SIZE 
gives a compilation error??
**\* Compilation Error: undefined pointer index variable



Comments:
--------------------------------------------------------------------------------

On 2013-08-03T14:30:25Z, dockimbel, commented:
<https://github.com/red/red/issues/504#issuecomment-22055714>

    At first look, it seems too costly to support, it would require some deep changes in the preprocessor. A simple workaround I tried makes PARSE explode with a _Internal limit reached: parse_ error.

--------------------------------------------------------------------------------

On 2013-08-03T18:47:55Z, iArnold, commented:
<https://github.com/red/red/issues/504#issuecomment-22059551>

    The workaround I have used in this specific case is to just put in the defined value in as if the macro had been processed by the programmer instead of the preprocessor. 
    A second workaround is the one I had earlier and was suggested by Kaj, to use a variable you assign the macro value to and use that instead.
    I have not yet tried to use a solution like my-array/(MAX-SIZE) so put in inside ().
    No success, tried (MAX-SIZE), ( MAX-SIZE ), ( :MAX-SIZE ), no append, join other trick is around afaict.

--------------------------------------------------------------------------------

On 2014-03-19T19:13:08Z, dockimbel, commented:
<https://github.com/red/red/issues/504#issuecomment-38094259>

    The feature has been pushed in a separate `wish-504` branch in order to be tested on all systems before merging it in master.

--------------------------------------------------------------------------------

On 2014-03-19T19:46:47Z, iArnold, commented:
<https://github.com/red/red/issues/504#issuecomment-38098114>

    On my MacOSX this now works. 
    Compilation ok and referencing is correct.
    Thank you!
    (Need a win32 testing too?) I can squeeze one in tomorrow during lunchbreak.

--------------------------------------------------------------------------------

On 2014-03-20T09:51:28Z, iArnold, commented:
<https://github.com/red/red/issues/504#issuecomment-38149566>

    Tested on win and it works.
    All tests are passing on windows.
    Will run the testsuit for mac this evening.

--------------------------------------------------------------------------------

On 2014-03-20T09:59:29Z, iArnold, commented:
<https://github.com/red/red/issues/504#issuecomment-38150247>

    (Windows
    ok - Complete Red Test Suite......................20062 / 20062
           in 0:17:17.873
    )

--------------------------------------------------------------------------------

On 2014-03-20T20:19:40Z, iArnold, commented:
<https://github.com/red/red/issues/504#issuecomment-38216084>

    ok in MacOSX all Red and Red/System test passed 
    ok - Complete Red Test Suite......................20061 / 20061
           in 0:27:42.596114 

