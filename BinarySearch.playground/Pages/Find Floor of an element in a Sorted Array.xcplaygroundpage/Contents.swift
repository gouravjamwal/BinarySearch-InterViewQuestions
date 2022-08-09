/*
 FIND FLOOR OF AN ELEMENT IN A SORTED ARRAY:

 Given a sorted array and a value x, the floor of x is the largest element in array smaller than or equal to x. Write efficient functions to find floor of x.

 Example:

 Input : arr[] = {1, 2, 8, 10, 10, 12, 19}, x = 5
 
 Output : 2
 
 2 is the largest element in arr[] smaller than 5.
 
 Problem Link : https://www.geeksforgeeks.org/floor-in-a-sorted-array/
 */

import Foundation

func findFloorOfAnElementInASortedArray(array: [Int], element: Int) -> Int {
    var res = -1
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = start + ((end - start)/2)
        if array[mid] == element {
            return mid
        }
        if array[mid] < element {
            res = array[mid]
            start = mid + 1
        } else if array[mid] > element {
            end = mid - 1
        } else if array[mid] < element {
            start = mid + 1
        }
    }
    return res
}

print(findFloorOfAnElementInASortedArray(array: [1, 2, 8, 10, 10, 12, 19], element: 5))

