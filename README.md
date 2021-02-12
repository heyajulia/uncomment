# uncomment

I wrote this program because I wanted to be able to read the source code of
the Lox VM without all of the various directives (and commented-out code) that
are used by the build system.

Because I want to place the contents of this entire repository in the public
domain, I don't include the source code of the Lox VM here (which is licensed
under the—still very permissive—MIT license). Even if it is legally possible,
I think that's a trade-off worth making, because the Lox VM is very actively
developed and the "uncommented" source code in this repo would quickly go out
of date.

Thankfully, it's easy to "uncomment" the source code (that's the point!):

```bash
~$ git clone --depth 1 https://github.com/munificent/craftinginterpreters
~$ git clone --depth 1 https://github.com/heyajulia/uncomment
~$ cd craftinginterpreters/c
~/craftinginterpreters/c$ perl ../../uncomment/uncomment.pl *.c *.h
```
