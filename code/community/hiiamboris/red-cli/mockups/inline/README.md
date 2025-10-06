# Inline Tool

The tool you need to compile scripts with multiple dependencies.

Download binaries:
- [Win32](https://link.storjshare.io/raw/jx4mhyld6tltxxfjekouysbhziwa/bin/inline.exe)
- [Linux x86](https://link.storjshare.io/raw/jx4mhyld6tltxxfjekouysbhziwa/bin/inline)
- [Mac x86](https://link.storjshare.io/raw/jx4mhyld6tltxxfjekouysbhziwa/bin/inline-mac)

```
$ inline --help
inline tool 30-Aug-2024 Prepare script for compilation by embedding all of it's dependencies

Syntax: inline [options] <script> <output>

Options:
                <script>   Source .red script
                <output>   Output with all of it's dependencies embedded
  -a, --assert             Do not strip #assert directives
  -e, --expand             Expand (preprocess) the output; involves LOAD!
  -t            <platform> Specify target platform
      --version            Display program version and exit
  -h, --help               Display this help text and exit
```
