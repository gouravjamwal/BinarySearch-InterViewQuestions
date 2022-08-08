/*
 FIND AN ELEMENT IN A ROTATED SORTED ARRAY:

 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 You are given a target value to search. If found in the array return its index, otherwise return -1.

 You may assume no duplicate exists in the array.

 Your algorithm's runtime complexity must be in the order of O(log n).

 Example:

 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 
 Problem Link : https://leetcode.com/problems/search-in-rotated-sorted-array/
 
 */

import Foundation

func findAnElementInARotatedSortedArray(array: [Int], target: Int) -> Int {
    let midIndex = findMinIndex(array: array)
    let bs1 = binarySearch(array: array, element: target, start: 0, end: midIndex-1)
    let bs2 = binarySearch(array: array, element: target, start: midIndex, end: array.count-1)

    if bs1 != -1 {
        return bs1
    }
    return bs2
}

func findMinIndex(array: [Int]) -> Int {
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
    var index = -1
    
    while start <= end {
        let mid = start + ((end - start)/2)
        
        let next = (mid + 1) % n
        let previous = (mid + n - 1) % n
        
        if array[mid] <= array[previous] && array[mid] <= array[next] {
            index = mid
            break
        }else if array[mid] < array[end] {
            end = mid - 1
        } else if array[mid] > array[end]{
            start = mid + 1
        }
    }
    return index
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

print(findAnElementInARotatedSortedArray(array: [4,5,6,7,0,1,2], target: 0))
