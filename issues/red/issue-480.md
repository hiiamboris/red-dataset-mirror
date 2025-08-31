
#480: Argument-handling not consistent over platforms
================================================================================
Issue is closed, was reported by memophen and has 18 comment(s).
[status.built] [status.tested] [type.review] [Red/System]
<https://github.com/red/red/issues/480>

Red/System handles arguments on Windows differently from MacOS (and presumably Linux). On MacOS, everything delimited by _single_ or _double_ quotes is taken as one single argument, and the quotes themselves are not copied to the ITEM field of the SYSTEM/ARG-LIST. On Windows however, only substrings delimited by _double_ quotes are interpreted as one argument, and the quotes are preserved; single quotes have no special meaning. I doubt if the preservation of quotes is a good idea for Red/System, albeit in line with the behavior of batch files (and maybe also exactly what Windows programmers expect). There are (at least) two acceptable options for getting more consistency over the platforms:
- Respect the local tradition, and don't regard single quotes as delimiters. But drop the double quotes after the intake. This is how Perl behaves on Windows.
- Try to impose more civilization on Windows and treat single quotes similar to double quotes. And drop the quotes afterwards. This is the Ruby way.

Perl or Ruby? It's is a real dilemma. Personally I slightly prefer the Perl approach here. DOS and bash are very different shells, after all. Quotes are not the only thing to worry about. How to handle backslashes as escape character? (Perl and Ruby only allow double quotes to be escaped this way. REBOL and Windows use the caret as escape character, but Windows doesn't apply it consistently.)

This brings me to introducing an amendment to the Red/System constitution: Every programmer has the right to parse the command line as he chooses. Therefore the command line must be easily accessible.



Comments:
--------------------------------------------------------------------------------

On 2013-05-19T13:12:05Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/480#issuecomment-18117420>

    Good point, and nice analysis.

--------------------------------------------------------------------------------

On 2013-05-20T10:31:21Z, memophen, commented:
<https://github.com/red/red/issues/480#issuecomment-18141086>

    Double quotes can be escaped by doubling them in the Windows command line. I did some tests this morning with two arguments:
    - Batch file and Red/System: `"""abc""" """ def """` => `"""abc"""` + `""" def """`
    - Perl: `"""abc""" """ def """` => `"abc"` + `"` + `def` + `"` (I had hoped for `"abc"` + `" def "`)
    - Ruby: `"""abc""" """ def """` => `abc` + `def` (with the spaces around `def` preserved)
    
    Simply dropping _all_ double quotes is not the way to go. Perl seems to do it right at the first argument, but makes a poor show at the second. Ruby behaves as it would have done when invoked from bash.

--------------------------------------------------------------------------------

On 2013-05-20T10:31:57Z, memophen, commented:
<https://github.com/red/red/issues/480#issuecomment-18141108>

    Sorry, pressed a wrong button. And too soon too. Saying "dropping all double quotes is not the way to go" might give the impression I disqualify Ruby. I think Ruby is correct, since it also supports single quoting, making it possible to get double quotes through. But if Red/System supports just double quoting, it should support the Windows escape mechanism as well, IMO.

--------------------------------------------------------------------------------

On 2013-05-20T15:25:06Z, dockimbel, commented:
<https://github.com/red/red/issues/480#issuecomment-18153443>

    Thanks for the nicely documented report.

--------------------------------------------------------------------------------

On 2013-05-20T23:47:19Z, earl, commented:
<https://github.com/red/red/issues/480#issuecomment-18180956>

    Three further references, without comments (for now):
    - [Environment.GetCommandLineArgs](http://msdn.microsoft.com/en-us/library/system.environment.getcommandlineargs.aspx)
    - [CommandLineToArgvW](http://msdn.microsoft.com/en-us/library/windows/desktop/bb776391.aspx)
    - [GetCommandLineW](http://msdn.microsoft.com/en-us/library/windows/desktop/ms683156.aspx)

--------------------------------------------------------------------------------

On 2013-05-21T08:40:42Z, dockimbel, commented:
<https://github.com/red/red/issues/480#issuecomment-18195953>

    Earl, good point, we need to switch to Unicode versions if we are running it from Red.

--------------------------------------------------------------------------------

On 2013-08-28T20:57:57Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/480#issuecomment-23447077>

    I implemented a limited solution in my extra bindings. It doesn't consider Unicode and only deals with stripping excess double quotes on Windows.
    
    The Red/System version is here at the end of ANSI.reds:
    
    http://red.esperconsultancy.nl/Red-C-library/dir?ci=tip
    
    The Red version is here in common.red:
    
    http://red.esperconsultancy.nl/Red-common/dir?ci=tip

--------------------------------------------------------------------------------

On 2014-05-10T09:22:16Z, memophen, commented:
<https://github.com/red/red/issues/480#issuecomment-42737013>

    Hi Kaj,
    
    Omdat ik negen maanden de andere kant op gekeken heb, was dit me even ontgaan. Maar ik kan Red(s) niet uit mijn hoofd zetten, dus ik zal er wel weer mee aan de slag gaan. Moet ik wel weer even opnieuw REBOL, Red en Red/System leren. En C (vond ik doorgrondelijker dan Red/System). En lezen wat er intussen zoal gebeurd en beweerd is.
    
    Het meeste zie ik op tegen het fenomeen multi-byte encoding. Een verrijking voor de mensheid, maar ook een hele zorg voor de programmeurs.
    
    Met vriendelijke groet,
    Memophenon.
    
    Op 28 aug 2013, om 22:58 heeft Kaj-de-Vos het volgende geschreven:
    
    > I implemented a limited solution in my extra bindings. It doesn't consider Unicode and only deals with stripping excess double quotes on Windows.
    > 
    > The Red/System version is here at the end of ANSI.reds:
    > 
    > http://red.esperconsultancy.nl/Red-C-library/dir?ci=tip
    > 
    > The Red version is here in common.red:
    > 
    > http://red.esperconsultancy.nl/Red-common/dir?ci=tip
    > 
    > —
    > Reply to this email directly or view it on GitHub.

--------------------------------------------------------------------------------

On 2017-03-07T10:52:56Z, dockimbel, commented:
<https://github.com/red/red/issues/480#issuecomment-284688380>

    Now Red/System behaves in a more standard way (relying on `CommandLineToArgvW` and
    `GetCommandLineW`), supporting Unicode characters (encoded in UTF-8 on all platforms) and providing a parsed arguments list similar to C/Perl:
    ```
    C:\Dev\Red>test-args """abc""" """ def """
    count: 5
    1: test-logic2
    2: "abc"
    3: "
    4: def
    5: "
    ```

