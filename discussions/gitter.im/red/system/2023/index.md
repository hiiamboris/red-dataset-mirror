# Archived messages from: [gitter.im/red/red/system](/gitter.im/red/red/system/) from year: 2023

## Sunday 12nd February, 2023

ProDimSum

[05:48](#msg63e87db4f209f7211190f305)is there a way to produce object file like c without target

greggirwin

[06:32](#msg63e888005357366b727e1555)Not at this time.

ProDimSum

[08:11](#msg63e89f43450b707d6f528c3c)thanks @greggirwin

[08:20](#msg63e8a158b1f15b2e623a2335)@greggirwin is there any plan to support it? Few more question can you provide link to red/system where is compiler and linker ? In this link doc https://static.red-lang.org/red-system-specs.html it mentioned "Red/System is a dialect (DSL) of the Red programming language" does it mean red/system, compiler, linker are written in red?

rebolek

[09:01](#msg63e8aad0ee00e6232c134ba4)compiler is written in Rebol2

ProDimSum

[09:21](#msg63e8af9dcd508f5c5ffcde11)https://github.com/red/red/blob/master/system/compiler.r this one right? @rebolek

[09:24](#msg63e8b04f9798d11e2c64a20a)what emitter.r do?

rebolek

[10:11](#msg63e8bb4cf209f721119156e2)@ProDimSum yes, there, but it's not only `compiler.r` file, `emitter.r` is also part of compiler. This is the main file that does compilation https://github.com/red/red/blob/master/red.r

ProDimSum

[10:13](#msg63e8bbc28e6e0d2338f9c70d)job of emitter.r? @rebolek

rebolek

[10:13](#msg63e8bbd35c491121283803b4)it emits machine code

ProDimSum

[10:17](#msg63e8bca29798d11e2c64baec)whatever I am reading on internet (object code=machine code) if emitter does produce machine code = object code that means r/s can do produce o file somehow right @rebolek

[10:32](#msg63e8c027a6a7c26b6b3c50a8)or we need i386-X86 code generator

[10:51](#msg63e8c4a1a6a7c26b6b3c5867)https://www.youtube.com/watch?v=fMeTqPyrNF4 do we have ffi for red?

[10:52](#msg63e8c4dcf209f72111916b3c)FFI (Foreign Function Interface)

hiiamboris:tchncs.de

[11:56](#msg63e8d3d07648e47d55d9e167)https://static.red-lang.org/red-system-specs.html#section-15

luce80

[15:23](#msg63e9047ad97eaa59cd056084)That is shared library loading for R/S. I wish there will be FFI for Red in the near future.

hiiamboris:tchncs.de

[16:05](#msg63e90e49d97eaa59cd057190)what do you call FFI? @luce80

## Monday 13th February, 2023

ProDimSum

[05:49](#msg63e9cf72e903521e266d3fb5)https://gist.github.com/ProDimSum/28f5bc0f37fd8c90dd5256a12321f336

[05:49](#msg63e9cf81bc9d0759c16a17c6)judge me

[05:51](#msg63e9cfc6a2d58f2e48758074)ways to improve and correct my misunderstanding ?

[05:53](#msg63e9d05de903521e266d4165) and good evening to everyone
