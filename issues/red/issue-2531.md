
#2531: [wish] Add command-line string execution
================================================================================
Issue is closed, was reported by maximvl and has 4 comment(s).
[type.wish]
<https://github.com/red/red/issues/2531>

This will make it easier to run Red inside shell scripts and integrate into other systems, something like
`red -e "print 5 + 5"`


Comments:
--------------------------------------------------------------------------------

On 2018-01-23T04:02:56Z, sh4r1k7, commented:
<https://github.com/red/red/issues/2531#issuecomment-359669855>

    +1
    
    This is my first foray into Red but digging around a bit I found some success - and perhaps even a bug!
    
    First, you can do it via piping: `echo 'print [ 3 * 3 ] quit' | red`
    
    ```
    --== Red 0.6.3 ==--
    Type HELP for starting information.
    
    9
    ```
    
    ...but:
    a) you must always append `quit` to exit the console prompt
    b) it's kinda slow to startup due to loading the console I guess
    c) it always prints the preamble so is not shell script friendly
    
    Then I wrote a super trivial `rede` script which mostly works (minimal testing).
    
    ```
    Red [ Title: "Eval commandline args" ]
    do load system/script/args
    ```
    
    Apart from having to wrap certain commands in quotes to prevent the shell from getting in the way:
    ```
    rede print [ 3 * 3 ] # shell expansion - although can be useful of course
    rede print 'moo # shell parser fail - unmatched quotes
    ```
    
    ...other simple tests work without a hitch:
    ```
    rede print 23
    rede print [ 3 ]
    rede print request-dir
    rede "print [ 3 * 3 ]"
    rede "print 'moo"
    rede print read %rede.red
    ```
    
    ...except this one bug(?) when compiled:
    ```
    rede list-dir %. 
    *** Script Error: path none is not valid for none! type
    *** Where: eval-path
    *** Stack: list-dir
    
    red rede.red list-dir %. # works
    ```

--------------------------------------------------------------------------------

On 2018-04-25T05:09:59Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2531#issuecomment-384162363>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

