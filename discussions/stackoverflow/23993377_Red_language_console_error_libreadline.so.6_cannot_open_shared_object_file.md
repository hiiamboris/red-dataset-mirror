# Red language console error: libreadline.so.6: cannot open shared object file

**Link:**
<https://stackoverflow.com/questions/23993377/red-language-console-error-libreadline-so-6-cannot-open-shared-object-file>

**Asked:** 2014-06-02 11:23:57 UTC

------------------------------------------------------------------------

I\'m new to the Red programming language.

I tried to test it by downloading the Linux binary. But when I execute
it on the console, I get an error that says:

    root@xxx-linux:/home/xxx/Downloads# ./red-042
    Pre-compiling Red console...
    /tmp/red/console: error while loading shared libraries:
    libreadline.so.6: cannot open shared object file: No such file or directory

I searched on Google for this error, but couldn\'t find anything.

My operating system is 64-bit Linux Ubuntu 14.04 LTS

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 9) --- by gtmaroc.ma

I succeeded to make it work using this command on Ubuntu, which installs
32bit \"multilib\" version of `libreadline`:

    sudo apt-get install libreadline6:i386

------------------------------------------------------------------------

### Answer (score: 3) --- by Oldes

32bit version of libreadline is required. There is already work to
replace this dependency here
[https://github.com/qtxie/red/tree/new-console](https://github.com/qtxie/red/tree/new-console){rel="nofollow"}
but it was not merged to the master yet.

------------------------------------------------------------------------

### Answer (score: 0) --- by Taranjeet singh

I also came across this issue after upgrading to 64 bit Ubuntu 18.04,
and after spending some time looking into the issue I found that after
upgrade libreadline package was missing, so I installed libreadline
package using

    sudo apt-get install libreadline-dev

But this also didn\'t solve my problem. Then I figured out that it
installed the upgraded version of the libreadline package i.e
libreadline.so.7.0. As a workaround I created its symlink so I can
continue my work with libreadline.so.6.

    $ cd /lib/x86_64-linux-gnu/
    $ sudo ln -s libreadline.so.7.0 libreadline.so.6

And this worked wonders and my problem with libreadline package was
solved.

------------------------------------------------------------------------

## Comments on question
