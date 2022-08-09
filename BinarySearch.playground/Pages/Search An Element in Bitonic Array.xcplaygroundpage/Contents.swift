/*
 FIND AN ELEMENT IN BITONIC ARRAY:

 Given a bitonic sequence of n distinct elements, write a program to find a given element x in the bitonic sequence in O(log n) time. A Bitonic Sequence is a sequence of numbers which is first strictly increasing then after a point strictly decreasing.

 Examples:

 Input :  arr[] = {-3, 9, 8, 20, 17, 5, 1};
          key = 20
 Output : Found at index 3
 
 Problem Link : https://www.geeksforgeeks.org/find-element-bitonic-array/
 
 */

import Foundation

func findAnElementInBitonicArray(array: [Int], target: Int) -> Int {
    let midIndex = findPeakElement(array: array)
    let bs1 = binarySearch(array: array, element: target, start: 0, end: midIndex-1)
    let bs2 = binarySearch(array: array, element: target, start: midIndex, end: array.count-1)
    if bs1 != -1 {
        return bs1
    }
    return bs2
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
                return mid
            } else if array[mid-1] > array[mid] {
                end = mid - 1
            } else {
                start = mid + 1
            }
        } else if mid == 0 {
            if array[0] > array[1] {
                return 0
            } else {
                return 1
            }
        } else if mid == array.count-1 {
            if array[array.count-1] > array[array.count-2] {
                return array.count-1
            } else {
                return array.count-2
            }
        }
    }
    return -1
}
func binarySearch(array: [Int], element: Int, start: Int, end: Int)  -> Int {
    
    var start = start
    var end = end
    
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

func binarySearchOnDescendingSortedArray(array: [Int], element: Int, start: Int, end: Int) -> Int {
    var start = start
    var end = end
    
    while start <= end {
        let mid = start + ((end - start)/2)
        
        if element == array[mid] {
            return mid
        } else if element < array[mid] {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return -1
}

print(findAnElementInBitonicArray(array: [1, 3, 8, 12, 4, 2], target: 4))
