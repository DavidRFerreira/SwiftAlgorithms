// Quick Sort Algorithm
// Picking Last Element as Pivot.

/* Description of the Algorithm:
        It is a Divide and Conquer Algorithm.
        There are many different versions of the Quick Sort that pick pivot in different ways.
 
        Being x the pivot of an array (in the example bellow, x will always be the last element of the array), you put x at its correct position in sorted array and then putt all smaller elements before x and all greater elements after x.
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


// low is the starting index of the array
// high is the ending index of the array
func quickSort(numbers: inout[Int], low: Int, high: Int)
{

    if (low < high)
    {
        // pivot is the partioning index and with which are going to "divide" the numbers.
        let pivot : Int = numbers[high]
        var i : Int = (low - 1)
        var j : Int = low
        
        repeat
        {
            //if the current number is smaller than the pivot, it is going to be put in the left side of the pivot in the array.
            if (numbers[j] < pivot)
            {
                i = i + 1
                
                swap(numbers: &numbers, firstIndex: i, secondIndex: j)
            }
            
            j = j + 1
            
        } while (j <= high - 1)
        
        swap(numbers: &numbers, firstIndex: i+1, secondIndex: high)
        
        partitionIndex = i + 1
        
        quickSort(numbers: &numbers, low: low, high: partitionIndex - 1) // the numbers smaller than the partioning index.
        quickSort(numbers: &numbers, low: partitionIndex + 1, high: high) // the numbers greater than the partioning index.
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

quickSort(numbers: &arrayNumbers, low: 0, high: sizeOfArray - 1)

print("Sorted Array:")
printArrayNumbers(numbers: arrayNumbers)
