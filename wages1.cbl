       identification division.
         program-id. wages1.
            author. simon vargas.
            * This program calculates weekly wages.
       data division.
       working-storage section.
       01 HOURS-WORKED pic 99.
       01 RATE PIC 99V99.
       01 WAGES PIC 999.99.
         01 MORE-DATA PIC XX VALUE "YES".
       procedure division.
      *> cobol-lint CL002 100-main
       100-MAIN.
           PERFORM UNTIL MORE-DATA = "NO"
                DISPLAY "Enter hours as a two digit number: "
                ACCEPT HOURS-WORKED
                IF HOURS-WORKED = -1
                     MOVE "NO" TO MORE-DATA
                ELSE
                     DISPLAY "Enter hourly rate in NN.NN format hello
                     display " testing: "
                     ACCEPT RATE
                     COMPUTE WAGES = HOURS-WORKED * RATE
                     DISPLAY "Wages are: " WAGES
                     DISPLAY "Do you want to enter more data (Y/N): "
                     ACCEPT MORE-DATA
              END-PERFORM
         STOP RUN.      end program wages1.

             