
#2440: Command line argument inconsistency
================================================================================
Issue is closed, was reported by cromo and has 26 comment(s).
[status.built] [status.tested] [type.review] [Epic]
<https://github.com/red/red/issues/2440>

I'd really like to start using Red to write useful programs, and for me, that means command line tools. Unfortunately, there's inconsistency with how command line arguments work at the moment that makes it difficult or painfully slow to test anything.

First, here's what I expect, as demonstrated by the below Rebol 2 code:

```rebol
Rebol []

print ["system/options/args:" mold system/options/args]
print ["system/script/args:" mold system/script/args]
```

```shell
$ ./rebol -qws hello-args.r hi there 'double "quotes"'
system/options/args: ["hi" "there" {double "quotes"}]
system/script/args: {hi there double "quotes"}
```

So the expected value for `system/options/args` is a block of strings, while `system/script/args` is equivalent to `reform system/options/args`.

Red's behavior is different than the above, and is even different between interpreted and compiled code. To demonstrate:

```red
Red []

print ["system/options/args:" mold system/options/args]
print ["system/script/args:" mold system/script/args]
```

When interpreted, `system/options/args` is a string containing the quoted name of the script file, while `system/script/args` is `none`:

```shell
$ ./red-061 hello-args.red hi there 'double "quotes"'
system/options/args: {"hello-args.red"}
system/script/args: none
```

When compiled, `system/options/args` is a string that contains all the arguments surrounded by double quotes and `reform`ed without escaping double quotes that are passed to it, while `system/script/args` is still `none`:

```shell
$ ./red-061 -c hello-args.red 

-=== Red Compiler 0.6.1 ===- 

Compiling /home/cromo/scratch/red/hello-args.red ...
...compilation time : 500 ms

Compiling to native code...
...compilation time : 15568 ms
...linking time     : 143 ms
...output file size : 455168 bytes
...output file      : /home/cromo/scratch/red/hello-args 


$ ./hello-args hi there 'double "quotes"'
system/options/args: {"hi" "there" "double "quotes""}
system/script/args: none
```

The interpreted values are consistent with issues #1985 and #2242 - only the script name is passed in `system/options/args`. This issue includes those along with this inconsistency between the interpreted mode and the compiled mode. The main problem I have here is that interpreting scripts is quite speedy but gives the wrong inputs, while the compiled version takes 15+ seconds to compile, but gives a potentially workable value in `system/options/args`.

I picked up Rebol in the last week or so and absolutely love the language family. I'd be happy to work on a pull request to provide a similar output to the Rebol 2 source above if you could point me in the right direction.


Comments:
--------------------------------------------------------------------------------

On 2017-02-17T14:07:44Z, ghost, commented:
<https://github.com/red/red/issues/2440#issuecomment-280658636>

    I may be wrong but AFAIK, this feature is not yet implemented and all these issues are kinda duplicates (though I may be wrong). @dockimbel or @qtxie will be able to answer that better.
    
    As far as the compilation times go, since the runtime is recompiled everytime a script is compiled, hence the compilation times are long. But if you download the latest automated build (which is equivalent to the latest master branch), it contains something called libredRT which is essentially the red runtime which gets compiled as a *.dll or *.so as per the platform and it gets dynamically linked to the compiled executable. Hence, only the first compile takes time, the later compiles are quick. But before shipping the executable, it is recommended to compile it in release mode (`-r`) which includes the statically linked runtime. So you may use the latest build or wait a few days for the new version to get released.

--------------------------------------------------------------------------------

