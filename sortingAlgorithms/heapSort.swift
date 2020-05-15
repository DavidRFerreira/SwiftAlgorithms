// HeapSort Algorithm

/* This sorting algorithm works by firstly inserting an unordered list on a heap and then by repeatedly
 * changing the first element with the last element on the heap and reducing the heaps' size by 1.
 * After this, the heap is reorganized (heapified) and the process is repeated.
 * HeapSort takes in the worst case scenario O(n lg n).
 */

/* For this specific implementation we use a Max-Heap (the root's key is
 * greater than it's children' keys.
 */



import Foundation



let sizeOfArray : Int = 20



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



//************************************
//******** HeapSort Functions ********
//************************************

// Move down the root node item to its correct place.
func heapify(numbers: inout[Int], n : Int, i : Int)
{
    var largest : Int = i // we initially consider the root as the greatest element.
    let left : Int = 2*i + 1 // the index of the root's left children.
    let right : Int = 2*i + 2 // the index of the root's right children.
    
    // If left child is greater than the root.
    if (left < n && numbers[left] > numbers[largest])
    {
        largest = left
    }
    
    // If right child is greater than the root.
    if (right < n && numbers[right] > numbers[largest])
    {
        largest = right
    }
    
    // If one of the root's children is bigger than the root itself.
    // This will be true, if one of the last two if statements was also true.
    if (largest != i)
    {
        // Swap the places of the root item and its largest children.
        swap(numbers: &numbers, firstIndex: i, secondIndex: largest)
        
        // We call recursively this function again.
        heapify(numbers: &numbers, n: n, i: largest)
    }
    
    // This function ends when none of the children is greater than the root.
}


// Swap the position of the items in the index passed as arguments.
func swap(numbers: inout[Int], firstIndex: Int, secondIndex: Int)
{
    var numTemp : Int = 0
    
    numTemp = numbers[firstIndex]
    numbers[firstIndex] = numbers[secondIndex]
    numbers[secondIndex] = numTemp
}



func heapsort(numbers : inout[Int], n : Int)
{
    var start : Int = n / 2 - 1
    
    // Transform the unsorted array into a heap.
    for i in stride(from: start, through: 0, by: -1)
    {
        heapify(numbers: &numbers, n: n, i: i)
    }
    
    start = n - 1
    
    // Extract an element from the heap, one by one.
    for i in stride(from: start, to: 0, by: -1)
    {
        // We move the current root (the largest item) to the end.
        swap(numbers: &numbers, firstIndex: 0, secondIndex: i)
        
        // Call max heapify to rearrange the reduced heap.
        heapify(numbers: &numbers, n: i, i: 0)
    }
}





//**********************
//******** MAIN ********
//**********************
var arrayNumbers = [Int](repeating: 0, count:sizeOfArray)

populateArrayRandomly(sizeArray: sizeOfArray, numbers: &arrayNumbers)

print("Unsorted Array:")
printArrayNumbers(numbers: arrayNumbers)

heapsort(numbers: &arrayNumbers, n: arrayNumbers.count)

print("Sorted Array:")
printArrayNumbers(numbers: arrayNumbers)

