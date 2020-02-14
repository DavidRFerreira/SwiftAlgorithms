// Algorithm to calculate the power of a number using recursion.

import Foundation

func exponential(base : Int, exponent : Int) -> Int
{
    if (exponent != 0)
    {
        return (base * exponential(base: base, exponent: exponent - 1))
    }
    else
    {
        return 1
    }
}



// ###### MAIN ######

print(exponential(base: 2, exponent: 2))



