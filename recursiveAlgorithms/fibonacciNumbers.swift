/* Algorithm For Calculating the nth number in the Fibonacci Sequence.
 * The Fibonacci Sequence is a series of numbers that begin with 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ....
*/

import Foundation

func fibonacciNumbers(position : Int) -> Int
{
    if (position <= 1)
    {
        return position
    }
    
    return (fibonacciNumbers(position: position - 1) + fibonacciNumbers(position: position - 2))
}

// ##### MAIN

let positionToCalcule = 9 // change here if you want to calculate other element of the Fibonnaci Series.

print(fibonacciNumbers(position: positionToCalcule))
