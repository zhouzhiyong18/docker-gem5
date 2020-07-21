docker-gem5
===========

Dockerfile for automated gem5 build from public repositories on gem5.org

- gem5 source directory is put in `/usr/local/src/gem5`
- gem5 binary is in `/usr/local/bin/gem5.opt`

for more information visit http://gem5.org

## Usage

download the repo

```
git clone https://github.com/zhouzhiyong18/docker-gem5.git
```

enter the directory

```
cd docker-gem5
```

build the image

```
$ docker build . -t <name:tag>
```

run a container

```
$ docker run --rm -it <name:tag> bash
```

then, simulate the simple program with `gem5.opt`

```
root@7b0af4288513:~# gem5.opt /usr/local/gem5/configs/learning_gem5/part1/simple.py
```

and you should see the following output

```
warn: CheckedInt already exists in allParams. This may be caused by the Python 2.7 compatibility layer.
warn: Enum already exists in allParams. This may be caused by the Python 2.7 compatibility layer.
warn: ScopedEnum already exists in allParams. This may be caused by the Python 2.7 compatibility layer.
gem5 Simulator System.  http://gem5.org
gem5 is copyrighted software; use the --copyright option for details.

gem5 version 20.0.0.3
gem5 compiled Jul 21 2020 10:06:26
gem5 started Jul 21 2020 12:08:47
gem5 executing on 7b0af4288513, pid 39
command line: gem5.opt learning_gem5/part1/simple.py

Global frequency set at 1000000000000 ticks per second
warn: No dot file generated. Please install pydot to generate the dot file and pdf.
warn: DRAM device capacity (8192 Mbytes) does not match the address range assigned (512 Mbytes)
0: system.remote_gdb: listening for remote gdb on port 7000
Beginning simulation!
info: Entering event queue @ 0.  Starting simulation...
Hello world!
Exiting @ tick 493101000 because exiting with last active thread context
```
