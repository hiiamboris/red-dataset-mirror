
#1186: Red console output includes incorrect "invisibles".
================================================================================
Issue is open, was reported by PeterWAWood and has 6 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/1186>

It was possible to drive the "old" Red console from a Unix pseudo terminal. The "new" console does not play nicely with the Unix pseudo terminal. The issue appears to be related to the invisible characters output by the new console. 

This selected strace output highlights the issue:

```
The old console:
 write(0x7, "red>> #\"a\" \r\n== #\"a\"\r\nred>> #\"\303\250\" \r\n== #\"\303\250\"\r\nred>> #\"^(10)\" \r\n== #\"^P\"\r\nred>> #\"^(20AC)\" \r\n== #\"\342\202\254\"\r\nred>> #\"^(01D122)\"\r\n== #\"\360\235\204\242\"\r\nred>> \0", 0x8D)     = 141 0
The new console: 
write(0x7, "red>> \r\033[6C\r\033[0Jred>> #\r\033[7C\r\033[0Jred>> #\"\r\033[8C\r\033[0Jred>> #\"a\r\033[9C\r\033[0Jred>> #\"a\"\r\033[10C\r\033[0Jred>> \0", 0x61)         = 97 0
```

I can provided more data and the code I used to control the console if needed.



Comments:
--------------------------------------------------------------------------------

On 2016-05-11T03:57:17Z, dockimbel, commented:
<https://github.com/red/red/issues/1186#issuecomment-218355713>

    @PeterWAWood Does this issue still exists? If yes, could you give an example of what is wrong with the console in practice?

--------------------------------------------------------------------------------

On 2016-05-11T07:01:12Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1186#issuecomment-218378294>

    Unfortunately, the issue still exists. Here is a cut down example of the Ruby script that I used to drive the Red console via the UNIX pseudo terminal. First, it shows a working example using the old terminal and then an example using the second terminal:
    
    ``` Ruby
    require 'pty'
    require 'expect'
    
    puts 'Console from 24-Jun-2014'
    
    PTY.spawn("./console") do |reader, writer, pid|
      reader.expect('red>> ')[0]
      writer.puts('a: 1')
      r = reader.expect('red>> ')[0]
      puts r
      puts 'debug print of output received from Red console:'
      p r
    end
    
    puts 'Latest console'
    
    PTY.spawn("./new-console") do |reader, writer, pid|
      reader.expect('red>> ')[0]
      writer.puts('a: 1')
      r = reader.expect('red>> ')[0]
      puts r
      puts 'debug print of output received from Red console:'
      p r
    end
    ```
    
    This is the output:
    
    ``` text
    mbp:code peter$ ruby check-console-output.rb
    Console from 24-Jun-2014
    a: 1
    == 1
    red>> 
    debug print of output received from Red console:
    "a: 1\r\n== 1\r\nred>> "
    Latest console
    red>> 
    debug print of output received from Red console:
    "\r\e[6C\r\e[0Jred>> "
    mbp:code peter$
    ```

--------------------------------------------------------------------------------

On 2018-04-20T08:27:08Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1186#issuecomment-383023843>

    I did a little further investigation and checked to confirm that Rebol can be used from a pty. The red console is still not putting correctly:
    ```text
    irb(main):041:0> def test_pty command
    irb(main):042:1> PTY.spawn(command) do |reader, writer, pid|
    irb(main):043:2* r = reader.expect(/>> /)[0]
    irb(main):044:2> writer.puts('print "Hello"')
    irb(main):045:2> r = reader.expect(/>> /)[0]
    irb(main):046:2> p r
    irb(main):047:2> end
    irb(main):048:1> end
    => :test_pty
    irb(main):049:0> test_pty 'rebol'
    "print \"Hello\"\r\nHello\r\n>> "
    => nil
    irb(main):052:0> test_pty './red-cli'
    "\r\e[3C\r\e[0J>> "
    => nil
    ```
    System info:
    ```text
    >> system/build
    == make object! [
        date: 20-Apr-2018/12:50:41+08:00
        git: none
        config
    >> probe system/platform
    make object! [
        name: "macOS Sierra 10.12.6"
        OS: 'macOS
        arch: 'x86-64
        version: 10.12.6
        build: "16G1314"
    ]
    ``` 
    

