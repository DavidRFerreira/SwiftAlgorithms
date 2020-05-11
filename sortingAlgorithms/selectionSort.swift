// Selection Sort Algorithm


/* Description of the Algorithm:
 Repeatedly finds the smallest element from the unsorted part and put it at the beginning.
 */

import Foundation


let sizeOfArray : Int = 20
var partitionIndex: Int = 0


func populateArrayRandomly(sizeArray: Int, numbers: inout [Int])
{
    for i in 0...sizeArray-1
    {
        numbers[i] = Int.random(in: 0..<3000)
    }
}


func printArrayNumbers(numbers: [Int])
{
    for number in numbers
    {
        print(number)
    }
}


func selectionSort(numbers: inout[Int])
{
    var smallestElementIndex : Int
    
    for i in 0..<numbers.count - 1
    {
        
        smallestElementIndex = i
        
        for j in i+1..<numbers.count
        {
            if (numbers[j] < numbers[smallestElementIndex])
            {
                smallestElementIndex = j
            }
        }
        
        
        swap(numbers: &numbers, firstIndex: smallestElementIndex, secondIndex: i)
    }
}


func swap(numbers: inout[Int], firstIndex: Int, secondIndex: Int)
{
    var numTemp : Int = 0
    
    numTemp = numbers[firstIndex]
    numbers[firstIndex] = numbers[secondIndex]
    numbers[secondIndex] = numTemp
    
}


//*** MAIN ***
var arrayNumbers = [Int](repeating: 0, count:sizeOfArray)

populateArrayRandomly(sizeArray: sizeOfArray, numbers: &arrayNumbers)

print("\nUnsorted Array:")
printArrayNumbers(numbers: arrayNumbers)

selectionSort(numbers: &arrayNumbers)

print("\nSorted Array:")
printArrayNumbers(numbers: arrayNumbers)
