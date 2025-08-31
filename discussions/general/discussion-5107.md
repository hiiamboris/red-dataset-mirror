URL: <https://github.com/red/red/discussions/5107>
Date created: 2022-03-17T11:19:41Z

# OpenBSD Build

I am looking to use Red on OpenBSD. Unfortunately I was unable to find build instructions, only a mention that one needs REBOL. REBOL in turn does not seem to be available for OpenBSD. Any help would be appreciated.

Ideally, the Red project publishes a build for OpenBSD (amd64).

## Comments

### hiiamboris commented at 2022-03-17T11:21:57Z:

Building instructions listed at https://github.com/red/red/
Rebol 2 can be downloaded here: http://www.rebol.com/download-core.html

Both R2 and Red are 32-bit at the moment, so 32-bit libraries are needed. Instructions for FreeBSD can be found here: https://www.red-lang.org/p/download.html 
If these don't work for OpenBSD, once you figure it out feel free to list OpenBSD-specific process here so we can add it to that page.

