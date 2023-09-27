### Building a command-line tool

There is a third Python file in `src`, `src/main.py`, that will show you have to build a command-line program in Python. Generally, you can run any Python code by calling `python3` with the file that contains the code, e.g.

```sh
> python3 foo.py
```

will run any code in the file `foo.py`. However, there is a little more to writing command-line tools than this. For a tool to be useful, the user needs a mechanism to provide input to program, in some case also a way to provide optional flags, and the user needs to get the results of running the code back.

The way the user informs the program about which flags/options to use and where to find input and where to write output is through command-line arguments, and the actual data that goes into the program and comes out again goes through files (or "streams", which are essentially the same thing).

The file `src/main.py` shows you a very rudementary way of handling this in Python; in later projects we will see more advanced (and better) techniques.

You do not need to modify much in this file, but I encourage you to read it, to get an idea about how you can turn your own code into something that works as a command-line tool. It won't be long before you will need to know how to do this.

For this project, once you have implemented the functions in `src/codons.py`, you can use `src/main.py` as a command-line tool. It can take its input from `stdin` and write to `stdout`, but we need to improve the interface a bit. We want to be able to call it in three different ways--the source code explains how this works--depending on how you want to specify the input and where you want the output to go.

If you use the program without any arguments, it will read the input from `stdin` and write it to `stdout`, so you could use it in a pipeline as

```sh
> cat data/seqs.in | python3 src/main.py
```

or

```sh
> python3 src/main.py < data/seqs.in
```

to write the translated sequence from `data/seqs.in` to the terminal.

If you want the output to go to a file, you must redirect it

```sh
> python3 src/main.py < data/seqs.in > output.out
```

That is a very primitive interface, and a user will typically expect that a program that can read a file can also take a filename as an argument, and while not all programs accept a filename for the output, it is common enough that we should consider providing it.

You should be able to provide the input file directly to the program if you give it a single argument:

```sh
> python3 src/main.py data/seqs.in
```

and it will, again, write the translated sequences from `seqs.in` to the terminal.

If you provide two file-arguments to the tool, it should read the input data from the first file and write the output to the second file.

```sh
> python3 src/main.py data/seqs.in my-output.out
```

The arguments that a program gets are put in `sys.argv`, with the name of the program at `sys.argv[0]` and any following arguments after that. The number of real arguments this thus always `len(sys.argv) - 1`. You can test how many you have by checking `len(sys.argv)`:

```python
if len(sys.argv) == 1:
    # zero arguments -- use stdin and stdout
elif len(sys.argv) == 2:
    # one argument -- use sys.argv[1] instead of stdin
elif len(sys.argv) == 3:
    # two arguments -- use sys.argv[1] for input and sys.argv[2] for output
else:
    # more than two arguments; that is an error
```

To open an input file, a file you want to read from, use `open("filename")` or `open("filename", "r")`, and to open an output file, a file you want to write to, use `open("filename", "w")`.

 - [ ] Extend the program such that if `len(sys.argv) in [2, 3]`, the program should read from a file you open as `open(sys.argv[1])`.
 - [ ] Extend the program such that if `len(sys.argv) == 3`, the program should write to a file you open as `open(sys.argv[2], "w")`.

 If you have more than two arguments, terminate the program with `sys.exit(1)` to indicate an error.

We are not doing any sensible tests in the arguments in this project, so you will not get user-friendly error messages if you provide input files that do not exist, or try to write to a file you do not have permission to write to. That is something we will improve upon in later projects.

Writing `python3 program.py` to run the program `program.py` doesn't look like other programs on the command-line, where we would usually just write `program` to run `program`. There isn't anything wrong with that, it just says that we use Python to execute the program. There are, however, ways of making Python programs look more like other programs. Several, in fact. But, you guessed it, we leave that for future projects. We have already covered a lot in one project, and once you have everything up and running, you can pad yourself on the shoulders and take a short break before we continue.