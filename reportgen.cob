       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILE-COPY-PROGRAM.
       AUTHOR. YOUR-NAME.
       DATE-WRITTEN. 2025-11-02.
      *****************************************************************
      * THIS PROGRAM READS RECORDS FROM AN INPUT FILE AND WRITES     *
      * THEM TO AN OUTPUT FILE                                        *
      *****************************************************************
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO '/Users/simonvargas/input.txt'
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-INPUT-STATUS.
           
           SELECT OUTPUT-FILE ASSIGN TO '/Users/simonvargas/output.txt'
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-OUTPUT-STATUS.
       
       DATA DIVISION.
       FILE SECTION.
       FD  INPUT-FILE.
       01  INPUT-RECORD            PIC X(80).
       
       FD  OUTPUT-FILE.
       01  OUTPUT-RECORD           PIC X(80).
       
       WORKING-STORAGE SECTION.
       01  WS-INPUT-STATUS         PIC XX.
       01  WS-OUTPUT-STATUS        PIC XX.
       01  WS-EOF-FLAG             PIC X VALUE 'N'.
           88  END-OF-FILE         VALUE 'Y'.
       01  WS-RECORD-COUNT         PIC 9(5) VALUE ZEROS.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 100-INITIALIZE
           PERFORM 200-PROCESS-FILE
           PERFORM 300-FINALIZE
           STOP RUN.
       
       100-INITIALIZE.
           DISPLAY '*** FILE COPY PROGRAM STARTED ***'
           OPEN INPUT INPUT-FILE
           IF WS-INPUT-STATUS NOT = '00'
               DISPLAY 'ERROR OPENING INPUT FILE. STATUS: ' 
                       WS-INPUT-STATUS
               STOP RUN
           END-IF
           
           OPEN OUTPUT OUTPUT-FILE
           IF WS-OUTPUT-STATUS NOT = '00'
               DISPLAY 'ERROR OPENING OUTPUT FILE. STATUS: ' 
                       WS-OUTPUT-STATUS
               CLOSE INPUT-FILE
               STOP RUN
           END-IF.
       
       200-PROCESS-FILE.
           PERFORM UNTIL END-OF-FILE
               READ INPUT-FILE
                   AT END
                       SET END-OF-FILE TO TRUE
                   NOT AT END
                       ADD 1 TO WS-RECORD-COUNT
                       MOVE INPUT-RECORD TO OUTPUT-RECORD
                       WRITE OUTPUT-RECORD
                       IF WS-OUTPUT-STATUS NOT = '00'
                           DISPLAY 'ERROR WRITING TO OUTPUT FILE'
                           DISPLAY 'STATUS: ' WS-OUTPUT-STATUS
                           SET END-OF-FILE TO TRUE
                       END-IF
               END-READ
           END-PERFORM.
       
       300-FINALIZE.
           CLOSE INPUT-FILE
           CLOSE OUTPUT-FILE
           DISPLAY '*** FILE COPY COMPLETED ***'
           DISPLAY 'TOTAL RECORDS PROCESSED: ' WS-RECORD-COUNT
           DISPLAY '*** PROGRAM ENDED SUCCESSFULLY ***'.