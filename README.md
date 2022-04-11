# uncomment

**uncomment** strips comments from the source code of [jlox][] and [clox][].

Use it like this strip comments from clox:

```bash
~$ git clone --depth 1 https://github.com/munificent/craftinginterpreters
~$ git clone --depth 1 https://github.com/heyajulia/uncomment
~$ cd craftinginterpreters/c
~/craftinginterpreters/c$ raku ../../uncomment/uncomment.raku *.c *.h
```

[jlox]:
  https://github.com/munificent/craftinginterpreters/tree/master/java/com/craftinginterpreters
[clox]: https://github.com/munificent/craftinginterpreters/tree/master/c
