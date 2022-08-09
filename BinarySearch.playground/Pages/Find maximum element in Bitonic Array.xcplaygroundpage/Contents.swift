/*
 FIND MAXIMUM ELEMENT IN AN BITONIC ARRAY:

 Problem statement:
 Given a bitonic array find the maximum value of the array. An array is said to be bitonic if it has an increasing sequence of integers followed immediately by a decreasing sequence of integers.

 Example:

 Input:
 1 4 8 3 2

 Output:
 8
 
 Problem Link : https://www.includehelp.com/icp/maximum-value-in-a-bitonic-array.aspx
 */

import Foundation

func findMaximumElementInBitonicArray(array: [Int]) -> Int {
    return findPeakElement(array: array)
}

func findPeakElement(array: [Int]) -> Int {
    
    if array.count == 0 {
        return -1
    }
    
    if array.count == 1 {
        return 0
    }
    
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        
        let mid = start + ((end - start)/2)
        
        if mid > 0 && mid < array.count - 1 {
            if array[mid] > array[mid-1] && array[mid] > array[mid+1] {
                return array[mid]
            } else if array[mid-1] > array[mid] {
                end = mid - 1
            } else {
                start = mid + 1
            }
        } else if mid == 0 {
            if array[0] > array[1] {
                return array[0]
            } else {
                return array[1]
            }
        } else if mid == array.count-1 {
            if array[array.count-1] > array[array.count-2] {
                return array[array.count-1]
            } else {
                return array[array.count-2]
            }
        }
    }
    return -1
}

print(findMaximumElementInBitonicArray(array: [1, 4, 8, 3, 2]))
