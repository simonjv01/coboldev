       identification division.
       program-id. ConditionalsExample.
       procedure division.
              display "Start of Conditionals Example".
    
              *> Simple IF statement
              if 5 > 3
                display "5 is greater than 3"
              end-if.
    
              *> IF-ELSE statement
              if 2 = 4
                display "2 is equal to 4"
              else
                display "2 is not equal to 4"
              end-if.
    
              *> IF-ELSE IF-ELSE statement
              if 10 < 5
                display "10 is less than 5"
              else if 10 = 10
                display "10 is equal to 10"
              else
                display "10 is greater than 5"
              end-if.
    
              display "End of Conditionals Example".
              stop run.

           end program ConditionalsExample.

