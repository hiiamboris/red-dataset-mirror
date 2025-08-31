# Is it possible to write a Windows DLL in Red?

**Link:**
<https://stackoverflow.com/questions/20729173/is-it-possible-to-write-a-windows-dll-in-red>

**Asked:** 2013-12-22 12:01:08 UTC

------------------------------------------------------------------------

I\'d like to write a plugin for some Windows application, and it must be
a DLL. I\'d really love to try doing it in a mix of Red & Red/System.
But asking on Rebol&Red chatroom here on SO, I got mixed responses as to
whether it is currently possible in both Red and Red/System, or in
Red/System only. What\'s the definitive answer?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 9) --- by kealist

Yes, it is possible. You can check the announcement on the [Red-Blog for
0.3.3](http://www.red-lang.org/2013/08/033-released-shared-libraries-and.html){rel="noreferrer"}

First of all, here is a short snippet describing the process for
**Red/System**:

> Shared lib generation
>
> Since a year, we were working on bringing shared library generation,
> now it is available in the main branch. New features were added to
> support library generation like a way to declare the exported symbols
> and special callback functions when loading and freeing the library.
> Here is a simple example of a Red/System library:
>
>     Red/System [
>         File: %testlib.reds
>     ]
>
>     inc: func [n [integer!] return: [integer!]][n + 1] 
>
>     #export [inc]
>
> You compile such shared library using the new -dlib command-line
> option:
>
> > > do/args %rsc.r \"-dlib testlib.reds\"
>
> The output binary name will have a platform-specifc suffix (.dll, .so
> or .dylib).

Secondly, I was finally able to get a single simple **Red** script to
compile to a .dll. The
[`#export`](http://static.red-lang.org/red-system-specs.html#section-15.9){rel="noreferrer"}
directive needs to be in a Red/System context as you can see the
`#system-global` directive provides. Any function you have in Red needs
to be wrapped with a Red/System wrapper. You can do this using
[`#call`](http://static.red-lang.org/red-system-specs.html#section-15.8){rel="noreferrer"}
as done below:

    Red []    

    hello: does [print "hello"]    

    #system-global [
            hellosystem: does [
                #call [hello]
            ]    

            #export cdecl [hellosystem]
    ]

*Comment by kealist:* added another example

*Comment by akavel:* A Red/System sample works, but I was already told
so on the chat, as I tried to explain. The other sample, when trying to
compile with `red.exe -dlib example.red`, doesn\'t succeed with error
\"Loading Error\", with `id: 'cannot-open` and
`arg1: "/C/prog/nppScripts/nppScripts03red/extension.reds"`. Could it
compile without Rebol and extension.reds?

*Comment by Peter W A Wood:* This method is not so straight forward if
the arguments and return values are anything other than integer or
logic. For example. you have to manage the conversion between a
c-string! and a string! in the Red/System code.

*Comment by kealist:* That makes sense. That is another good QA
question. Thank you!

*Comment by akavel:* I renamed `hello-system` to `hellosystem`, because
I\'m not quite sure names with dash are allowed in DLLs; it compiled,
but when I try to open the DLL, I\'m getting an error:
`Failed to load testdll.dll: Invalid access to memory location.`

*Comment by kealist:* Turns out the print statement may not output to
the Right place on windows. I\'ve successfully called the function from
the dll in rebol but get no output, Not sure about the invalid access
from Ruby. I have been traveling but will try to get a working example
that returns a value for you when I get back home. You can take a look
at getting the value from CALL here
[static.red-lang.org/red-system-specs.html#section-15.8](http://static.red-lang.org/red-system-specs.html#section-15.8){rel="nofollow noreferrer"}

*Comment by kealist:* If someone else more knowledgable could answer it
would be better.

*Comment by akavel:* I asked on the Red mailing list, and I was told to
try loading the DLL from C, and it worked! So, big thanks for your help,
\@kealist! Although, there does seem to happen something fishy indeed,
if we\'re both having problems in non-C languages (I had my problems
when loading from Go).

------------------------------------------------------------------------

## Comments on question

*Comment by akavel:* Why oh why the downvote? Could you please comment,
so that I could improve, or at least understand? I can never understand
how people can just cast a first vote as downvote and not care to
comment to help the author.
