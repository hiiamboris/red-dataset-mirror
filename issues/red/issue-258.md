
#258: Checking for double #include doesn't take path into account
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/258>

```
#include %../common/common.reds
#include %common.reds
```

The second file won't be included.



Comments:
--------------------------------------------------------------------------------

On 2012-09-26T22:18:26Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/258#issuecomment-8908508>

    This doesn't seem to be fixed yet. In dyn-lib-emitter, the test case still doesn't work.

--------------------------------------------------------------------------------

On 2012-09-27T00:47:40Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/258#issuecomment-8914996>

    I fixed it. It was a confusing way the #include path works, only tangentially related to this.

