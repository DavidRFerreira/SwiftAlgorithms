// Algorithm For Calculating the nth number in the Fibonacci Sequence.

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
