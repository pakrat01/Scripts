# Scripts

Author: Paul Marks

## Motivation

Every once in a while I find some things that are super useful, but are way too long to type, or a 
little complicated to remember. When this happens, I typically make a bash script to make the process
so much faster.

## Overview and Functionality

### ev

When I was using an ubuntu subsystem on a windows machine, I would forget to open an xServer before
trying to run `evince`, so this script checks if a server is running, and opens an xServer before trying
to open evince if no xServer is found to be running.

### vx

When I was using an ubuntu subsystem on a windows machine, it was a bit of a pain to open my xServer, 
since it was in my windows files instead of the files of the subsytem. This is a simple one-line script
to open the xServer for my so I don't have to type a long command.

### fim

I always forget how the syntax of `find` works in general, and since it has an extra functionality to
open a file in vim once it is found, I decided to make a script so I wouldn't have to type out such a
long command every time I wanted to take advantage of this.

To run:
`fim [directory/to/start/search/at] <file-to-search-for>`

If the file is found, then it will be opened in vim to edit. If it is not found, the script will ask
if you want to make the file. If you decide to make the file, this script will attempt to use the 
`ini.sh` script to initialize the file, and if that fails will just use `touch` to create the file.

### ini.sh

This script is one of my favorites I've made, as instead of shortening a long command, it initializes
the first few lines of a file that are always the same. 

As of Dec. 2021, it will initialize:

- java `inijava`
- python `inipy`
- javascript `inijs`
- bash script `inish`
- MIPS32 `inis`
- markdown `inimd`

To run:
`ini.sh <file(s)>`

This uses other scripts to initialize these files, as well as a global variable that it saves in the
users `.bashrc` file, which just holds the name the user wants for the "Author" field in files.

### mn && notes

The script `mn` makes a "notecard" that is saved in a file "notecards" and `notes` will show all 
notecards created and saved in the "notecards" file. 

### no

This script is like the command `yes`, but instead of printing "y" until it is killed, it prints "n"
until it is killed.

### full, one, and hide

`full`, `one`, and `hide` all interact with the PS1 environment variable in bash, to change how long/
short the bash prompt is on the terminal.

`full`
- Shows user@hostname:~/path/to/current$ 
- Has the functionality to change the color of the bash prompt with a command line argument
- Needs to be run before `one` and `hide` will work, suggested to have a line in bashrc `. full <color>`

`one`
- Shows user@hostname:current$

`hide`
- Shows >

I have found these useful, as typically I do not need the entire directory path to my working directory,
and there are times I am typing such long commands that they run into the next line.

These scripts have to be run with `source` or `.` since they interact with environment variables.

## Features to be Added:

- [x] A functionality for `inis` to ask if you want to keep the ".s" extension on the bash script file.
- [ ] `-r` option for `mn`
- [ ] A functionality to change the length of the notecards.
- [x] Move some `.bashrc` aliases to scripts.
  - [ ] tar stuff.
  - [ ] PS1 stuff.
    - [x] full.
    - [x] one.
    - [x] hide.
    - [ ] a way to actually save the settings set in the scripts.
- [ ] A `moveTo` script that uses the same functionality as `fim`, but instead of opening the files in
vim, it shows the files and asks which file to move to using the `cd` command.
- [ ] Change `fim` to show all matches and choose which file(s) to open.
