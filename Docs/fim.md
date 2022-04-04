# fim

Author: Paul Marks

## To run

`fim [directory] <filename>`

If directory is not specified, then fim will begin searching from the current directory.

## Functionality

fim uses find, grep, and vim to accomplish its goal.

- find is used to find any files matching the specified filename
- grep is used for a few purposes.
  - filtering out "Permission denied" messages
  - determining if the files were actually found, as find will exit with code '0' even if files don't 
  exist
- vim opens the files one by one

If file(s) are found, vim is used to open them one by one

Else, the user is asked if they would like to create the file, and if yes, then first ini.sh will be
used on the filename, and if that does not work, touch will be used to create the file.
