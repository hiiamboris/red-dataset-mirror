# What&#39;s the difference between Rebol3 and Rebol2 and Red-Lang

**Link:**
<https://stackoverflow.com/questions/39409053/whats-the-difference-between-rebol3-and-rebol2-and-red-lang>

**Asked:** 2016-09-09 10:08:16 UTC

------------------------------------------------------------------------

Is Rebol 3 really different from Rebol 2 and Red-Lang. Is it finished ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Geeky I

I was in the same boat as you
[before](https://stackoverflow.com/questions/34830283/rebol-quickstart?rq=1),
hopefully, things are much clearer now. (Can\'t add to that one as it is
closed)

As for **finished** (usable in production), only Rebol 2 is stable and
mature (I myself use it, having only started a few months ago)

In order of *easiest* to hardest to get started:

## Rebol 2:

### Pros:

-   easy to get started (single binary)
-   stable, mature, full featured
-   has view (GUI)
-   lots of documentation
-   examples at rebol.net
-   lots of compatible libraries at rebol.org
-   has a large user base (still!)

### Cons:

-   no active development (version I use is from 2011)
-   deployment is harder (need commercial SDK for native binaries, but
    can work around)
-   no native gui (might not be a problem)

## Red:

(based on Rebol 2) (community on gitter.im)

### Pros:

-   easy to get started (single binary)
-   dead simple deployment (native binaries)
-   has native GUI (view and draw, still in development)
-   active development
-   Red/System (low level actual alternative to C, it is written in
    itself/self-hosted)

### Cons:

-   documentation work in progress
-   not everything is working
-   small chance of breaking (due to being in alpha)

## Ren-C:

(based on Rebol 3) (community here on stackoverflow chat) There are many
branches of rebol 3: [**This
question**](https://stackoverflow.com/questions/31510930/rebol3-what-is-the-difference-between-the-different-branches?rq=1)
gives a better overview. I chose \"Ren-C\" because it seems the most
actively developed

**Note**: I haven\'t actually used \"Ren-C\", but only other rebol 3
binaries, so refer to the other questions and take this with a grain of
salt, but it should be pretty similar to Red in terms of development and
community

### Pros:

-   more experimental than red?
-   active development
-   written in c/c++
-   other Rebol 3 (GUI) branches use it as upstream
-   these GUI versions are used commercially and in production

### Cons:

-   more experimental than red?
-   harder to get started (compile from source)
-   written in c/c++
-   documentation?
-   based on rebol 3 so less compatible with rebol 2(?) (actually, there
    seems to be a porting guide)
-   would probably be eventually merged into red(?)

*Comment by DocKimbel:* Ren-C is a diverging hostile fork of Rebol3 (not
supported nor endorsed by Rebol3\'s creator). It has no relation with
Red, nor is there any chance that any kind of \"merge\" will ever occur
with it. The SO room named \"Rebol and Red\" is misleading, as it\'s
mainly dedicated to that fork. It is not a place where Red contributors
and community meet.

*Comment by DocKimbel:* Red is not \"based on Rebol2\", that is a false
statement. Red takes *mostly* ideas from Rebol2, but also merges many
changes and improvements from Rebol3 (while incorporating its own
additions), making it different from both Rebol2 and Rebol3.

------------------------------------------------------------------------

### Answer (score: 1) --- by Darek Nędza

As far I know, R3 isn\'t finished & has bugs. I don\'t think anyone
works on Rebol 3 using that name.

HostileFork & other people are working on C implementations, named Ren/C
as far I remember.

Ren/C & Red is work in progress - anything can change.

All 4 languages are very similar but you will find some differences from
time to time.\
For example:

-   in Rebol 3 `request-file` returns `file` not `block` of `file`s as
    in Rebol 2
-   you can make \"a function, making all words found in body local\" (I
    think Rebol 3 and Ren/c has something like this too)
-   they are working on `parse`, so you can expect something \"better\"

------------------------------------------------------------------------

## Comments on question
