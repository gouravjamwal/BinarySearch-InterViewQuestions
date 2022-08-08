/*
 FIND FIRST AND LAST POSITIONS OF AN ELEMENT IN A SORTED ARRAY:

 Given a sorted array with possibly duplicate elements, the task is to find indexes of first and last occurrences of an element x in the given array.

 Example:

 Input : arr[] = {1, 3, 5, 5, 5, 5 ,67, 123, 125}
         x = 5
 Output : First Occurrence = 2
          Last Occurrence = 5
 
 Problem Link : https://www.geeksforgeeks.org/find-first-and-last-positions-of-an-element-in-a-sorted-array/
 */

import Foundation

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

print(firstOccurence(array: [1, 3, 5, 5, 5, 5 ,67, 123, 125], element: 5))
print(lastOccurence(array: [1, 3, 5, 5, 5, 5 ,67, 123, 125], element: 5))
