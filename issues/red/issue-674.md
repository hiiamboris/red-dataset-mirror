
#674: Access to global-ctx can be simplified?
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/674>

global-ctx is declared as node! in %red.reds and in order to access it as red-context!, a type-cast has to be done, with the help of the macro TO_CTX

However, in a program to explore the inner workings of the Red compiler, I (naively or mistakenly) used global-ctx/symbols and this gave no error, indeed it gave a correct result. How come?



Comments:
--------------------------------------------------------------------------------

On 2014-02-04T20:34:43Z, iArnold, commented:
<https://github.com/red/red/issues/674#issuecomment-34103848>

    That is on line 85 of red.reds. 
    Line 135 makes it       global-ctx: _context/create 1000 no no
    
    Curious about your program and your findings about the inner working. Any interest to document?

--------------------------------------------------------------------------------

On 2014-02-04T22:34:50Z, meijeru, commented:
<https://github.com/red/red/issues/674#issuecomment-34115830>

    Note that _context/create also yields a node! return value, so after line 135 it is still a node!.
    
    My program is still in a very early stage, and mostly intended to verify my understanding of those implementation details. It derives from a similar program I wrote for REBOL 3, but there it was really necessary because R3 was not open source at the time, and I merely surmised implementation details, which I wanted to verify by "spying"  using the "extension" mechanism, i.e.  some interface to C code (much less sophisticated than the Red-to-Red/System one).

--------------------------------------------------------------------------------

On 2014-02-08T10:44:19Z, dockimbel, commented:
<https://github.com/red/red/issues/674#issuecomment-34540803>

    I get a compilation error if I try to use `global-ctx/symbols`. The change is recent, so you might just have tested with the older version which was returning a `red-context!` instead of a `node!`.

