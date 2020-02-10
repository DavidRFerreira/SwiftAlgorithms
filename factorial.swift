// Algorithm For Calculating the Factorial of a Given Number.

import Foundation

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

//####### MAIN #######
let numberToCalculate = 5 // change here.

print(factorial(number: numberToCalculate))

