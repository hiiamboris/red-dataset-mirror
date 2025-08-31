# Segmentation fault with Gtk console on 64-bit system

**Link:**
<https://stackoverflow.com/questions/54109186/segmentation-fault-with-gtk-console-on-64-bit-system>

**Asked:** 2019-01-09 11:33:44 UTC

------------------------------------------------------------------------

I\'ve compiled a Red console [with Gtk3
support](https://github.com/red/red/wiki/%5BNOTES%5D-Gtk-Bindings-Development){rel="nofollow noreferrer"}.
When I run View tests, such as included in repo `tests/react-test.red`,
i get an error:

    $ ./console tests/react-test.red

    *** Runtime Error 32: segmentation fault
    *** at: F6B4E33Eh

`ldd console` does not report missing libraries. The same binary works
OK in 32-bit Debian.

What can be the problem?

When I add `system/view/debug?: yes` line to `tests/react-test.red`,
there is some debugging info about *View* events before segfault error:

    $ ./console tests/react-test.red
    -- on-change event -- 
        face : window 
        word : type 
        old  : word 
        new  : word
    -- on-change event -- 
        face : window 
        word : size 
        old  : none 
        new  : pair
    -- on-change event -- 
        face : window 
        word : pane 
        old  : none 
        new  : block
    -- on-change event -- 
        face : text 
        word : type 
        old  : word 
        new  : word
    -- on-change event -- 
        face : text 
        word : size 
        old  : none 
        new  : pair
    -- on-deep-change event -- 
        owner      : text 
        action     : set-path 
        word       : size 
        target type: pair! 
        new value  : none! 
        index      : -1 
        part       : -1 
        auto-sync? : true 
        forced?    : false
    -- para on-change event -- 
        word : align 
        old  : none 
        new  : word
    -- on-change event -- 
        face : text 
        word : size 
        old  : pair 
        new  : pair
    -- on-change event -- 
        face : text 
        word : para 
        old  : none 
        new  : object
    -- para on-change event -- 
        word : parent 
        old  : none 
        new  : block
    -- on-change event -- 
        face : text 
        word : size 
        old  : pair 
        new  : pair
    -- para on-change event -- 
        word : parent 
        old  : block 
        new  : none
    -- on-change event -- 
        face : text 
        word : type 
        old  : word 
        new  : word
    -- on-change event -- 
        face : text 
        word : size 
        old  : none 
        new  : pair
    -- on-deep-change event -- 
        owner      : text 
        action     : set-path 
        word       : size 
        target type: pair! 
        new value  : none! 
        index      : -1 
        part       : -1 
        auto-sync? : true 
        forced?    : false
    -- para on-change event -- 
        word : align 
        old  : none 
        new  : word
    -- font on-change event -- 
        word : style 
        old  : none 
        new  : word
    -- font on-change event -- 
        word : name 
        old  : none 
        new  : none
    -- font on-change event -- 
        word : size 
        old  : none 
        new  : none
    -- on-change event -- 
        face : text 
        word : size 
        old  : pair 
        new  : pair
    -- on-change event -- 
        face : text 
        word : text 
        old  : none 
        new  : string
    -- on-change event -- 
        face : text 
        word : para 
        old  : none 
        new  : object
    -- para on-change event -- 
        word : parent 
        old  : none 
        new  : block
    -- on-change event -- 
        face : text 
        word : font 
        old  : none 
        new  : object
    -- font on-change event -- 
        word : parent 
        old  : none 
        new  : block

    *** Runtime Error 32: segmentation fault
    *** at: F6B5E33Eh

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* I don\'t know much about
Red (*cough*), but I do know the GTK branch is experimental. You should
either raise this on [GitHub
issues](https://github.com/red/red/issues){rel="nofollow noreferrer"},
or in the [Gitter.IM
chat](https://gitter.im/red/red){rel="nofollow noreferrer"}.

*Comment by Maciej Łoziński:* After couple days of testing, it looks
like the problem is limited to Arch Linux. It compiles and runs ok on
Ubuntu & CentOS. Moreover, a binary compiled on Arch runs on other
distros without problems.

*Comment by Maciej Łoziński:* Problem [has been fixed
recently](https://github.com/red/red/commit/4f44ff9b4779654b1f619c402359336df80a4251){rel="nofollow noreferrer"}.
Now binaries built for Linux work properly under Arch.
