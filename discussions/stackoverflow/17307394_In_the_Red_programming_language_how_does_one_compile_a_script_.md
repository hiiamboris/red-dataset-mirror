# In the Red programming language, how does one compile a script?

**Link:**
<https://stackoverflow.com/questions/17307394/in-the-red-programming-language-how-does-one-compile-a-script>

**Asked:** 2013-06-25 20:57:56 UTC

------------------------------------------------------------------------

I\'ve compiled scripts in Red before, but once I\'ve been away from it
for a while, I forget. I thought I\'d ask the question here because I\'m
sure I\'m not the only one.

How does one compile a script in the Red programming language?

I\'ve searched my Red distribution folder in the \"Docs\" directory, and
also looked on
[http://red-lang.org](http://red-lang.org){rel="nofollow"}, but didn\'t
see the instructions. I know I\'ve seen it somewhere before, but I
can\'t seem to find it.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by Respectech

So basically, thanks to \@Blender, the information is available at
[https://github.com/dockimbel/Red](https://github.com/dockimbel/Red){rel="nofollow"}.

I knew I saw the information before, but I couldn\'t remember where. I
checked the \"Docs\" folder in the Red distribution, but that didn\'t
have the information there (might be handy to add it).

1.  Start the Rebol interpreter in the folder where the Red files and
    folders are stored.
2.  For Red: `>> do/args %red.r "%red/tests/console.red"`
3.  For Red/System: `do/args %rsc.r "%tests/hello.reds"`

See the link for more detailed instructions.

*Comment by Respectech:* FWIW: There is a readme.md file in the Red
distribution. If you\'re on Windows, the line breaks will not be
friendly, even if you figure out you can open it with Notepad or
similar. To view the readme.md file in a readable format on Windows, run
rebol.exe and type `>> editor %readme.md`.

*Comment by HostileFork says dont trust SE:* FYI: the \".md\" extension
means
[\"MarkDown\"](http://en.wikipedia.org/wiki/Markdown){rel="nofollow noreferrer"}
(e.g. this format we use to make `[hyperlinks](with brackets)`). We feel
your pain\...technology is a moving target\...so if you look for
README.TXT you won\'t find it these days!

*Comment by Pierre:* I\'m back in this world, sort of revenant mode.
Actually, I wanted to put a shebang at the top of my Red script, it
didn\'t work out; and I stumbled upon this hilarious exchange. Thanks
for the laugh. I\'m going to read a few READHIM.md: locate README.md \|
xargs less

------------------------------------------------------------------------

## Comments on question

*Comment by Blender:* Looks like the instructions are in the README:
[github.com/dockimbel/Red](https://github.com/dockimbel/Red){rel="nofollow noreferrer"}

*Comment by HostileFork says dont trust SE:* As \@Blender says\...
perhaps you should be more specific, because it compiles to a binary if
you follow the directions. :-/ Can you get the \"Hello Red\" program?
That would be a good start. You will need to do a Git Clone of the Red
repository and you will need to get a Rebol2 interpreter, but that
should be the only requirements on all platforms. *(I\'ve ported it to
Rebol3 but changes have not gotten upstream yet, due to politics and
such.)*
