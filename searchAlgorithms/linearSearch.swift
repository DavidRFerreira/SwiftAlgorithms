// Quick Sort Algorithm

/* Description of the Algorithm:
        We search an element in a given array by traversing the array
        from the starting, till the desired element is found.
 */

import Foundation

let sizeOfArray : Int = 20
let numberToSearch = 25 // change here if you want to search for other number.


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


func linearSearch(numbers: inout[Int], numberToSearch: Int)
{
    var indexPosition : Int = 0
    
    for number in numbers
    {
        if (number == numberToSearch)
        {
            print("\(numberToSearch) is present at the \(indexPosition) in the array.")
            return
        }
        
        indexPosition = indexPosition + 1
    }
    
    print("\(numberToSearch) is not present in the array.")
}




//*** MAIN ***
var arrayNumbers = [Int](repeating: 0, count:sizeOfArray)

populateArrayRandomly(sizeArray: sizeOfArray, numbers: &arrayNumbers)

print("Unsorted Array:")
printArrayNumbers(numbers: arrayNumbers)

linearSearch(numbers: &arrayNumbers, numberToSearch: numberToSearch)
