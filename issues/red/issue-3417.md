
#3417: Allow compilation of Static libRed
================================================================================
Issue is closed, was reported by ghost and has 11 comment(s).
<https://github.com/red/red/issues/3417>

Currently you can build a Shared libRed like so:

~~~
red build libRed
~~~

however it appears Red has no option to build a Static libRed.


Comments:
--------------------------------------------------------------------------------

On 2018-06-09T21:33:13Z, greggirwin, commented:
<https://github.com/red/red/issues/3417#issuecomment-396000275>

    Thanks for the ticket @svnpenn. We've set up https://github.com/red/rep/issues specifically for wish tickets like this. If you could add your wish over there, that would be great.

--------------------------------------------------------------------------------

On 2018-06-09T22:21:40Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3417#issuecomment-396003024>

    Building static libraries and linking them into an executable is not planned for Red 1.0. The Red 1.0 compiler is a throwaway bootstrap compiler. A fully modular compiler which will include such features will be built in Red after Red 1.0 has been released.

--------------------------------------------------------------------------------

On 2018-06-09T23:38:01Z, greggirwin, commented:
<https://github.com/red/red/issues/3417#issuecomment-396006386>

    @svnpenn, using Red's issue tracking to promote another language is...not nice. If you wonder why I deleted your message, that's the reason. If you want all languages to be equal, are you also posting on their forums that they should match Red, feature for feature? I'm not trying to be mean, but some of our best people spent a significant amount of time explaining things to you, but you don't seem to want to listen.

--------------------------------------------------------------------------------

On 2018-06-12T17:33:44Z, 9214, commented:
<https://github.com/red/red/issues/3417#issuecomment-396671976>

    I'll give some context to the edited version of @svnpenn's message to the outside reader.
    
    It was explained to him by at least 4 different people:
    1. **Why comparing Red toolchain and GCC by compilation speed makes absolutely no sense** - because the former one is a very high-level programming language in the alpha stage of development, which relies on a throw-away bootstrap compiler with no optimization layers, and the latter is 20-something years old ~~mammoth~~ highly tuned pipeline for a low-level language (which is C). If you want a fair comparison - pick Red/System (a low-level C-like DSL) instead.
    1. **Why toolchain does not offer options for static compilation** - because, see p.1, current compiler is a throw-away one, and will be dropped off once bootsrapping phase is complete. Spending time on integration of proposed feature is impractical, and also requires a significant amount of work to be spend on extending the linker for each target file format.
    1. **How OP can refine his workflow in the absence of the proposed feature** - by using a shared version of libRed instead, or by relying on the interpreter during development, thus omitting long compilation times entirely and speeding up the development process by at least the factor of two.
    
    All of the explanations and suggestions were either ignored or dismissed, while conversation itself was marked as ['going nowhere'](https://gitter.im/red/red?at=5b1bf8f614d4bc146e792f8f). Instead of creating a feature request in the [appropriate repository](https://github.com/red/rep/issues), OP continued with a [previously failed attempt](https://gitter.im/red/red?at=5b1bec793516592752f74de3) at programming languages flamewar. The message was deleted (as can be seen above) with a prompt warning by @greggirwin. In spite of that, OP continued his line of action by updating the original message, with a content which was indicated by @greggirwin as inappropriate.
    
    Without giving this issue a highly political flavor, I'll say that it's not a nice thing to do. Your feature request, @svnpenn, will be implemented in post-1.0 versions of Red toolchain (as it was planned anyway), but your attitude will hardly make you a welcomed guest in our community.

--------------------------------------------------------------------------------

On 2020-03-02T18:34:35Z, dockimbel, commented:
<https://github.com/red/red/issues/3417#issuecomment-593550557>

    Seems like the last post is a [spam](https://github.com/cup/autumn/commit/515975fa9c802d88ca0507b2f441b4301e71cbdd). The author got [banned from Lobster](https://lobste.rs/u/cup).

