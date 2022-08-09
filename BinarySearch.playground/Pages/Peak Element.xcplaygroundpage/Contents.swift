/*
 FIND PEAK ELEMENT IN AN ARRAY:

 A peak element is an element that is greater than its neighbors.

 Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

 The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

 You may imagine that nums[-1] = nums[n] = -∞.

 Example :

 Input: nums = [1,2,3,1]
 Output: 2
 Explanation: 3 is a peak element and your function should return the index number 2.

 Problem Link : https://leetcode.com/problems/find-peak-element/
 */

import Foundation

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

print(findPeakElement(array: [1,2,3,1]))
print(findPeakElement(array: [1,2,1,3,5,6,4]))
print(findPeakElement(array: [1,2]))
print(findPeakElement(array: [1,2,3,4,3,2]))
