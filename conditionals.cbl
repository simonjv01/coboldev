       identification division.
       program-id. ConditionalsExample.

       data division.
       working-storage section.
           01  ws-num1 pic 9(2).     
           01  ws-num2 pic 9(2).

       procedure division.
           move 10 to ws-num1.
           move 20 to ws-num2.
           display "If Program Practical".
           if ws-num1 > ws-num2
               display "ws-num1 is greater than ws-num2"
           else
               display "ws-num1 is not greater than ws-num2"
           end-if.
               
               
       end program ConditionalsExample.

