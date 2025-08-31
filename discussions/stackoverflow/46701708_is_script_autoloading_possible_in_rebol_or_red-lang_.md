# is script autoloading possible in rebol or red-lang?

**Link:**
<https://stackoverflow.com/questions/46701708/is-script-autoloading-possible-in-rebol-or-red-lang>

**Asked:** 2017-10-12 04:58:26 UTC

------------------------------------------------------------------------

Is there a way to do so ? I searched Google but couldn\'t find any
answer, so I guess the answer would be no. Is there anything close ? If
not, would it be easy to extend red-lang to do so ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by sqlab

From
[http://www.rebol.com/docs/setup.html](http://www.rebol.com/docs/setup.html){rel="nofollow noreferrer"}

    Startup Scripts

When REBOL starts it will automatically run the rebol.r and user.r
files, if they exist.

The system looks for these files first in the current directory (or the
directory of the script being run), then in the directory that contains
the REBOL executable program.

Note that REBOL/Core runs fine without the rebol.r and user.r files.
They simply provide an easy way to include additional code and data on
startup, such as your network preferences.

------------------------------------------------------------------------

If you compile your own Red interpreter you can add an autoloading file,
maybe in **console.red** after **system/console/init \"Red Console\"**
and before **system/console/launch** Best advice is to ask on the
[https://gitter.im/red/help](https://gitter.im/red/help){rel="nofollow noreferrer"}
site to ask for help. I guess this was already discussed.

*Comment by user310291:* I\'m using rebolview and created user.r with
rebol\[\] print \"test\" it doesn\'t seem to load it at startup. Same
with rebol.r ?

*Comment by sqlab:* If I remember right, you do not have to create
yourself by hand. Create it with the desktop and the user settings.
Search for user.r in your path.

*Comment by user310291:* ok thanks, using desktop, he created user.r in
AppData\\Roaming\\rebol not in local folder where rebolview is. I would
prefer he uses local folder instead though.

*Comment by sqlab:* Either the later versions of rebolview had some
problems with the home directories or this are some issues with modern
Windows versions

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* Anything is possible with `do` :p what exactly do
you mean with script autoloading?

*Comment by Geeky I:* Startup scripts are already there in all rebol
versions, and you can very easily create your own shortcut for red.
Unless you meant something else

*Comment by Geeky I:* Alternatively, did you mean something like
live-coding?
[github.com/red/code/blob/master/Showcase/livecode.red](https://github.com/red/code/blob/master/Showcase/livecode.red){rel="nofollow noreferrer"}

*Comment by HostileFork says dont trust SE:* If you are interested in
the [userspace console
code](https://github.com/metaeducation/ren-c/blob/e6cab210d6355f50b36fe6e15acc1f5859a95c30/src/os/host-console.r#L256){rel="nofollow noreferrer"}
from the active development branch of open source Rebol3 (\"Ren-C\"),
see [start-up
scripts](https://github.com/r3n/reboldocs/wiki/User-and-Console#start-up-scripts){rel="nofollow noreferrer"}.
The idea is that the console itself is implemented in Rebol. If you have
questions, [ask in chat](https://chat.stackoverflow.com/rooms/291/rebol)
