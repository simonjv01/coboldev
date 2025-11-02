       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPLOYEE-SALARY-PROCESSOR.
       AUTHOR. YOUR-NAME.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO "/Users/input.txt".
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-FILE ASSIGN TO "/Users/output.txt".
                ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
       01 INPUT-RECORD.
           05 I-EMP-ID          PIC 9(5).
           05 FILLER          PIC X(1) VALUE SPACE.
           05 I-EMP-NAME        PIC X(20).
           05 FILLER          PIC X(1) VALUE SPACE.
           05 I-EMP-SALARY      PIC 9(7)V99.

       FD OUTPUT-FILE.
       01 OUTPUT-RECORD.
           05 EMP-ID          PIC 9(5).
           05 FILLER          PIC X(1) VALUE SPACE.
           05 EMP-NAME        PIC X(20).
           05 FILLER          PIC X(1) VALUE SPACE.
           05 EMP-SALARY      PIC 9(7)V99.
           05 FILLER          PIC X(1) VALUE SPACE.
           05 RUNNING-TOTAL   PIC 9(9)V99.
           05 FILLER          PIC X(32) VALUE SPACE.

       WORKING-STORAGE SECTION.
       01 EOF-FLAG           PIC X VALUE 'N'.
           88 END-OF-FILE     VALUE 'Y'.

       01 TOTAL-SALARY       PIC 9(12)V99 VALUE ZERO.
       01 RECORD-COUNT       PIC 9(5) VALUE ZERO.
   

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Starting Employee Salary Processing..."
           OPEN INPUT INPUT-FILE.
           OPEN OUTPUT OUTPUT-FILE.

      * Initialize running total
           MOVE ZERO TO TOTAL-SALARY.
           MOVE ZERO TO RECORD-COUNT.

      * Process each record
           PERFORM UNTIL END-OF-FILE
               READ INPUT-FILE INTO INPUT-RECORD
                   AT END MOVE 'Y' TO EOF-FLAG
                   NOT AT END
                       PERFORM PROCESS-RECORD
               END-READ
           END-PERFORM.

      * Display final summary
           DISPLAY "Processing completed."
           DISPLAY "Total Employees Processed: " RECORD-COUNT.
           DISPLAY "Final Running Total: " TOTAL-SALARY.

           CLOSE INPUT-FILE.
           CLOSE OUTPUT-FILE.
           STOP RUN.

       PROCESS-RECORD.
      * Increment record counter
           ADD 1 TO RECORD-COUNT.

      * Add current salary to running total
           COMPUTE TOTAL-SALARY = TOTAL-SALARY + I-EMP-SALARY.

      * Move input record to output record with proper formatting
           MOVE I-EMP-ID TO OUTPUT-RECORD.
           MOVE I-EMP-NAME TO OUTPUT-RECORD.
           MOVE I-EMP-SALARY TO OUTPUT-RECORD.
           MOVE TOTAL-SALARY TO RUNNING-TOTAL.


      * Write to output file
           WRITE OUTPUT-RECORD.



       END PROGRAM EMPLOYEE-SALARY-PROCESSOR.
