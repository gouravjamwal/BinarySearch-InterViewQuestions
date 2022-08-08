/*
 CEILING OF AN ELEMENT IN A SORTED ARRAY:

 Given a sorted array and a value x, the ceiling of x is the smallest element in array greater than or equal to x, and the floor is the greatest element smaller than or equal to x. Assume than the array is sorted in non-decreasing order. Write efficient functions to find floor and ceiling of x.

 Examples :

 For example, let the input array be {1, 2, 8, 10, 10, 12, 19}
 For x = 0:    floor doesn't exist in array,  ceil  = 1
 For x = 1:    floor  = 1,  ceil  = 1
 For x = 5:    floor  = 2,  ceil  = 8
 For x = 20:   floor  = 19,  ceil doesn't exist in array
 
 Problem Link : https://www.geeksforgeeks.org/ceiling-in-a-sorted-array/
 */

import Foundation

func ceilOfAnElementInASortedArray(array: [Int], element: Int) -> Int {
    var res = -1
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = start + ((end - start)/2)
        if array[mid] == element {
            return mid
        }
        if array[mid] > element {
            res = array[mid]
            end = mid - 1
        } else if array[mid] > element {
            end = mid - 1
        } else if array[mid] < element {
            start = mid + 1
        }
    }
    return res
}

print(ceilOfAnElementInASortedArray(array: [1, 2, 8, 10, 10, 12, 19], element: 5))
