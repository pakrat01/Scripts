#!/bin/bash

##initialize a file/group of files

#exit 1: usage error

##getName function
#creates/updates a name variable
getName () {
    #while name is empty
    while [ -z "$nm" ]; do
        read -rp "What name do you want on your files? > " nm
    done

    echo "export NAME='$nm'" >> ~/.bashrc
    export NAME="$nm"
}

temp=0

##initial setup for script
if [ -z "$NAME" ]; then
    getName
fi

##change name
if [ "$1" = "-c" ]; then
    getName
    shift
fi

##use a different name for this/these file(s)
if [ "$1" = "-t" ]; then

    #while name is empty
    while [ -z "$nm" ]; do
        read -rp "What name do you want on your files? > " nm
    done

    #save name
    sv="$NAME"

    export NAME="$nm"
    temp=1
    shift
fi

##if no command line args
if [ $# -lt 1 ]; then
    echo "Usage: ini <file(s)/extension(s)>"
    exit 1
fi

##check the file extension
fiex=$1
for fiex in "$@"; do
    case "$fiex" in
        *.py) ~/bin/ini/inipy "$fiex" ;;
        *.java) ~/bin/ini/inijava "$fiex" ;;
        *.js) ~/bin/ini/inijs "$fiex" ;;
        *.s) ~/bin/ini/inis "$fiex" ;;
        *.sh) ~/bin/ini/inish "$fiex" ;;
        *) echo "file/extension not supported: $fiex"
            exit 1 ;;
    esac
done

##reset name if a temp was used
if [ "$temp" -eq 1 ]; then
    export NAME="$sv"
fi
