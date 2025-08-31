
#2163: "Internal error: stack overflow" when parsing big string data
================================================================================
Issue is closed, was reported by Zamlox and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2163>

Using xml parser from https://github.com/Zamlox/red-tools/blob/master/xml/xml.red on file http://filebin.ca/2qrYaePtAywP/test.xml will give following error:

```
*** Internal Error: stack overflow
*** Where: copy
```

Sequence to reproduce:

```
content: read %test.xml
probe xml/to-block content
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-08T15:05:31Z, dockimbel, commented:
<https://github.com/red/red/issues/2163#issuecomment-238266554>

    Some parens expressions in Parse are leaking values on the Red stack, causing a stack overflow once enough values stack up.

--------------------------------------------------------------------------------

On 2016-08-08T19:25:54Z, Zamlox, commented:
<https://github.com/red/red/issues/2163#issuecomment-238348378>

    Thank you for the fix ;)

--------------------------------------------------------------------------------

On 2016-08-09T01:36:13Z, dockimbel, commented:
<https://github.com/red/red/issues/2163#issuecomment-238429057>

    Thank you for reporting it, it's an old issue I forgot to fix. ;-)

