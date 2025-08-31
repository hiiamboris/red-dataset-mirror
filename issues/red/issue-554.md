
#554: Bitwise operators not working on logic! values
================================================================================
Issue is closed, was reported by dockimbel and has 4 comment(s).
[status.built] [status.tested] [type.bug] [Red/System] [test.written]
<https://github.com/red/red/issues/554>

Bitwise operators (AND, OR, XOR) crash the Red/System compiler when used with logic! values.

Example code:

```
a: yes
b: yes
probe a xor b
```



Comments:
--------------------------------------------------------------------------------

On 2013-11-01T22:53:26Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/554#issuecomment-27607296>

    Just this week I wondered if they were supposed to.

--------------------------------------------------------------------------------

On 2013-11-01T23:00:26Z, dockimbel, commented:
<https://github.com/red/red/issues/554#issuecomment-27607587>

    I am surprized we missed such cases in the tests suite...

