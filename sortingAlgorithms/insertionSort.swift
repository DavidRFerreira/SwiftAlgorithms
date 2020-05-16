// Insertion Sort Algorithm

/* This algorithm consumes one element (from the unsorted part of the array) each iteration 
 * and places it in the right place of the sorted part of the array. This requires all elements
 * on the right-side of the new position to be shifted one position to the right.
 * 
 * In the worst-case scenario, this algorithm takes O(n^2).
*/


import Foundation


let sizeOfArray : Int = 20
var partitionIndex: Int = 0



//*************************************
//******** Auxiliary Functions ********
//*************************************

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





//*****************************************
//******** InsertionSort Functions ********
//*****************************************
func insertionSort(numbers: inout[Int])
{
   // Find the right place for every element, one by one.
   for x in 1..<numbers.count
   {
      var key = x // the index of the element for each we are now going to find the right place.
      
      while (key > 0 && x[key] < x[key - 1])
      {
         swap(numbers: &numbers, firstIndex: key-1, secondIndex: key)
         y = y - 1
      }
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

insertionSort(numbers: &arrayNumbers, low: 0, high: sizeOfArray - 1)

print("Sorted Array:")
printArrayNumbers(numbers: arrayNumbers)
