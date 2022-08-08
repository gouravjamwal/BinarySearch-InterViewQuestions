/*
 
 Given a sorted array arr[] of n elements, write a function to search a given element x in arr[].

 Binary Search: Search a sorted array by repeatedly dividing the search interval in half. Begin with an interval covering the whole array. If the value of the search key is less than the item in the middle of the interval, narrow the interval to the lower half. Otherwise narrow it to the upper half. Repeatedly check until the value is found or the interval is empty.
 
 arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
 element = 2
 Find the index of the element
 
 Output -> 1
 */

import Foundation

func binarySearch(array: [Int], element: Int)  -> Int {
    
    var start = 0
    var end = array.count - 1
    while start <= end {
        
        let mid = start + ((end - start)/2) //Inorder to prevent integer overflow
        if element == array[mid] {
           return mid
        } else if element < array[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return -1
}

print(binarySearch(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], element: 2))
