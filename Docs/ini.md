# ini.sh

Author: Paul Marks

## To run

`ini.sh [option] <filename>`

## Functionality

ini.sh uses the scripts in the directory ini/ to initialize files.

- inipy initializes python files
- inijava initializes java files
- inijs initializes javascript files
- inis initializes MIPS files
- inish initializes bash script files
- inimd initializes markdown files
- inic initializes c files
  - -h to include header file of the same name
  - -m to add main function

ini.sh also uses a custom environment variable NAME to remember what name goes onto files. If NAME is
empty, then the script will prompt the user for a name, and save the export command to the users .bashrc
file.

Options
- -c: The user will be prompted for new name to be saved.
- -t: The user will be prompted for a temporary name to put on these 
files

If initializing a bash script file, the user will be asked if they want to delete the .sh extension on 
the file.
