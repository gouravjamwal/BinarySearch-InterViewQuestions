/*
 BINARY SEARCH ON REVERSE SORTED ARRAY:

 Let's suppose that we have an array sorted in descending order and we want to find index of an element e within this array. Binary search in every step picks the middle element (m) of the array and compares it to e. If these elements are equal, than it returns the index of m. If e is greater than m, than e must be located in the left subarray. On the contrary, if m greater than e, e must be located in the right subarray. At this moment binary search repeats the step on the respective subrarray.

 Because the algoritm splits in every step the array in half (and one half of the array is never processed) the input element must be located (or determined missing) in at most \\log_{2}{n} steps.
 */

import UIKit

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

print(binarySearchOnDescendingSortedArray(array: [20, 18, 16, 14, 12, 10, 8, 6, 4, 2], element: 4))

