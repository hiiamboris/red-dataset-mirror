# Red (programming language)

Contributors to Wikimedia projects

* * *

From Wikipedia, the free encyclopedia

Red[![Red Logo (stylized Tower of Hanoi)](//upload.wikimedia.org/wikipedia/en/thumb/e/e9/Red_Language_Tower_Logo.png/160px-Red_Language_Tower_Logo.png)](/wiki/File:Red_Language_Tower_Logo.png)[Paradigm](/wiki/Programming_paradigm "Programming paradigm")[Multi-paradigm](/wiki/Programming_paradigm "Programming paradigm"): [imperative](/wiki/Imperative_programming "Imperative programming"), [functional](/wiki/Functional_programming "Functional programming"), [symbolic](/wiki/Symbolic_programming "Symbolic programming")[Designed by](/wiki/Software_design "Software design")Nenad Rakočević[\[1\]](#cite_note-1)[Developer](/wiki/Software_developer "Software developer")Nenad RakočevićFirst appeared2011[Stable release](/wiki/Software_release_life_cycle "Software release life cycle")

0.6.6[\[2\]](#cite_note-2) ([Beta](/wiki/Beta_software "Beta software")) / March 19, 2025

[OS](/wiki/Operating_system "Operating system")[Linux](/wiki/Linux "Linux"), [Windows](/wiki/Windows "Windows"), [OS X](/wiki/OS_X "OS X")[License](/wiki/Software_license "Software license")[modified BSD](/wiki/Modified_BSD_license "Modified BSD license") and [Boost](/wiki/Boost_Software_License "Boost Software License")[Filename extensions](/wiki/Filename_extension "Filename extension").red, .redsWebsite[red-lang.org](https://www.red-lang.org/)Influenced by[Rebol](/wiki/Rebol "Rebol"), [Lisp](/wiki/Lisp_%28programming_language%29 "Lisp (programming language)"), [Scala](/wiki/Scala_%28programming_language%29 "Scala (programming language)"), [Lua](/wiki/Lua_%28programming_language%29 "Lua (programming language)")

**Red** is a [programming language](/wiki/Programming_language "Programming language") designed to overcome the limitations of the programming language [Rebol](/wiki/Rebol "Rebol").[\[3\]](#cite_note-GS-3) Red was introduced in 2011 by Nenad Rakočević,[\[4\]](#cite_note-FOOTNOTEBalbaert2018-4) and is both an [imperative](/wiki/Imperative_programming "Imperative programming") and [functional programming](/wiki/Functional_programming "Functional programming") language. Its syntax and general usage overlaps that of the interpreted Rebol language.[\[5\]](#cite_note-5)

The implementation choices of Red intend to create a [full stack](/wiki/Solution_stack "Solution stack") programming language:[\[4\]](#cite_note-FOOTNOTEBalbaert2018-4)[\[6\]](#cite_note-MUO-6) Red can be used for extremely high-level programming ([DSLs](/wiki/Domain-specific_language "Domain-specific language") and [GUIs](/wiki/Graphical_user_interface "Graphical user interface")) as well as low-level programming ([operating systems](/wiki/Operating_system "Operating system") and [device drivers](/wiki/Device_driver "Device driver")). Key to the approach is that the language has two parts: *Red/System* and *Red*.[\[7\]](#cite_note-developpez-7)

- *Red/System* is similar to C, but packaged into a Rebol lexical structure – for example, one would write `if x > y [print "Hello"]` instead of `if (x > y) {printf("Hello\n");}`.
- *Red* is a [homoiconic language](/wiki/Homoiconicity "Homoiconicity"), which is capable of [meta-programming](/wiki/Meta-programming "Meta-programming") with Rebol-like semantics.[\[3\]](#cite_note-GS-3)[\[8\]](#cite_note-Softpedia-8) Red's runtime library is written in Red/System, and uses a hybrid approach: it [compiles](/wiki/Compiled_language "Compiled language") what it can deduce statically and uses an embedded [interpreter](/wiki/Interpreter_%28computing%29 "Interpreter (computing)") otherwise. The project roadmap includes a [just-in-time compiler](/wiki/Just-in-time_compilation "Just-in-time compilation") for cases in between, but this has not yet been implemented.

Red seeks to remain independent of any other [toolchain](/wiki/Toolchain "Toolchain"); it does its own code generation.[\[3\]](#cite_note-GS-3) It is therefore possible to [cross-compile](/wiki/Cross_compiler "Cross compiler")[\[6\]](#cite_note-MUO-6) Red programs from any platform it supports to any other, via a command-line switch. Both Red and Red/System are distributed as [open-source software](/wiki/Open-source_software "Open-source software") under the [modified BSD license](/wiki/Modified_BSD_license "Modified BSD license"). The runtime library is distributed under the more permissive [Boost Software License](/wiki/Boost_Software_License "Boost Software License").

As of version 0.6.4 Red includes a [garbage collector](/wiki/Garbage_collection_%28computer_science%29 "Garbage collection (computer science)") "the Simple GC".[\[9\]](#cite_note-GC-9)

[![](//upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Red_architecture_small.PNG/330px-Red_architecture_small.PNG)](/wiki/File:Red_architecture_small.PNG)

Red Language architecture schema

Red was introduced in the [Netherlands](/wiki/Netherlands "Netherlands") in February 2011 at the *Rebol &amp; Boron conference*[\[10\]](#cite_note-10) by its author Nenad Rakočević. In September 2011, the Red programming language was presented to a larger audience during the [Software Freedom Day](/wiki/Software_Freedom_Day "Software Freedom Day") 2011.[\[11\]](#cite_note-Red_SFD_2011-11)[\[12\]](#cite_note-YT_SFD_2011-12) Rakočević is a long-time Rebol developer known as the creator of the Cheyenne [HTTP server](/wiki/HTTP_server "HTTP server").[\[13\]](#cite_note-13)

Red's syntax and semantics are very close to those of [Rebol](/wiki/Rebol "Rebol").[\[4\]](#cite_note-FOOTNOTEBalbaert2018-4)[\[14\]](#cite_note-14) Like Rebol, it strongly supports [metaprogramming](/wiki/Metaprogramming "Metaprogramming") and domain-specific languages ([DSLs](/wiki/Domain-specific_language "Domain-specific language")) and is therefore a highly efficient tool for dialecting (creating embedded DSLs). Red includes a dialect called Red/System, a C-level language which provides system programming facilities.[\[7\]](#cite_note-developpez-7) Red is easy to integrate with other tools and languages as a DLL (libRed) and very lightweight (around 1 MB). It is also able to cross-compile to various platforms (see Cross Compilation section below) and create packages for platforms that require them (e.g., .APK on Android).[\[7\]](#cite_note-developpez-7) Red also includes a fully reactive cross-platform GUI system based on an underlying reactive dataflow engine, a 2D drawing dialect comparable to SVG, compile-time and runtime macro support, and more than 40 standard datatypes.

The following is the list of Red's Goals as presented on the [Software Freedom Day](/wiki/Software_Freedom_Day "Software Freedom Day") 2011:[\[11\]](#cite_note-Red_SFD_2011-11)[\[12\]](#cite_note-YT_SFD_2011-12)

- Simplicity ("An IDE should not be necessary to write code.")
- Compactness ("Being highly expressive maximizes productivity.")
- Speed ("If too slow, it cannot be general-purpose enough.")
- Be "Green", Have a Small Footprint ("Because resources are not limitless.")
- Ubiquity ("Spread everywhere.")
- Portability, Write once run everywhere ("That's the least expected from a programming language.")
- Flexibility ("Not best but good fit for any task!")

## Commercial applications

\[[edit](/w/index.php?title=Red_%28programming_language%29&action=edit&section=4 "Edit section: Commercial applications")]

The following commercial applications are currently developed on Red:

- DiaGrammar[\[15\]](#cite_note-DiaGrammar-15) — Live coded diagramming
- SmartXML[\[16\]](#cite_note-SmartXML-16) — XML parsing tool.

Red's development is planned to be done in two phases:

1. Initial phase: Red and Red/System compilers written in [Rebol](/wiki/Rebol "Rebol") 2
2. [Bootstrap](/wiki/Bootstrapping_%28compilers%29 "Bootstrapping (compilers)") phase: Red and Red/System compilers complemented by a Red JIT-compiler, all written in Red

Red currently supports the following cross-compilation targets:[\[4\]](#cite_note-FOOTNOTEBalbaert2018-4)

- [MS-DOS](/wiki/MS-DOS "MS-DOS"): Windows, [x86](/wiki/X86 "X86"), console (and GUI) applications
- [Windows](/wiki/Microsoft_Windows "Microsoft Windows"): Windows, x86, GUI applications
- [Linux](/wiki/Linux "Linux"): [Linux](/wiki/Linux "Linux"), x86
- Linux-ARM: [Linux](/wiki/Linux "Linux"), [ARMv5](/wiki/ARM_architecture "ARM architecture"), [armel](/wiki/ARM_architecture "ARM architecture") (soft-float)
- [Raspberry Pi](/wiki/Raspberry_Pi "Raspberry Pi"): [Linux](/wiki/Linux "Linux"), [ARMv5](/wiki/ARM_architecture "ARM architecture"), [armhf](/wiki/Armhf "Armhf") (hard-float)
- [FreeBSD](/wiki/FreeBSD "FreeBSD"): [x86](/wiki/X86 "X86")
- [Darwin](/wiki/Darwin_%28operating_system%29 "Darwin (operating system)"): [OS X](/wiki/OS_X "OS X") Intel, console (and GUI) applications
- [Android](/wiki/Android_%28operating_system%29 "Android (operating system)"): Android, [ARMv5](/wiki/ARM_architecture "ARM architecture")
- Android-x86: Android, [x86](/wiki/X86 "X86")

(Note: Presently, Red applications are 32-bit, but it is planned to switch to 64-bit in the future.[\[4\]](#cite_note-FOOTNOTEBalbaert2018-4))

The ["Hello, World!" program](/wiki/%22Hello,_World!%22_program '"Hello, World!" program') in Red:

```
Red [Title: "Simple hello world script"]
print "Hello, World!"
```

IMPORTANT: These are intended as syntax examples. Until Red has [64-bit](/wiki/64-bit_computing "64-bit computing") support, the integer example will overflow a [32-bit](/wiki/32-bit "32-bit") integer very quickly. Changing that to \`float!\` will go farther, but these are merely to show the syntax of the language.

The following is a factorial example in Red:

```
Red [Title: "A factorial script"]  ; Note: The title is optional.

factorial: func [
	x [integer!]  ; Giving the type of an argument in Red is optional
][
	either x = 0 [1][x * factorial x - 1]
]
```

The following is the same factorial example in Red/System (in this very simple case, the source code is very similar to Red's version):

```
Red/System [Title: "A factorial script"]

factorial: func [
	x       [integer!]                   ; This is compulsory in Red/System
	return: [integer!]                   ; This is compulsory in Red/System
][
	either x = 0 [1][x * factorial x - 1]
]
```

- [Comparison of programming languages](/wiki/Comparison_of_programming_languages "Comparison of programming languages")
- [History of programming languages](/wiki/History_of_programming_languages "History of programming languages")
- [List of programming languages](/wiki/List_of_programming_languages "List of programming languages")
- [List of programming languages by type](/wiki/List_of_programming_languages_by_type "List of programming languages by type")

<!--THE END-->

01. [**^**](#cite_ref-1) ["Creator of Red"](https://github.com/dockimbel). [*GitHub*](/wiki/GitHub "GitHub").
02. [**^**](#cite_ref-2) ["Red's improvements"](https://www.red-lang.org/2025/03/066-memory-management-improvements.html). *red-lang*. Retrieved April 1, 2025.
03. ^ [***a***](#cite_ref-GS_3-0) [***b***](#cite_ref-GS_3-1) [***c***](#cite_ref-GS_3-2) ["Getting Started with GUI Programming using Red Language"](https://www.studytonight.com/post/getting-started-with-gui-programming-using-red-programming-language). *Studytonight*. Retrieved September 17, 2021.
04. ^ [***a***](#cite_ref-FOOTNOTEBalbaert2018_4-0) [***b***](#cite_ref-FOOTNOTEBalbaert2018_4-1) [***c***](#cite_ref-FOOTNOTEBalbaert2018_4-2) [***d***](#cite_ref-FOOTNOTEBalbaert2018_4-3) [***e***](#cite_ref-FOOTNOTEBalbaert2018_4-4) [Balbaert 2018](#CITEREFBalbaert2018).
05. [**^**](#cite_ref-5) ["Interview with Nenad Rakocevic about Red, a Rebol inspired programming language"](https://web.archive.org/web/20230323034804/https://www.notamonadtutorial.com/interview-with-nenad-rakocevic-about-red-a-rebol-inspired-programming-language/). *Not a Monad Tutorial*. 28 August 2015. Archived from [the original](https://www.notamonadtutorial.com/interview-with-nenad-rakocevic-about-red-a-rebol-inspired-programming-language/) on 23 March 2023. Retrieved August 28, 2015.
06. ^ [***a***](#cite_ref-MUO_6-0) [***b***](#cite_ref-MUO_6-1) ["6 Unusual &amp; Groundbreaking Programming Languages to Learn in 2023"](https://www.makeuseof.com/programming-languages-to-learn-in-2023/). *makeuseof.com*. 18 October 2023.
07. ^ [***a***](#cite_ref-developpez_7-0) [***b***](#cite_ref-developpez_7-1) [***c***](#cite_ref-developpez_7-2) Lucas, Mathis (21 July 2023). ["Red: an imperative and functional programming language that is also a "full battery" language"](https://programmation.developpez.com/actu/346670/Red-un-langage-de-programmation-imperatif-et-fonctionnel-et-decrit-comme-un-langage-a-pile-complete-c-est-a-dire-qu-il-peut-etre-utilise-pour-la-programmation-de-haut-niveau-et-de-bas-niveau/). *Developpez.com*. Retrieved 16 January 2023.
08. [**^**](#cite_ref-Softpedia_8-0) Sasu, Alexandru (22 November 2018). ["Review of Red"](https://www.softpedia.com/get/Programming/Coding-languages-Compilers/Red-Programming-Language.shtml). *Softpedia*. Retrieved February 21, 2024.
09. [**^**](#cite_ref-GC_9-0) lucindamichele. ["0.6.4 Simple GC and Pure Red GUI Console"](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html). Retrieved 2018-12-16. The main feature for 0.6.4 is what we call the Simple GC (Garbage Collector). A more advanced GC is planned for the future
10. [**^**](#cite_ref-10) [« New Red Programming Language Gets Syllable Backend »](http://www.osnews.com/story/24798/New_Red_Programming_Language_Gets_Syllable_Backend), *osnews.com*, May 2011.
11. ^ [***a***](#cite_ref-Red_SFD_2011_11-0) [***b***](#cite_ref-Red_SFD_2011_11-1) [« Red Programming Language: Red at Software Freedom Day 2011 »](https://www.red-lang.org/2011/09/red-at-software-freedom-day-2011.html), *red-lang.org*, September 14, 2011.
12. ^ [***a***](#cite_ref-YT_SFD_2011_12-0) [***b***](#cite_ref-YT_SFD_2011_12-1) ["Software Freedom Day 2011: Red programming language, a new REBOL dialect"](https://www.youtube.com/watch?v=wgtgoliZ454). *YouTube*. 16 September 2011. Retrieved 17 January 2023.
13. [**^**](#cite_ref-13) [« What is Cheyenne? »](http://cheyenne-server.org/about.shtml) Last referenced Nov 2017.
14. [**^**](#cite_ref-14) ["The Dynamic Mapping Architecture"](https://etd.ohiolink.edu/apexprod/rws_etd/send_file/send?accession=toledo1639760375713532&disposition=inline). *OhioLINK*. December 2021.
15. [**^**](#cite_ref-DiaGrammar_15-0) [«DiaGrammar»](https://red-lang.org/2020/03/), *red-lang.org*, March 2020.
16. [**^**](#cite_ref-SmartXML_16-0) [«SmartXML»](https://redata.dev/smartxml/), *redata.dev*.

<!--THE END-->

- Balbaert, Ivo (May 2018). *Learn Red - Fundamentals of Red*. [Packt Publishing](/wiki/Packt_Publishing "Packt Publishing"). [ISBN](/wiki/ISBN_%28identifier%29 "ISBN (identifier)") [978-1789130706](/wiki/Special:BookSources/978-1789130706 "Special:BookSources/978-1789130706").

<!--THE END-->

- [Official website](https://www.red-lang.org/) [![Edit this at Wikidata](//upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/20px-OOjs_UI_icon_edit-ltr-progressive.svg.png)](https://www.wikidata.org/wiki/Q3217187#P856 "Edit this at Wikidata")
- [Latest builds from official website](https://www.red-lang.org/p/download.html)
- [Red](https://github.com/red/Red) on [GitHub](/wiki/GitHub "GitHub")
- [Redprogramming.com](https://redprogramming.com/)
- [Helpin' Red](https://helpin.red/Downloads.html/) [Archived](https://web.archive.org/web/20210928093654/https://helpin.red/Downloads.html) 2021-09-28 at the [Wayback Machine](/wiki/Wayback_Machine "Wayback Machine")
