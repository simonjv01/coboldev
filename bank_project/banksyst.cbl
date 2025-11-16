       identification division.
       program-id. banksyst.
       environment division.
       input-output section.
       file-control.
           select account-file assign to "/Users/simonvargas/accnts.dat"
               organization is indexed
               access mode is dynamic
               record key is account-number
               file status is fs-status.
       data division.
         file section.
           fd account-file 
               record contains 80 characters
               block contains 0 records
               label records are standard
                data record is account-record.
             01 account-record.
                 05 account-number      pic 9(5).
                 05 account-balance     pics 9(7)v99.        
         working-storage section.
           01 ws-account-record.
               05 ws-account-number      pic 9(5).
               05 ws-account-balance     pic 9(7)v99.
           01 ws-amount                  pic 9(7)v99.
           01 ws-transaction-type        pic x(1).
              88 ws-deposit            value 'D'.
              88 ws-withdrawal         value 'W'.
              88 ws-check-balance       value 'B'.
       procedure division.
           stop run.