On 2017-02-17T15:10:22Z, cromo, commented:
<https://github.com/red/red/issues/2440#issuecomment-280675264>

    I agree that #1985 and #2242 as duplicates of each other. They're talking about passing arguments to scripts. This issue is a bit broader scope, as it also includes how arguments are passed to compiled Red programs.
    
    Using the latest automated build on CentOS 6.2 is just giving me
    
    ```shell
    $ ./red-17feb17-cc0b943
    
    *** Runtime Error 1: access violation
    *** at: 080962F2h
    ```
    
    but that does sound like a workable solution otherwise. I'll be able to test on an Ubuntu 16.04 install later today to see if it's consistent across systems.
    
    It's apparent that the compiled version is doing *something* with the command line arguments, but I think it should either escape double quotes somehow so that they can be correctly `parse`d or put each argument into a block like Rebol does. I'll deal with long compile times if the arguments are correct and unambiguous, but they're not.
    
    I guess I could make do with a small polyglot program in the form of
    
    ```red
    Red []
    
    context [
        parse-red-args: func [
            "Return a block containing command line arguments."
            args [string!]
            "The argument string where each argument is double quoted."
            /local arg arg-block
        ] [
            arg-block: copy []
            parse/case args [
                some [
                    {"} copy arg to {"} skip (append arg-block arg)
                    any " "
                ]
            ]
            arg-block
        ]
    
        set 'system/options/args parse-red-args system/options/args
        set 'system/script/args form system/options/args
    ]
    
    rebol: :comment
    Rebol []
    
    ; Put the actual program code below the Rebol header.
    print ["system/options/args:" mold system/options/args]
    print ["system/script/args:" mold system/script/args]
    ```
    
    That would let me test with `rebol` and compile and run with `red`, barring major language differences.
    
    I'd be happy to work on fixing/adding this feature if pointed in the right direction.

--------------------------------------------------------------------------------

On 2017-02-23T06:00:18Z, dockimbel, commented:
<https://github.com/red/red/issues/2440#issuecomment-281902774>

    Thanks for the detailed reporting. We will address all the command-line arguments related issues in the next days, so it will be fixed for the release of 0.6.2.

--------------------------------------------------------------------------------

On 2017-03-07T10:55:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2440#issuecomment-284689113>

    Now all the known issues with command-line arguments retrieving should be fixed, and it should behave as close to Rebol as possible. We have tested on both Windows and Linux, though we don't have CentOS, so let us know if it still has issues on that OS.

--------------------------------------------------------------------------------

On 2017-03-07T16:40:04Z, cromo, commented:
<https://github.com/red/red/issues/2440#issuecomment-284778354>

    Thanks for working on this - I'll give it a shot on my Ubuntu box later.
    
    Sadly, the `red-07mar17-5ea07af` build (two commits down the line from this one) is still misbehaving for me on CentOS:
    
    ```
    $ ./red-07mar17-5ea07af
    
    *** Runtime Error 1: access violation
    *** at: 080967FEh
    ```
    
    While the `./red-061` binary works happily:
    
    ```
    $ ./red-061
    --== Red 0.6.1 ==--
    Type HELP for starting information.
    
    red>>
    ```
    
    This a separate issue though.

--------------------------------------------------------------------------------

On 2017-03-08T02:28:06Z, cromo, commented:
<https://github.com/red/red/issues/2440#issuecomment-284927227>

    I just tested on my Xubuntu 16.04 system, and there are a few issues. The biggest one being that I get a compilation error now when compiling, and when interpreting, quoted strings are not respected correctly.
    
    Interpreter:
    
    ```shell
    $ ./red-07mar17-5ea07af hello-args.red hi there 'double "quotes"'
    Compiling compression library...
    Compiling Red console...
    system/options/args: ["hi" "there" "double" "quotes"]
    system/script/args: "hi there double quotes"
    ```
    
    Compilation:
    
    ```shell
    $ ./red-07mar17-5ea07af -c hello-args.red                        
    
    -=== Red Compiler 0.6.1 ===- 
    
    Compiling /home/cromo/scratch/red/hello-args.red ...
    ...using libRedRT built on 18-Feb-2017/22:04:24-6:00
    ...compilation time : 20 ms
    
    Target: Linux 
    
    Compiling to native code...
    *** Compilation Error: undefined symbol: get-cmdline-args 
    *** in file: %/home/cromo/scratch/red/hello-args.red 
    *** at line: 326 
    *** near: [get-cmdline-args 
        #script %/home/cromo/scratch/red/hello-args.red 
        either all [
            object/unchanged? ~system 192 
            object/unchanged2? ctx191 12 233
        ] [word/set-in-ctx ctx232 4] [
            stack/mark-func ~eval-set-path 
            if stack/arguments > stack/bottom [stack/push stack/arguments - 1] 
            set-path* eval-path _context/get ~system as cell! ~script as cell! ~args 
            stack/unwind
        ]
    ]
    ```
    
    The scripting output is a significant improvement, but the last argument in my example incorrectly gets split on the space passed as two arguments to the script. I would consider the compilation error enough of a problem to re-open this issue.

