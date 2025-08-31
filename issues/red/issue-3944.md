
#3944: usage of heredoc with QUIT as a delimiting identifier causes access violation
================================================================================
Issue is open, was reported by 9214 and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/3944>

**Describe the bug**
Usage of Red toolchain or console with [heredoc](https://en.wikipedia.org/wiki/Here_document) and `quit` as a delimiting identifier leads to allocator-related crash.

**To reproduce**
With console compiled in debug mode:
```shell
$ ./console << quit
> 1
> quit
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

== 
root: 3033/4660, runs: 0, mem: 3389944
*** Runtime Error 98: assertion failed
*** in file: .../red/runtime/allocator.reds
*** at line: 359
***
***   stack: red/free-node 00000062h
***   stack: red/free-node 2E3DB374h
***   stack: red/cross-compact-frame 0216A004h 01009428h
***   stack: red/collect-frames 1
***   stack: red/collector/do-mark-sweep
***   stack: red/collector/do-cycle
***   stack: red/alloc-series-buffer 1 1 0
***   stack: red/alloc-series 1 1 0
***   stack: red/alloc-bytes 1
***   stack: red/string/make 003BD0D4h 003BD0E4h 7
***   stack: red/actions/make 003BD0D4h 003BD0E4h
***   stack: red/actions/make*
***   stack: ask
***   stack: ctx419~run 00315A34h
***   stack: ctx419~launch 00315A34h
```
Entering only `quit` (or `q`) sends session into an infinite loop:
```text
$ ./console << q
> q
--== Red 0.6.4 ==-- 
Type HELP for starting information. 

root: 3033/4660, runs: 0, mem: 3389984 => 1509484, mark: 1.4ms, sweep: 3.4ms
root: 3033/4660, runs: 1, mem: 3390684 => 1509484, mark: 1.7ms, sweep: 3.2ms
root: 3033/4660, runs: 2, mem: 3390684 => 1509484, mark: 1.3ms, sweep: 3.0ms
root: 3033/4660, runs: 3, mem: 3390684 => 1509484, mark: 1.3ms, sweep: 3.3ms
root: 3033/4660, runs: 4, mem: 3390684 => 1509484, mark: 1.4ms, sweep: 3.0ms
root: 3033/4660, runs: 5, mem: 3390684 => 1509484, mark: 1.3ms, sweep: 3.3ms
root: 3033/4660, runs: 6, mem: 3390684 => 1509484, mark: 1.5ms, sweep: 3.0ms
root: 3033/4660, runs: 7, mem: 3390684 => 1509484, mark: 1.4ms, sweep: 3.3ms
root: 3033/4660, runs: 8, mem: 3390684 => 1509484, mark: 1.6ms, sweep: 3.4ms
^C
```

**Expected behavior**
REPL session should be closed without any errors.

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 23-Jul-2019/21:51:39+02:00 commit #613d71c
```


Comments:
--------------------------------------------------------------------------------

On 2019-07-24T16:31:59Z, qtxie, commented:
<https://github.com/red/red/issues/3944#issuecomment-514705715>

    What's the expected behavior when running the following command?
    ```
    $ ./console << "print 32"
    ```

--------------------------------------------------------------------------------

On 2019-07-24T17:04:43Z, 9214, commented:
<https://github.com/red/red/issues/3944#issuecomment-514717294>

    @qtxie hard to say, I guess print out `32` and then quit?

--------------------------------------------------------------------------------

On 2019-09-13T14:29:21Z, dumblob, commented:
<https://github.com/red/red/issues/3944#issuecomment-531259220>

    >What's the expected behavior when running the following command?
    >```sh
    >$ ./console << "print 32"
    >```
    
    Assuming [POSIX shell](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html ), then this is not valid syntax. The following would be valid:
    ```sh
    $ ./console << "print 32"
    print 32
    ```
    and wouldn't produce any character on output as the executable `./console` will open stdin and the first read from this stdin will return EOF and no bytes will be read. To feed `hello world` bytes one would need to use:
    ```sh
    $ ./console << "print 32"
    hello world
    print 32
    ```
    Note also, that POSIX shell syntax allows for continued code after the heredoc opening - e.g.
    ```sh
    cat <<\x another_arg_for_cat yet_another_arg_for_cat; echo some other code; false || {
    content of heredoc with $variable substitution ${disabled} due to the backslash specifier
    x
      echo this code is part of the opened brace above
    }  # let's close the brace
    echo and proceed further with the script
    ```
    But be careful - the backslash is an escape character and escaping has precedence over the opening heredoc preamble (might be unintuitive especially with standard shell delimiting characters like `"` or `'` etc.):
    ```sh
    variable=5
    enabled=9
    cat <<\'x'yz' another_arg_for_cat yet_another_arg_for_cat; echo some other code; false || {
    content of heredoc with working $variable substitution ${enabled}, yay!
    'xyz
      echo this is inside of braces
    }
    echo finally out of it
    ```

