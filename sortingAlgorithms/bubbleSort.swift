// Bubble Sort Algorithm.

/*
This algorithm starts by comparing the first and second element of the array 
and if the first is greater than the second element, it will swap both elements.
Then, it compares the second and third element, and so on...
 */

import Foundation


let sizeOfArray : Int = 20
var partitionIndex: Int = 0




//*************************************
//******** Auxiliary Functions ********
//*************************************

// Inserts random numbers into an array passed as an argument.
func populateArrayRandomly(sizeArray: Int, numbers: inout [Int])
{
    for i in 0...sizeArray-1
    {
        numbers[i] = Int.random(in: 0..<3000)
    }
}

// Iterates over the array passed as an argument and prints all its values.
func printArrayNumbers(numbers: [Int])
{
    for number in numbers
    {
        print(number)
    }
}





//***************************************
//******** Bubble Sort Functions ********
//***************************************

func bubbleSort(numbers: inout[Int], size : Int)
{
    
    for _ in 0...(size - 1)
    {
        for j in 1...(size - 1)
        {
            if (numbers[j] < numbers[j - 1])
            {
                swap(numbers: &numbers, firstIndex: j, secondIndex: j - 1)
            }
        }
    }
}

func swap(numbers: inout[Int], firstIndex: Int, secondIndex: Int)
{
    var numTemp : Int = 0
    
    numTemp = numbers[firstIndex]
    numbers[firstIndex] = numbers[secondIndex]
    numbers[secondIndex] = numTemp
    
}




//**********************
//******** MAIN ********
//**********************

var arrayNumbers = [Int](repeating: 0, count:sizeOfArray)

populateArrayRandomly(sizeArray: sizeOfArray, numbers: &arrayNumbers)

print("Unsorted Array:")
printArrayNumbers(numbers: arrayNumbers)

bubbleSort(numbers: &arrayNumbers, size: sizeOfArray)

print("Sorted Array:")
printArrayNumbers(numbers: arrayNumbers)

