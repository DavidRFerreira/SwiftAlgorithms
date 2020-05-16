// Quick Sort Algorithm

/* This an is a Divide and Conquer Algorithm.
 * It starts by picking an element of the array as the pivot. Then it divides the array in
 * two subarrays (elements smaller than the pivot and elements greater than the pivot).
 * Then, the quickSort algorithm calls itself recursively twice to sort the two resulting subarrays.
 * There are many different versions of the Quick Sort that pick pivot in different ways.
 *
 * The worst-case scenario, takes O(n^2) time.
*/

/* There are many different ways to implement this algorithm.
 *
 * This specific implementation always picks the last element of the array as the pivot.
 * For efficiency purposes, you should consider picking the middle element or to calculate
 * the median of the first, middle and last element and use it as the pivot.
 *
 * If you want to increse this algorithm's performance even more, you should switch for an
 * algorithm like InsertionSort when the resulted subarray is very small (less than 7-10 items).
 *
 * In order to make this algorithm stable, you should consider divide the array not in two
 * subarrays but in three: numbers smaller than the pivot, numbers greater than the pivot and
 * numbers that are equal to the pivot.
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




//*************************************
//******** QuickSort Functions ********
//*************************************

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
            //if the current number is smaller than the pivot, it is going to be placed on the left side of the pivot.
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

print("Unsorted Array:")
printArrayNumbers(numbers: arrayNumbers)

quickSort(numbers: &arrayNumbers, low: 0, high: sizeOfArray - 1)

print("Sorted Array:")
printArrayNumbers(numbers: arrayNumbers)
