
#3505: Website "Download Section"
================================================================================
Issue is closed, was reported by innitheblindsw and has 36 comment(s).
<https://github.com/red/red/issues/3505>

Hello, i am from Cuba. Cuba has no access to google services. Is possible put compiled version in Github or into webserver?
I have to search in japanese ftp server red-0.6.3.exe for download it.
I love this programing language.

Thanks for this great work.


Comments:
--------------------------------------------------------------------------------

On 2018-08-14T14:56:50Z, innitheblindsw, commented:
<https://github.com/red/red/issues/3505#issuecomment-412901514>

    I can help to translate or make tutorials in spanish if you wants.
    Thanks 

--------------------------------------------------------------------------------

On 2018-08-14T15:47:42Z, greggirwin, commented:
<https://github.com/red/red/issues/3505#issuecomment-412919623>

    @innitheblindsw, if you join us on Gitter, in the red/red room, @rebolek can probably point you to his personal site, where he maintains some automated builds. It should be somewhere on http://red.qyz.cz/, but I can't find it right now.

--------------------------------------------------------------------------------

On 2018-08-14T16:08:39Z, nedzadarek, commented:
<https://github.com/red/red/issues/3505#issuecomment-412926688>

    this: https://rebolek.com/builds/ ?

--------------------------------------------------------------------------------

On 2018-08-14T16:30:17Z, greggirwin, commented:
<https://github.com/red/red/issues/3505#issuecomment-412933874>

    Thanks @nedzadarek!

--------------------------------------------------------------------------------

On 2018-08-15T07:08:07Z, rebolek, commented:
<https://github.com/red/red/issues/3505#issuecomment-413113183>

    @nedzadarek thanks for pointing to the right site, only my blog is on http://red.qyz.cz and it will be moved to https://rebolek.com too (hopefully) soon.

--------------------------------------------------------------------------------

On 2018-08-15T07:10:50Z, rebolek, commented:
<https://github.com/red/red/issues/3505#issuecomment-413113660>

    @innitheblindsw btw, my builds are only console builds and not "full" Red, as on original site, because I prefer keeping Red and Rebol environment separate, as it's much more flexible that way.

--------------------------------------------------------------------------------

On 2018-08-15T16:45:37Z, nedzadarek, commented:
<https://github.com/red/red/issues/3505#issuecomment-413258868>

    @rebolek what do you mean "not full"? Do your builds won't run some code?

--------------------------------------------------------------------------------

On 2018-08-15T16:54:53Z, 9214, commented:
<https://github.com/red/red/issues/3505#issuecomment-413261903>

    @nedzadarek, @rebolek's builds are not created with Rebol SDK, and hence cannot be used for compilation, unlike "batteries included" Red toolchain executable, available from downloads section.
    
    That is, to compile your scripts you'll need to use Rebol/View and `red.r` command-line front-end, as described in readme.

--------------------------------------------------------------------------------

On 2018-08-15T17:18:41Z, rebolek, commented:
<https://github.com/red/red/issues/3505#issuecomment-413269224>

    @nedzadarek, @9214 is almost right, the only thing is that you do not need Rebol/View, Rebol/Core is sufficient. So besides from the compiling, that is done using Rebol anyway (Rebol is embedded in official Red executable), my console builds are functionally same as official builds.
    
    I theoretically *could* build executable that will be capable of compiling (I own SDK license), but it's not a priority for me, so do not expect it to be done soon.

--------------------------------------------------------------------------------

On 2018-08-15T17:40:42Z, 9214, commented:
<https://github.com/red/red/issues/3505#issuecomment-413276108>

    @rebolek IIRC there are some heisenbugs when one uses /Core instead of /View. Better safe than sorry :)

--------------------------------------------------------------------------------

On 2018-08-15T17:49:31Z, x8x, commented:
<https://github.com/red/red/issues/3505#issuecomment-413278977>

    Hello @innitheblindsw, there is a backup server for users in Cuba and Iran:
    https://bk-static.red-lang.org/download.html
    
    Let us know if that works for you.

--------------------------------------------------------------------------------

On 2018-08-15T18:19:02Z, greggirwin, commented:
<https://github.com/red/red/issues/3505#issuecomment-413288129>

    @x8x, should that be used automatically, based on IP? Should we note it somewhere? Or are we *not* noting it somewhere intentionally?

--------------------------------------------------------------------------------

On 2018-08-15T19:36:31Z, rebolek, commented:
<https://github.com/red/red/issues/3505#issuecomment-413310670>

    @9214 interesting, I'm doing builds with Core, so I may try to add View to the build chain and check if there are any differences.
    Anyway, isn't the Heisenbug caused by using 2.7.8 instead of 2.7.6 and not by /Core over /View? Which reminds me I should look for 2.7.6 somewhere...

--------------------------------------------------------------------------------

On 2018-08-15T21:38:23Z, x8x, commented:
<https://github.com/red/red/issues/3505#issuecomment-413346225>

    @greggirwin Let see if @innitheblindsw can connect to the backup first.
    Cuba, Iran, North Korea, Republic of Sudan, Syria and Crimea are subject to U.S. trade and economic sanctions,  hence major internet players comply.
    I wouldn't add client-IP routing until we have a couple more requests, it's not rocket science and would add up to 100ms latency to every requests for all the world.
    As sad as it is, people in these countries normally know how to circumvent the blockade thru VPN, TOR, etc..
    We can note that somewhere if circumventing wont upset uncle Sam.

--------------------------------------------------------------------------------

On 2018-08-15T21:42:58Z, greggirwin, commented:
<https://github.com/red/red/issues/3505#issuecomment-413347508>

    We may want to comply as well, and leave people to their own solutions for the time being.

--------------------------------------------------------------------------------

On 2018-08-15T23:19:10Z, greggirwin, commented:
<https://github.com/red/red/issues/3505#issuecomment-413369753>

    Closing this issue.

--------------------------------------------------------------------------------

On 2018-08-16T16:21:10Z, innitheblindsw, commented:
<https://github.com/red/red/issues/3505#issuecomment-413603026>

    Thanks a LOT !!! :)  It work. I am so happy now.
    Thanks @x8x . Thanks again. I am a begginer on RED but i write and read very easy this programing language.
    Thanks @greggirwin  , @nedzadarek , @rebolek , @9214 and in special @x8x .
    

--------------------------------------------------------------------------------

On 2018-08-16T16:39:18Z, 9214, commented:
<https://github.com/red/red/issues/3505#issuecomment-413608877>

    @innitheblindsw you're welcome! Don't forget to come by [our chat](https://gitter.im/red/red/welcome) and say "Hi" :wink: 

