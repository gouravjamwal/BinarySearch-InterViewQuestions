/*
 Find the Rotation Count in Rotated Sorted array
 Consider an array of distinct numbers sorted in increasing order. The array has been rotated (clockwise) k number of times. Given such an array, find the value of k.

 Examples:

 Input : arr[] = {15, 18, 2, 3, 6, 12}
 Output: 2
 Explanation : Initial array must be {2, 3,
 6, 12, 15, 18}. We get the given array after
 rotating the initial array twice.

 Input : arr[] = {7, 9, 11, 12, 5}
 Output: 4

 Input: arr[] = {7, 9, 11, 12, 15};
 Output: 0
 
 Problem Link : https://www.geeksforgeeks.org/find-rotation-count-rotated-sorted-array/
 */

import Foundation

func numberOfTimesASortedArrayIsRotated(array: [Int]) -> Int {
    
    if array.count == 0 {
        return 0
    }
    
    if array.count == 1 {
        return 0
    }
    
    if array.count == 2 {
        if array[0] > array[1] {
            return 1
        }
    }
    
    var start = 0
    var end = array.count - 1
     let n = array.count
    
    while start <= end {
        let mid = start + ((end - start)/2)
        
        let next = (mid + 1) % n
        let previous = (mid + n - 1) % n
        
        if array[mid] <= array[next] && array[mid] <= array[previous] {
            return mid
        }
        
        if array[start] <= array[mid] {
            start = mid + 1
        } else if array[mid] <= array[end] {
            end = mid - 1
        }
    }
    return -1
}

print(numberOfTimesASortedArrayIsRotated(array: [15, 18, 2, 3, 6, 12]))
