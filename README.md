# uncomment

**uncomment** strips comments from the source of the [`clox`][clox] VM. It is
regularly tested to make sure a change to `clox` doesn't break the script.

You can use it like so:

```bash
~$ git clone --depth 1 https://github.com/munificent/craftinginterpreters
~$ git clone --depth 1 https://github.com/heyajulia/uncomment
~$ cd craftinginterpreters/c
~/craftinginterpreters/c$ raku ../../uncomment/uncomment.raku *.c *.h
```

[clox]: https://github.com/munificent/craftinginterpreters
