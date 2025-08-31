
#3621: Orphaned and failing replace-test.red test script
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
<https://github.com/red/red/issues/3621>

**Describe the bug**
1) There's a `replace-test.red` file in `tests/source/units/` that isn't mentioned in `all-tests.txt`
2) `replace/case-15` test inside fails when compiled (only)




Comments:
--------------------------------------------------------------------------------

On 2018-12-01T00:59:04Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3621#issuecomment-443384145>

    @hiiamboris 
    
    A little history.
    
    In the early days of Red, we didn't use git branches to develop new features. (We didn't have automated builds either). So we would write tests for features being added but didn't want them automatically included in the main "test suite". This is why have the `all-tests.txt` file instead of just running in the files in the `tests` directories. (I am mainly to blame for this as I would write the tests before Nenad had written the code.)
    
    In order to keep the CI tests passing, traditionally failing tests have been commented out.  I'm not really comfortable with this practice not just for obvious reasons but as the commented out tests get forgotten even when the code has been corrected. I periodic go through the tests to check the commented out ones but haven't found a practical process for handling them yet.
    
    Personally, I feel that as the project is expanding we need to upgrade our practices and in particular:
    1. Use the `master` branch only for the current "stable" release and have a git branch for each release.
    2. Stop commenting out failing tests.

--------------------------------------------------------------------------------

On 2018-12-01T01:02:32Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3621#issuecomment-443384559>

    It will probably be a long time before any changes to the way of working are made so I will add replace-test.red to all-tests.txt, comment out the failing test, and raise an issue for it.

--------------------------------------------------------------------------------

On 2018-12-01T01:38:35Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3621#issuecomment-443388180>

    #3624

--------------------------------------------------------------------------------

On 2018-12-01T08:28:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/3621#issuecomment-443409863>

    Thanks @PeterWAWood !

