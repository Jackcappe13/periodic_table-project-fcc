# periodic_table-project-fcc
For this solution I worked first on getting the solution to work without checking for the value of the arguments.
Then I applied the same solution for arguments as digits or strings. Using correct values as arguments when running the program.
Then I checked if the value inserted was in the database with [[ -z $ATOMIC_NUMBER ]]. At this point the solution passed the test, and this is file element.sh.
Then I refactored the code such that there was no duplicate code for when argument is an the atomic number, name or sybmol of an element. This is done in element.sh(1) file.
I prefer to include both files, because the test was passed with element.sh but I figured already while writing it that I could refactor the code such as in element.sh(1).
