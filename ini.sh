#!/bin/bash

# Author: Paul Marks
# Date: October 2021

## ini.sh: Initialize a file/group of files

# exit 1: usage error

## getName function
# creates/updates a name variable
getName () {
    # while name is empty
    while [ -z "$nm" ]; do
        read -rp "What name do you want on your files? > " nm
    done

    export NAME="$nm"

    if [[ "$1" == "first" ]]; then
        echo "export NAME='$nm'" >> ~/.bashrc
    fi

    if [[ "$1" == "change" ]]; then
        sed -i "s/^export NAME=.*$/export NAME='$nm'/ ~/.bashrc"
    fi
}

getOptions () {
    # while the first argument is an option
    options=()
    shamt=0
    while [[ ${2:0:1} == "-" ]]; do
        options+="$2 "
        ((shamt++))
        shift
    done
}

temp=0

## initial setup for script
if [ -z "$NAME" ]; then
    getName "first"
fi

## change name
if [ "$1" = "-c" ]; then
    getName "change"
    shift
fi

## use a different name for this/these file(s)
if [ "$1" = "-t" ]; then

    # while name is empty
    while [ -z "$nm" ]; do
        read -rp "What name do you want on your files? > " nm
    done

    # save name
    sv="$NAME"

    export NAME="$nm"
    temp=1
    shift
fi

## if no command line args
if [ $# -lt 1 ]; then
    echo "Usage: ini <file(s)/extension(s)>"
    exit 1
fi

## check the file extension
while [[ $1 ]]; do
    fiex=$1
    case "$fiex" in
        *.py) ~/bin/ini/inipy "$fiex" ;;
        *.java) ~/bin/ini/inijava "$fiex" ;;
        *.js) ~/bin/ini/inijs "$fiex" ;;
        *.s) ~/bin/ini/inis "$fiex" ;;
        *.sh) ~/bin/ini/inish "$fiex" ;;
        *.md) ~/bin/ini/inimd "$fiex" ;;
        *.c) getOptions $@
             while [[ $shamt -gt 0 ]]; do ##so the options don't get run by `ini`
                 shift
                 ((shamt--))
             done
             ~/bin/ini/inic $fiex ${options[@]};;
        *) echo "file/extension not supported: $fiex"
            exit 1 ;;
    esac
    shift
done

## reset name if a temp was used
if [ "$temp" -eq 1 ]; then
    export NAME="$sv"
fi
