/*
 Given a sorted array of numbers, find if a given number ‘key’ is present in the array. Though we know that the array is sorted, we don’t know if it’s sorted in ascending or descending order. . 
 */

import Foundation

func orderAgnosticSearch(array: [Int], element: Int) -> Int {
    if array.count == 0 {
        return -1
    }
    if array.count == 1 {
        return 0
    }
    
    if array[0] < array[1] {
        return binarySearch(array: array, element: element)
    } else {
        return binarySearchOnDescendingSortedArray(array: array, element: element)
    }
}

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

func binarySearchOnDescendingSortedArray(array: [Int], element: Int) -> Int {
    var start = 0
    var end = array.count - 1
    
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

print(binarySearch(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], element: 2))
print(binarySearchOnDescendingSortedArray(array: [20, 18, 16, 14, 12, 10, 8, 6, 4, 2], element: 4))
