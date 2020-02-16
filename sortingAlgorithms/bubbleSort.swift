// Bubble Sort Algorithm.

/*
 It picks elements one by one and compares them with the elements before them in the array. By doing that, if the element selected is smaller
 than an element before him, it is moved to the left. So, this algorithms places the elements selected to the right position where it belongs
 in the sorted array.
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


//*** MAIN ***
var arrayNumbers = [Int](repeating: 0, count:sizeOfArray)

populateArrayRandomly(sizeArray: sizeOfArray, numbers: &arrayNumbers)

print("Unsorted Array:")
printArrayNumbers(numbers: arrayNumbers)

bubbleSort(numbers: &arrayNumbers, size: sizeOfArray)

print("Sorted Array:")
printArrayNumbers(numbers: arrayNumbers)

