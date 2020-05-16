// Selection Sort Algorithm

/* This algorithm repeatedly finds the smallest element from the unsorted part 
 * and puts it at the beginning.
 * In every complete iteration over the array (the inside-loop), the minimum element
 * of the unsorted part is picked and placed on the sorted part of the array.
 *
 * In the worst-case scenario, this algorithm takes O(n^2).
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
    for i in 0...sizeArray-1 { numbers[i] = Int.random(in: 0..<3000) }
}


// Iterates over the array passed as an argument and prints all its values.
func printArrayNumbers(numbers: [Int])
{
    for number in numbers { print(numbers) }
}





//*****************************************
//******** SelectionSort Functions ********
//*****************************************

// Selection Sort Primary Function.
func selectionSort(numbers: inout[Int])
{
    var smallestElementIndex : Int
    
    for i in 0..<numbers.count - 1
    { 
        // In the beginning, we always consider the first element of the unsorted part as the smallest item.
        smallestElementIndex = i
        
        // Search for the smallest element still not sorted.
        for j in i+1..<numbers.count
        {
            if (numbers[j] < numbers[smallestElementIndex])
            {
                smallestElementIndex = j
            }
        }
        
        /* After finding that smallest element of the unsorted part, the algorithm is going 
         * to insert that number in the first position of the unsorted part.
        */
        swap(numbers: &numbers, firstIndex: smallestElementIndex, secondIndex: i)
    }
}


// Swap the position of the items in the index passed as arguments.
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

print("\nUnsorted Array:")
printArrayNumbers(numbers: arrayNumbers)

selectionSort(numbers: &arrayNumbers)

print("\nSorted Array:")
printArrayNumbers(numbers: arrayNumbers)
