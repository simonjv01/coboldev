       identification division.
       program-id. obtainInput.
       author. simon vargas.
      * This program obtains input from the user and displays it.    
       environment division.
       data division.
       working-storage section.
       01 name pic a(20).

       procedure division.
      *> cobol-lint CL002 0100-start-here
             0100-start-here.
                display "Enter your name: ".
                accept name.
                display "Hello, " name "!".
                display "Welcome to the COBOL world!".
       stop run.
       end program obtainInput.
       