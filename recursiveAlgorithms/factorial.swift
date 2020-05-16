// Algorithm for calculating the factorial of a given number.

/* Example: factorial(number: 4)
 * 4! = 4 * 3 * 2 * 1 = 24
 * Therefore, the output is going to be 24.
*/ 

import Foundation


//***********************************************
//******** Factorial Calculator Function ********
//***********************************************

func factorial(number : Int) -> Int
{
    if (number >= 1)
    {
        return (number * factorial(number: number - 1))
    }
    else
    {
        return 1
    }
}



//**********************
//******** MAIN ********
//**********************

let numberToCalculate = 5 

print(factorial(number: numberToCalculate))

