       identification division.
       program-id. ifpgrm.
       
       environment division.

       data division.
       working-storage section.
           01 ws-num1 pic 9(2).
           01 ws-num2 pic 9(2).
           01 ws-result pic 9(3).
       procedure division.
              display "Start of If-Then-Loops Example".

              *> Using IF statement to compare two numbers
              move 15 to ws-num1
              move 10 to ws-num2

              if ws-num1 > ws-num2
                  display "ws-num1 is greater than ws-num2"
              else
                  display "ws-num1 is not greater than ws-num2"
              end-if.

      *>   Using a PERFORM loop to calculate the sum of first 5 natural
      *     numbers
              move 0 to ws-result
              perform varying ws-num1 from 1 by 1 until ws-num1 > 5
                  add ws-num1 to ws-result
              end-perform.

           display "The sum of the first 5 natural numbers is: " 
                     ws-result.
              display "End of If-Then-Loops Example".
              stop run.

           end program ifpgrm.
           