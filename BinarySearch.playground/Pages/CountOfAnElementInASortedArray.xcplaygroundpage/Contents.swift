/*
 COUNT NUMBER OF OCURRENCES(or frequency) IN A SORTED ARRAY:

 Given a sorted array arr[] and a number x, write a function that counts the occurrences of x in arr[]. Expected time complexity is O(Logn)
 Examples:

   Input: arr[] = {1, 1, 2, 2, 2, 2, 3,},   x = 2
   Output: 4 // x (or 2) occurs 4 times in arr[]

   Input: arr[] = {1, 1, 2, 2, 2, 2, 3,},   x = 3
   Output: 1
 
   Problem Link : https://www.geeksforgeeks.org/count-number-of-occurrences-or-frequency-in-a-sorted-array/
 */
import Foundation

func countOfAnElementInASortedArray(array: [Int], element: Int) -> Int {

    let first = firstOccurence(array: array, element: element)
    let last = lastOccurence(array: array, element: element) 
    return last - first + 1
}

func firstOccurence(array: [Int], element: Int) -> Int {
    var start = 0
    var end = array.count - 1
    var res = -1
    while start <= end {
        
        let mid = start + ((end - start)/2) //Inorder to prevent integer overflow
        if element == array[mid] {
           res = mid
           end = mid - 1
        } else if element < array[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return res
}

func lastOccurence(array: [Int], element: Int) -> Int {
    var start = 0
    var end = array.count - 1
    var res = -1
    while start <= end {
        
        let mid = start + ((end - start)/2) //Inorder to prevent integer overflow
        if element == array[mid] {
           res = mid
           start = mid + 1
        } else if element < array[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return res
}

print(countOfAnElementInASortedArray(array: [1, 1, 2, 2, 2, 2, 3], element: 2))
