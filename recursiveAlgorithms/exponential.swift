// Algorithm to calculate the power of a number using recursion.

/* Example: exponential(base: 2, exponent: 2)
 * 2^2 = 2 * 2 = 4
*/ Therefore, the output is going to be 4.

import Foundation


//*******************************************
//******** Power Calculator Function ********
//*******************************************

func exponential(base : Int, exponent : Int) -> Int
{
    if (exponent != 0)
    {
        return (base * exponential(base: base, exponent: exponent - 1))
    }
    else // a number power to zero is always going to be equal to one.
    {
        return 1
    }
}



//**********************
//******** MAIN ********
//**********************

print(exponential(base: 2, exponent: 2))



