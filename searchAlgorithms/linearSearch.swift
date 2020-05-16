// Linear Search Algorithm

/* We search an element in a given array by traversing the array
 * from the start till the desired element is found (or till the
 * end of the array if the element is not present).
 *
 * In the worst case scenario, this algorithm takes O(n) time.
 */



import Foundation


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


//****************************************
//******** Linear Search Function ********
//****************************************

func linearSearch(numbers: inout[Int], numberToSearch: Int)
{
    var indexPosition : Int = 0
    
    // we iterate over the entire array (till the end or until we find the desired element).
    for number in numbers
    {
        if (number == numberToSearch) // compare the element to search with each element present in the array.
        {
            print("\(numberToSearch) is present at the \(indexPosition) in the array.")
            return // if the element is found, we finish the search.
        }
        
        indexPosition = indexPosition + 1
    }
    
    print("\(numberToSearch) is not present in the array.")
}




//**********************
//******** MAIN ********
//**********************

let sizeOfArray : Int = 20 // the number of items in the desired array.
let numberToSearch = 25 // the number we want to search.

var arrayNumbers = [Int](repeating: 0, count:sizeOfArray)

populateArrayRandomly(sizeArray: sizeOfArray, numbers: &arrayNumbers)

print("Unsorted Array:")
printArrayNumbers(numbers: arrayNumbers)

linearSearch(numbers: &arrayNumbers, numberToSearch: numberToSearch)