--------------------------------------------------------------------------------

On 2017-03-08T04:48:37Z, dockimbel, commented:
<https://github.com/red/red/issues/2440#issuecomment-284946027>

    @cromo You need to clean the older prebuilt version of libRedRT first (it's not done yet automatically on upgrades) using: 
    ```
    $ red clear
    ```
    Then try compiling again.
    
    We will investigate the single quoted strings mismanagement today.

--------------------------------------------------------------------------------

On 2017-03-08T13:48:09Z, cromo, commented:
<https://github.com/red/red/issues/2440#issuecomment-285044593>

    Clearing out the old libRedRT worked. The compiled and interpreted versions are now consistent with each other.

--------------------------------------------------------------------------------

On 2017-03-09T23:12:43Z, x8x, commented:
<https://github.com/red/red/issues/2440#issuecomment-285514858>

    Please have a look at my comments here https://github.com/red/red/commit/24b98f81e5ff0ae6528b17e5ff768b40e70df6ca

--------------------------------------------------------------------------------

On 2017-03-11T11:47:36Z, dockimbel, commented:
<https://github.com/red/red/issues/2440#issuecomment-285861830>

    Here is how it works after latest changes:
    ```
    $ ./console hello-args.red hi there 'double "quotes"'
    *** Error: cannot access argument file
    --== Red 0.6.1 ==-- 
    Type HELP for starting information. 
    
    red>> system/options/args
    == ["hello-args.red" "hi" "there" {double "quotes"}]
    red>> system/script/args
    == {hello-args.red hi there 'double "quotes"'}
    ```

--------------------------------------------------------------------------------

On 2017-03-11T22:30:37Z, cromo, commented:
<https://github.com/red/red/issues/2440#issuecomment-285905433>

    Using `red-11mar17-145e050` I'm getting inconsistencies again.
    
    Interactive console:
    
    ```
    $ ./red-11mar17-145e050 hi there 'double "quotes"'
    *** Error: cannot access argument file
    --== Red 0.6.1 ==-- 
    Type HELP for starting information. 
    
    red>> system/options/args
    == ["hi" "there" "double" "quotes"]
    red>> system/script/args
    == "hi there double quotes"
    ```
    
    Interpreted script:
    
    ```
    $ ./red-11mar17-145e050 hello-args.red hi there 'double "quotes"'          
    system/options/args: ["hi" "there" "double" "quotes"]
    system/script/args: "hi there double quotes"
    ```
    
    Compiled program:
    
    ```
    $ ./hello-args hi there 'double "quotes"'                                  
    system/options/args: ["hi" "there" {double "quotes"}]
    system/script/args: {hi there 'double "quotes"'}
    ```
    
    Of these, the compiled program is the closest to the Rebol values. The only difference is that the quoted string in Rebol does not get extra quotes around it for `system/script/args`. The interactive console and the interpreted script are giving the same output as my [previous comment](https://github.com/red/red/issues/2440#issuecomment-284927227), so the quoted input is still getting split on spaces.

--------------------------------------------------------------------------------

On 2017-03-13T13:13:12Z, dockimbel, commented:
<https://github.com/red/red/issues/2440#issuecomment-286102941>

    @cromo Please give it a new try, it should be fixed now.

--------------------------------------------------------------------------------

On 2017-03-17T04:18:00Z, cromo, commented:
<https://github.com/red/red/issues/2440#issuecomment-287262974>

    Using `red-16mar17-5b7ba8d` all modes of operation produce the same results. It's still slightly different than Rebol, but this is usable.
    
    For completeness' sake, Red's output:
    ```
    system/options/args: ["hi" "there" {double "quotes"}]
    system/script/args: {hi there 'double "quotes"'}
    ```
    
    Rebol's output:
    ```
    system/options/args: ["hi" "there" {double "quotes"}]
    system/script/args: {hi there double "quotes"}
    ```
    
    The only difference is that Red is putting extra quotes around arguments that have spaces in them in `system/script/args`.

