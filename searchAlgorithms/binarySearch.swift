// Binary Search Algorithm

/* Description:
        We start with the interval covering the whole array and
        if the element we want to search is smaller than the item in the
        middle of the interval, we narrow the interval to the lower half.
        In the other hand, if the element is greater than the one in the middle
        we narrow the interval to the upper half. We repeatedly check until the
        value is found or the interval is empty.
 
        It is required for the array to be sorted before starting the Binary Search Algorithm.
        Therefore, in this file we also have two functions - quickSort and swap - responsible
        to sort the elements of the array.
 
*/

import Foundation

let numberToSearch : Int = 25 // change here if you want to search for other number.
let sizeOfArray : Int = 20
var partitionIndex : Int = 0

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

// this functions is going to sort the elements of the array.
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


func binarySearch(numbers: inout[Int], numberToSearch: Int)
{
    var m : Int = 0
    var low: Int = 0
    var high : Int = numbers.count - 1
    
    while (low <= high)
    {
        m = low + (high - low) / 2 // calculate the middle element of the array.
        
        if (numbers[m] == numberToSearch) // check if the middle element of the array is the number we want to find.
        {
            print("The element \(numberToSearch) was found at the position \(m) of the array.")
        }
        
        if (numbers[m] < numberToSearch) // if the numberToSearch is greater than the middle element,
        {
            low = m + 1 // we restrict the range to the upper-half.
        }
        else //if the numberToSearch is smaller than the middle element,
        {
            high = m - 1 //we restrict the range to the lower-half.
        }
    }
    
    print("The element \(numberToSearch) was not found.")
}




//*** MAIN ***
var arrayNumbers = [Int](repeating: 0, count:sizeOfArray)

populateArrayRandomly(sizeArray: sizeOfArray, numbers: &arrayNumbers)

print("Unsorted Array:")
printArrayNumbers(numbers: arrayNumbers)

quickSort(numbers: &arrayNumbers, low: 0, high: sizeOfArray - 1)
print("Sorted Array:")
printArrayNumbers(numbers: arrayNumbers)

binarySearch(numbers: &arrayNumbers, numberToSearch: numberToSearch)


